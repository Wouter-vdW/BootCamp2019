
#======================================================================
#
#     This routine solves an infinite horizon growth model
#     with dynamic programming and sparse grids
#
#     The model is described in Scheidegger & Bilionis (2017)
#     https://papers.ssrn.com/sol3/papers.cfm?abstract_id=2927400
#
#     external libraries needed:
#     - IPOPT (https://projects.coin-or.org/Ipopt)
#     - PYIPOPT (https://github.com/xuy/pyipopt)
#     - TASMANIAN (http://tasmanian.ornl.gov/)
#
#     Simon Scheidegger, 11/16 ; 07/17
#======================================================================

#import nonlinear_solver_initial as solver     #solves opt. problems for terminal VF
#import nonlinear_solver_iterate as solviter   #solves opt. problems during VFI
#import nonlinear_solver_iterate as solveriter   #solves opt. problems during VFI
from parameters import *                      #parameters of model
import interpolation as interpol              #interface to sparse grid library/terminal VF
import interpolation_iter as interpol_iter    #interface to sparse grid library/iteration
import postprocessing as post                 #computes the L2 and Linfinity error of the model

import TasmanianSG                            #sparse grid library
import numpy as np
#======================================================================

#======================================================================
# Start with Value Function Iteration

# terminal value function
tempVal = [] ##new for zz stochastics

if (numstart==0):
    print("VF Initialization:", numstart)
    for zz in range(num_states): ## added zz stochastics loop
        valnew=TasmanianSG.TasmanianSparseGrid()
        #valnew=interpol.sparse_grid(n_agents, iDepth)
        #valnew=sparse_grid(n_agents, iDepth)
        valnew=interpol.adap_sparse_grid(n_agents, iDepth, num_states) # added zz stochastics
        valnew.write("valnew_1." + str(numstart) + ".txt") #write file to disk for restart
        tempVal.append(valnew) ##new for zz stochastics

# value function during iteration
else:
    valnew.read("valnew_1." + str(numstart) + ".txt")  #write file to disk for restart

tempValold = [] ##new for zz stochastics
for zz in range(num_states): ## added zz stochastics loop
    valold=TasmanianSG.TasmanianSparseGrid()
    valold=tempVal[zz]
    tempValold.append(valold)

for i in range(numstart, numits):
    print("Iteration number:", i+1)
    tempVal = [] ##new for zz stochastics
    for zz in range(num_states): ## added zz stochastics loop
        valnew=TasmanianSG.TasmanianSparseGrid()
        #valnew=interpol_iter.sparse_grid_iter(n_agents, iDepth, valold)
        #valnew=sparse_grid_iter(n_agents, iDepth, valold)
        valnew=interpol_iter.adap_sparse_grid_iter(n_agents, iDepth, tempValold,i,numits,num_states,zz)
        tempVal.append(valnew)
    tempValold = []
    for zz in range(num_states): ## added zz stochastics loop
        valold=TasmanianSG.TasmanianSparseGrid()
        valold=tempVal[zz]
        tempValold.append(valold)
        #valnew.write("valnew_1." + str(i+1) + ".txt")

#======================================================================
print( "===============================================================")
print( " " )
print( " Computation of a growth model of dimension ", n_agents ," finished after ", numits, " steps")
print( " " )
print( "===============================================================")
#======================================================================

# compute errors
avg_err=post.ls_error(n_agents, numstart, numits, No_samples)

#======================================================================
print( "===============================================================")
print( " ")
print( " Errors are computed -- see errors.txt")
print( " ")
print( "===============================================================")
#======================================================================

#======================================================================
#
#     This routine interfaces with the TASMANIAN Sparse grid
#     The crucial part is
#
#     aVals[iI]=solveriter.iterate(aPoints[iI], n_agents)[0]
#     => at every gridpoint, we solve an optimization problem
#
#     Simon Scheidegger, 11/16 ; 07/17
#======================================================================

import TasmanianSG
import numpy as np
from parameters import *
import nonlinear_solver_iterate as solveriter

#======================================================================

def adap_sparse_grid_iter(n_agents, iDepth, valold, itr,numits,num_states,zzz): ## added zz stochastics

    grid  = TasmanianSG.TasmanianSparseGrid()

    k_range=np.array([k_bar, k_up])

    ranges=np.empty((n_agents, 2))

    for i in range(n_agents):
        ranges[i]=k_range

    iDim=n_agents
    iOut=1

    grid.makeLocalPolynomialGrid(iDim, iOut, iDepth, which_basis, "localp")
    grid.setDomainTransform(ranges)

    aPoints=grid.getPoints()
    iNumP1=aPoints.shape[0]
    aVals=np.empty([iNumP1, 1])
    #aVals1=np.empty([iNumP1, 1]) #NEW

    ##new block for adaptive grid ######################################
    for iI in range(iNumP1):
        print("this is iI:", iI)
        aValTemp = float(0.)
        #aValTemp = solveriter.iterate(aPoints[iI], n_agents, valold)[0]
        for zz in range(num_states): ## added zz stochastics loop
            print("this is zz:", zz)
            aValTemp += (1./num_states) * iterate(aPoints[iI], n_agents, valold[zz], zz)[0]
            #aValTemp = (1/num_states) * iterate(aPoints[iI], n_agents, valold[zz], zz)[0]
            print(aValTemp)
        aVals[iI]=aValTemp
        print(aVals[iI])

    grid.loadNeededPoints(aVals)

    print("- State:", zzz)
    for ik in range(refinement_level): #refinement level
        print("-- Refinement level:", ik)
        grid.setSurplusRefinement(fTol, 1, "fds")   #use fds
        aPoints = grid.getNeededPoints()
        iNumP1=aPoints.shape[0]
        aVals=np.empty([iNumP1, 1])

        file=open("comparison1.txt", 'w')
        for iI in range(iNumP1):
            print("this is iI:", iI)
            aValTemp = float(0.)
            #aValTemp = solveriter.iterate(aPoints[iI], n_agents, valold)[0]
            for zz in range(num_states): ## added zz stochastics loop
                print("this is zz:", zz)
                #aValTemp += (1/num_states) * iterate(aPoints[iI], n_agents, valold[zz], zz)[0]
                aValTemp += (1./num_states) * iterate(aPoints[iI], n_agents, valold[zz], zz)[0]
                print(aValTemp)
            aVals[iI]=aValTemp
            print(aVals[iI])
            v=aVals[iI]*np.ones((1,1))
            to_print=np.hstack((aPoints[iI].reshape(1,n_agents), v))
            np.savetxt(file, to_print, fmt='%2.16f')

        ##uptil here #######################################################

        file.close()
        grid.loadNeededPoints(aVals)

    #if zzz == 1:
    #    grid.plotPoints2D() ## THIS WORKS HUURAY
    #    grid.plotResponse2D()

    f=open("grid_iter.txt", 'w')
    np.savetxt(f, aPoints, fmt='% 2.16f')
    f.close()

    if itr == numits-1:
        grid.plotPoints2D()
        grid.plotResponse2D()

    #if itr == numits-1 and zzz == num_states-1:
    #if itr == 0 and zzz == 2:
        #grid2 = TasmanianSG.TasmanianSparseGrid()
        #grid2.makeLocalPolynomialGrid(iDim, iOut, refinement_level+iDepth, which_basis, "localp")
        #a = grid2.getNumPoints()
        #print "   a fix sparse grid of level ", refinement_level+iDepth, " would consist of " ,a, " points"

        #grid.plotPoints2D()

        #from matplotlib import pyplot as plt
        #plt.figure(figsize=(4, 4))
        #plt.scatter(aPoints[:,0],aPoints[:,1])
        #plt.show()

        #grid.plotResponse2D()

    return grid

#======================================================================

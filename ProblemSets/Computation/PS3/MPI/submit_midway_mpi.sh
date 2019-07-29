#!/bin/bash -l
# a sample job submission script to submit a job to the sandyb partition on Midway1

# send output to calc_pi_mc.out
#SBATCH --output=mpi_test.out
#SBATCH --error=mpi_test.err

# this job requests 1 core. Cores can be selected from various nodes.
#SBATCH --ntasks=16

#SBATCH --time=00:02:00

# there are many partitions on Midway1 and it is important to specify which
# partition you want to run your job on. Not having the following option, the
# broadwl partition on Midway1 will be selected as the default partition
#SBATCH --partition=broadwl



# Run the process 
mpiexec -np $SLURM_NTASKS ./allreduce.exe

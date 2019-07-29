#!/bin/bash
# a sample job submission script to submit a hybrid MPI/OpenMP job to the sandyb 
# partition on Midway1 please change the --partition option if you want to use 
# another partition on Midway1

#SBATCH --time=00:05:00

# set the job name to test
#SBATCH --job-name=test3

# send output to test3.out
#SBATCH --output=test3.out

# MPI nodes
#SBATCH --nodes=5
#SBATCH --tasks-per-node=4

# and request 16 cpus per task for OpenMP threads
#SBATCH --cpus-per-task=4

# this job will run in the sandyb partition on Midway1
#SBATCH --partition=broadwl

# load the openmpi default module
module load openmpi

# set OMP_NUM_THREADS to the number of --cpus-per-task we asked for
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

# Run the process with mpirun. Notice -n is not required. mpirun will
# automatically figure out how many processes to run from the slurm options
mpirun ./VFI

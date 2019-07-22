#!/bin/bash
# a sample job submission script to submit a job to the sandyb partition on Midway1

# set the job name to hello
#SBATCH --job-name=calc_pi

# send output to calc_pi.out
#SBATCH --output=calc_pi.out
#SBATCH --error=calc_pi.err

# this job requests 1 core. Cores can be selected from various nodes.
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=00:05:00

# there are many partitions on Midway1 and it is important to specify which
# partition you want to run your job on. Not having the following option, the
# broadwl partition on Midway1 will be selected as the default partition
#SBATCH --partition=broadwl







# Run the process 
./calc_pi.exe

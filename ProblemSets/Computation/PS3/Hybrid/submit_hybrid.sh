#!/bin/bash -l

#SBATCH --job-name=pi_hybrid
#SBATCH --output=pi_hybrid.out
#SBATCH --error=pi_hybrid.err
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=8
#SBATCH --partition=broadwl
#SBATCH --time=00:05:00

module load openmpi

### MPI executable
mpiexec -np $SLURM_NTASKS ./pi_hybrid.exe

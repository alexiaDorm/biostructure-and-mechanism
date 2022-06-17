#!/bin/bash -l

#SBATCH --job-name="G12C"
#SBATCH --error="G12C.err"
#SBATCH --output="G12C.out"
#SBATCH --nodes 1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=3-0
#SBATCH --chdir /scratch/dormann/biostructure-and-mechanism/Y96C/amber
#SBATCH --mem 64G
#SBATCH --mail-type=END
#SBATCH --mail-user=alexia.dormann@epfl.ch
 
echo STARTING AT `date`

#Load proper amber tools
module load gcc/8.4.0
module load mvapich2/2.3.4
module load amber/18.20-mpi

source run.sh
 
echo FINISHED at `date`


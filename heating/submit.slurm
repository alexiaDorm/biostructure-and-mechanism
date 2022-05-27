#!/bin/bash -l

#SBATCH --job-name="heat"
#SBATCH --error="heat.err"
#SBATCH --output="heat.out"
#SBATCH --nodes 1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=3-0
#SBATCH --chdir /scratch/dormann/biostructure-and-mechanism/minimization
#SBATCH --mem 64G
#SBATCH --mail-type=END
#SBATCH --mail-user=alexia.dormann@epfl.ch
 
echo STARTING AT `date`
      
module unload amber/12
module load amber/11

srun pmemd.MPI -O -i heat.in -p complex.prmtop -c minimized.nc -ref complex.inpcrd -r heated.nc -o mdout 
 
echo FINISHED at `date`


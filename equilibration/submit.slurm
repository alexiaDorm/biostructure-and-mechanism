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

srun pmemd.cuda -O -i equilibrate_1.in -p complex.prmtop -c heated.nc -ref complex.inpcrd -r equilibrated_1.nc -o equilibration_1.log

pmemd.cuda -O  -i equilibrate_2.in -p complex.prmtop -c equilibrated_1.nc  -r equilibrated_2.nc -o equilibration_2.log
 
echo FINISHED at `date`


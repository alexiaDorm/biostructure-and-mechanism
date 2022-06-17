#!/bin/bash

# This script will permit you to submit all the calculations
# to obtain all the trajectories to analyze the results

# minimization (cpu)
mpirun -np 12 $AMBERHOME/bin/pmemd.MPI -O -i minimize.cpu -o min.log -inf min.info -x min.nc -r min.rst

# Eq
mpirun -np 12 $AMBERHOME/bin/pmemd.MPI -O -i nvt-with-constraints.cpu -o eq1.log -inf eq1.info -x eq1.nc -c min.rst -r eq1.rst

mpirun -np 12 $AMBERHOME/bin/pmemd.MPI -O -i npt-with-constraints.cpu -o npt1.log -inf npt1.info -x npt1.nc -c eq1.rst -r npt1.rst

mpirun -np 12 $AMBERHOME/bin/pmemd.MPI -O -i nvt-no-constraints.cpu -o eq2.log -inf eq2.info -x eq2.nc -c npt1.rst -r eq2.rst

mpirun -np 12 $AMBERHOME/bin/pmemd.MPI -O -i npt-no-constraints.cpu -o npt2.log -inf npt2.info -x npt2.nc -c eq2.rst -r npt2.rst

# prod1: short CPU run 
mpirun -np 12 $AMBERHOME/bin/pmemd.MPI -O -i prod1.cpu -o prod1.log -inf prod1.info -x prod1.nc -c npt2.rst -r prod1.rst 

# prod2 on GPU
export CUDA_VISIBLE_DEVICES=0 # ID of GPU to use
$AMBERHOME/bin/pmemd.cuda -O -i prod2.gpu -o prod2.log -inf prod2.info -x prod2.nc -c prod1.rst -r prod2.rst &


#!/bin/csh
#

# Generated by CHARMM-GUI (http://www.charmm-gui.org) v3.7
#
# All input files were optimized for AMBER16 or above, so lower version of AMBER can cause some errors.
# In this script, the parallel (MPI) version is commented out. Use this line for parallel execution instead
# (adjust for your MPI and the number of CPUs you want to use). Alternatively, if you have access to
# pmemd.cuda or are willing to use sander, you can replace "pmemd" with pmemd.cuda or sander and "pmemd.MPI"
# with pmemd.cuda.MPI or sander.MPI
#
# There is a known issue in current CHARMM-GUI AMBER inputs with "sander".
# If you are willing to use "sander" for your simulation, please remove "&end" line in all minimization / equilibration
# inputs.

#set amber = pmemd
#set amber = "mpirun -np 1 $AMBERHOME/bin/pmemd.MPI"

set init = step3_input
set mini_prefix = step4.0_minimization
set equi_prefix = step4.1_equilibration
set prod_prefix = step5_production
set prod_step   = step5

# Minimization
# In the case that there is a problem during minimization using a pmemd.cuda, please try to use pmemd only for
# the minimization step.
#pmemd -O -i step4.0_minimization.mdin -p step3_input.parm7 -c step3_input.rst7 -o step4.0_minimization.mdout -r step4.0_minimization.rst7 -inf step4.0_minimization.mdinfo -ref step3_input.rst7


# Equilibration
pmemd -O -i step4.1_equilibration.mdin -p step3_input.parm7 -c step3_input.rst7 -o step4.1_equilibration.mdout -r step4.1_equilibration.rst7 -inf step4.1_equilibration.mdinfo -ref step3_input.rst7 -x step4.1_equilibration.nc


# Production
set cnt    = 1
set cntmax = 10

#while ( ${cnt} <= ${cntmax} )
    #@ pcnt = ${cnt} - 1
    #set istep = ${prod_step}_${cnt}
    #set pstep = ${prod_step}_${pcnt}

    #${amber} -O -i ${prod_prefix}.mdin -p ${init}.parm7 -c ${pstep}.rst7 -o ${istep}.mdout -r ${istep}.rst7 -inf ${istep}.mdinfo -x ${istep}.nc
    #@ cnt += 1



#Load proper amber tools
module load gcc/8.4.0
module load mvapich2/2.3.4
module load amber/18.20-mpi

#Generate .mol2 and .frcmod files for the ligand
antechamber -fi pdb -fo mol2 -i inhibitor.pdb -o inhibitor.mol2 -c bcc -nc 0 -m 1
parmchk2 -f mol2 -i inhibitor.mol2 -o inhibitor.frcmod
antechamber -i inhibitor.mol2 -fi mol2 -o fixed_inhibitor.mol2 -fo mol2 -pf y -att gaff -c bcc
parmchk2 -f mol2 -i fixed_inhibitor.mol2 -o fixed_inhibitor.parmchk

#Combine the protein and PDB files 
cat KRAS_G12C_Y96C.pdb inhibitor.pdb > KRAS_inhibitor.pdb

#Generate .prmtop and .inpcrd for ligand
source leapprc.ff99SB
source leaprc.gaff

inhibitor = loadmol2 fixed_inhibitor.mol2
check inhibitor
loadamberparm fixed_inhibitor.parmchk 
saveoff inhibitor inhibitor.lib
saveamberparm inhibitor inhibitor.prmtop inhibitor.inpcrd

#Generate topology and coordinate files of the system
tleap -f KRAS_tleap.in > KRAS_tleap.out

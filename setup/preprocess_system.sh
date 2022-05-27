#Load proper amber tools
module load amber

#Generate .mol2 and .frcmod files for the ligand
antechamber -fi pdb -fo mol2 -i inhibitor.pdb -o inhibitor.mol2 -c bcc -nc 0 -m 1
parmchk2 -f mol2 -i inhibitor.mol2 -o inhibitor.frcmod

#Combine the protein and PDB files 
cat KRAS_G12C_Y96C.pdb inhibitor.pdb > KRAS_inhibitor.pdb

#Generate topology and coordinate files of the system
tleap11 -f KRAS_tleap.in > KRAS_tleap.out

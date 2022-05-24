#Load proper amber tools
module unload amber/12
module load amber/11

#Add protons to the ligand
reduce inhibitor.pdb > inhibitor.pdb
pdb4amber -i inhibitor.pdb -o inhibitor_H.pdb

#Generate .mol2 and .frcmod files for the ligand
antechamber -fi pdb -fo prepi -i inhibitor_H.pdb -o inhibitor_H.prepi -rn inhibitor -c bcc -pf y
parmchk2 -f prepi -i inhibitor_H.prepi -o inhibitor.frcmod

#Combine the protein and PDB files 
cat KRAS_G12C_Y96C.pdb inhibitor_H.pdb > KRAS_H.pdb
pdbamber -i KRAS_H.pdb -o KRAS_H_clean.pdb

#Generate topology and coordinate files of the system
tleap -s -f KRAS_tleap.in > KRAS_tleap.out

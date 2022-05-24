#Load leaprc files 
source leaprc.protein.ff14SB 
source leaprc.gaff 
source leaprc.water.tip3p 

#Load ligand files
loadamberprep inhibitor_H.prepi 
loadamberparams inhibitor.frcmod 

#Load complex ligand-protein pdb file
complex = loadpdb KRAS_H_clean.pdb 

#Neutralize system 
charge complex
addions2 complex Cl- 0 #charge complex > 0
addions2 complex Na+ 0 #charge complex < 0

#Solvate system
solvatebox complex TIP3PBOX 12.0
setBox complex centers

#Add 150mmol/L of NaCl
addions2 complex Na+ 45
addions2 complex Cl- 45

#Save topology and coordinates files of system
saveamberparm complex complex.prmtop complex.inpcrd
savepdb complex final.pdb

quit 
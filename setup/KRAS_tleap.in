#Load leaprc files 
source leaprc.protein.ff14SB 
source leaprc.gaff 
source leaprc.water.tip3p 

#Load ligand files
loadamberprep inhibitor.mol2
loadamberparams inhibitor.frcmod 

#Load complex ligand-protein pdb file
complex = loadpdb KRAS_inhibitor.pdb 

#Neutralize system 
charge complex
addions2 complex Cl- 0 #charge complex > 0
addions2 complex Na+ 0 #charge complex < 0

#Solvate system
solvatebox complex TIP3PBOX 12.0
setBox complex centers

#Add 150mmol/L of NaCl, Need to compute X using size of box
addions2 complex Na+ X
addions2 complex Cl- X

#Save topology and coordinates files of system
saveamberparm complex complex.prmtop complex.inpcrd
savepdb complex final.pdb

quit 
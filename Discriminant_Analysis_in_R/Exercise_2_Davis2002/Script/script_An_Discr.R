### AN�LISIS DISCRIMINANTE ###

library(MASS)
#Leemos los datos
datos<-read.table("datos.txt",header=T,blank.lines.skip=F)
predecir<-read.table("clasificar.txt",header=T,blank.lines.skip=F)
# An�lsis discriminatante.
source("AD.R");
### ANÁLISIS DISCRIMINANTE ###

library(MASS)
#Leemos los datos
datos<-read.table("datos.txt",header=T,blank.lines.skip=F)
predecir<-read.table("clasificar.txt",header=T,blank.lines.skip=F)
# Análsis discriminatante.
source("AD.R");
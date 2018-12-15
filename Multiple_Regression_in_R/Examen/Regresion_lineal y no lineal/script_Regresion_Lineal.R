##regresión lineal y multiple 

##Leemos los datos que en este caso están en datos.txt
datos<-read.table("datos.txt",header=T,blank.lines.skip=F)

##Para aplicar regresión lineal múltiple utilizamos la función de R lm()
##Dentro de la función lm indicamos la cuál es la variable dependiente y cuáles las independientes 
## e indicamos también dónde están guardadas esas variables:
## y almacenamos en reg el resultado:

reg<-lm(Y~.,data=datos)

## Y~. indica que la variable dependiente es Y
## ~. indica que el resto de variables son las independientes, 
## y data=datos quiere decir que las variables están almacenadas en datos,
## que es como le hemos llamado al leer el archivo


##los si queremos ver cómo "afecta" cada variable independiente a la variable dependiente:

reg_sum<-summary(reg);reg_sum



## Si vemos que alguna variable independiente no afecta significativamente a las funcion multimple,
##podemos hacer entonces regresión lineal sin ella, indicando cuales si lo son. Por ejemplo:

reg<-lm(Y~X1+X2+X3,data=datos)
reg_sum<-summary(reg);reg_sum


### PREDICCIONES:

#Los valores originales estimados con nuestro modelo:
Y_teor<-reg$fitted.values;
plot(datos$Y,Y_teor)
abline(lm(datos$Y~Y_teor),col="blue")

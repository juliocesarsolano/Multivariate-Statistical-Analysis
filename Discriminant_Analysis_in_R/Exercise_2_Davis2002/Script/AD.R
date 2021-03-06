#Como el grupo al que pertenecen las arenas se encuentra en la �ltima columna,
#guardamos en X todos los datos (menos el grupo) y en grupo el grupo al que
#pertenecen.

	n<-ncol(datos) #hay n columnas, y el grupo est� en la columna n
	variables<-datos[,-n] #coge de datos todo menos la columna n
	grupo<-datos[,n] #code de datos la columna n

	X<-datos[,-n] #coge de datos todo menos la columna n
	grupo<-datos[,n] #code de datos la columna n


#Prueba de igualdad de medias de los grupos. (Test de Wilks)
	Y<-as.matrix(X)
	resul<-manova(Y~grupo)
	test_Wilks<-summary(resul,test="Wilks")

print("Prueba de igualdad de medias de los grupos: Test de Wilks")
print("                                                         ")
print("                                                         ")
print(test_Wilks)
print("                                                         ")
print("                                                         ")
print("Si Pr<0.05, habr� diferencias entre las medias y el analisis discriminante es aplicable")



#�Qu� variables tiene mayor poder discriminatorio?
#La variable que mayor poder discriminante tiene es la que tiene menor Pr (p.valor)o mayor F value

poder_discrim<-summary.aov(resul) 
	
print("                                                         ")
print("                                                         ")	
print("�Qu� variables tiene mayor poder discriminatorio?")
print("                                                         ")
print("La variable que mayor poder discriminante tiene es la que tiene menor Pr o mayor F value")
print("                                                         ")
print(poder_discrim)
print("                                                         ")
print("                                                         ")

#Aplicaci�n del an�lisis discriminante: �C�mo clasifica la funci�n discriminante los datos clasificados inicialmente? 

	z <- lda(grupo~.,data=X)
	P <- predict(z,X)

print("�C�mo clasifica la funci�n discriminante los datos clasificados inicialmente?")
print("                                                         ")
print("                                                         ")
	datos_clasificados<-table(grupo,P$class); 
	print(datos_clasificados)
	#par(mfrow=c(1,2)); plot(P$x,col=grupo,main='Grupo');plot(P$x,col=P$class,main='Clasificaci�n')

#Coeficientes de las funciones discriminantes can�nicas:
fun_canonca<-z$scaling
print("                                                         ")
print("                                                         ")
print("Coeficientes de las funciones can�nicas descriminantes")
print("                                                         ")
print("                                                         ")
print(fun_canonca)
print("                                                         ")
print("                                                         ")
	

#Clasificaci�n de los nuevos casos
p1<-predict(z,predecir)
nuevos_casos<-p1$class
print("                                                         ")
print("                                                         ")
print("Clasificaci�n de los nuevos casos")
print("                                                         ")
print("                                                         ")
print(nuevos_casos)
print("                                                         ")
print("                                                         ")

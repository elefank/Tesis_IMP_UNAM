## Graficas de reología TESIS ##################################################
#
#
# mydat <- data.frame(x1=c(2,2,3,3,1,1),
#                     x2=c(0.3,1,2.1,2.,0.1,0.2),
#                     x3=c(0.01,0.11,0.04,0.02,0.1,0.06))
# mydat
# 
# write.table(mydat,file="write.dataset.txt",
#             row.names=FALSE,col.names = FALSE,sep = ", ")
# setwd("C:/Users/T440s/Documents/R/Graficas _tesis/Data/Tesis")
#
# EJEMPLO DE COMO HACER SUBSET
#subset(tabla_reomulsiones, pres == 14.7 & con == 10, 
#                  select=c(1,2,3))
# based on variable values
#newdata <- mydata[ which(mydata$gender=='F' 
#                         & mydata$age > 65), ]
#
# Subset del data frame a logicos como vector con nombres y luego transforma toda la columna TRUE en factor
#tabla_reomulsiones[sapply(tabla_reomulsiones, is.integer)] <- 
#  lapply(tabla_reomulsiones[sapply(tabla_reomulsiones,is.integer)], as.factor)
#
## Instead of scale_fill_discrete, you may need to use a different scale, 
# such as scale_fill_manual, scale_colour_hue, scale_colour_manual, 
# scale_shape_discrete, scale_linetype_discrete, and so on. 



####### REOLOGIA DE EMUSLIONES ###########################################################################
# Figuras 6 Chapter Resultados
library(ggplot2)
#leer el archivo CSV generado en Excel
tabla_reomulsiones<-read.csv("reo_emulsiones2.csv", header = TRUE)

# Hacer subset de datos
figura.6 <- subset(tabla_reomulsiones, pres == 14.7 & temp == 23,
                  select = c(speed,time,con,visc))

##### CAPAS ############################
# 1 MAPEO (AESTHETHICS)
figura6.plot <- ggplot(figura.6, aes(x = speed, y = visc, shape = factor(time) ) ) 

# 2 GEOMETRIES
A <- figura6.plot + geom_point( aes(color = factor(con) ),size=4, alpha = 0.6) +
  geom_point( colour = "grey90",size=2.5)

# 3 OTROS
B <- A + labs(x = "Velocidad de corte (1/s)",y = "Viscosidad (mPa s)") + 
  scale_colour_hue(name="Concentración\nAmesus",
                                   breaks=c("5", "10", "15"),
                                   labels=c("5 %", "10 %", "15 %") ) +
  scale_shape_discrete(name="Tiempo",
                       breaks=c("1", "24"),
                       labels=c("1 hr.", "24 hrs.") ) 

# Imprimir todas las capas
#B + theme_classic()
B + theme_bw()

##########################################################################################################
# FIGURA 7 CHAPTER RESULTADOS
# Hacer subset de datos                PRESION        TEMPERATURA
figura.7 <- subset(tabla_reomulsiones, pres == 1500 & temp == 23,
                   select = c(speed,time,con,visc))

##### CAPAS ############################
# 1 MAPEO (AESTHETHICS)
figura7.plot <- ggplot(figura.7, aes(x = speed, y = visc, shape = factor(time) ) ) 

# 2 GEOMETRIES
A <- figura7.plot + geom_point( aes(color = factor(con) ),size=4, alpha = 0.6) +
  geom_point( colour = "grey90",size=2.5)

# 3 OTROS
B <- A + labs(x = "Velocidad de corte (1/s)",y = "Viscosidad (mPa s)") + 
  scale_colour_hue(name="Concentración\nAmesus",
                   breaks=c("5", "10", "15"),
                   labels=c("5 %", "10 %", "15 %") ) +
  scale_shape_discrete(name="Tiempo",
                       breaks=c("1", "24"),
                       labels=c("1 hr.", "24 hrs.") ) 

# Imprimir todas las capas
#B + theme_classic()
B + theme_bw()

##########################################################################################################
# FIGURA 8 CHAPTER RESULTADOS
# Hacer subset de datos                PRESION        TEMPERATURA
figura.8 <- subset(tabla_reomulsiones, pres == 1500 & temp == 160,
                   select = c(speed,time,con,visc))

##### CAPAS ############################
# 1 MAPEO (AESTHETHICS)
figura8.plot <- ggplot(figura.8, aes(x = speed, y = visc, shape = factor(time) ) ) 

# 2 GEOMETRIES
A <- figura8.plot + geom_point( aes(color = factor(con) ),size=4, alpha = 0.6) +
  geom_point( colour = "grey90",size=2.5)

# 3 OTROS
B <- A + labs(x = "Velocidad de corte (1/s)",y = "Viscosidad (mPa s)") + 
  scale_colour_hue(name="Concentración\nAmesus",
                   breaks=c("5", "10", "15"),
                   labels=c("5 %", "10 %", "15 %") ) +
  scale_shape_discrete(name="Tiempo",
                       breaks=c("1", "24"),
                       labels=c("1 hr.", "24 hrs.") ) 

# Imprimir todas las capas
#B + theme_classic()
B + theme_bw()

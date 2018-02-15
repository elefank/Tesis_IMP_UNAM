####### REOLOGIA DE SALMUERAS ###########################################################################
# Figura 10 Chapter Resultados
library(ggplot2)
#leer el archivo CSV generado en Excel
tabla_reosalmueras<-read.csv("reo_salmueras2.csv", header = TRUE)

# Hacer subset de datos
figura.10 <- subset(tabla_reosalmueras, pres == 14.7,
                   select = c(speed,time,con,visc))

##### CAPAS ############################
# 1 MAPEO (AESTHETHICS)
figura10.plot <- ggplot(figura.10, aes(x = speed, y = visc, shape = factor(time) ) ) 

# 2 GEOMETRIES
A <- figura10.plot + geom_point( aes(color = factor(con) ),size=4, alpha = 0.6) +
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
# FIGURA 11 CHAPTER RESULTADOS
# Hacer subset de datos                PRESION      
figura.11 <- subset(tabla_reosalmueras, pres == 1500,
                   select = c(speed,time,con,visc))

##### CAPAS ############################
# 1 MAPEO (AESTHETHICS)
figura11.plot <- ggplot(figura.11, aes(x = speed, y = visc, shape = factor(time) ) ) 

# 2 GEOMETRIES
A <- figura11.plot + geom_point( aes(color = factor(con) ),size=4, alpha = 0.6) +
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


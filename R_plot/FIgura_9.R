##########################################################################################################
# FIGURA 9 CHAPTER RESULTADOS
#leer el archivo CSV generado en Excel
figura.9<-read.csv("rampeo_emulsiones.csv", header = TRUE)

##### CAPAS ############################
# 1 MAPEO (AESTHETHICS)
figura9.plot <- ggplot(figura.9, aes(x = temp, y = visc, shape = factor(time) ) ) 

# 2 GEOMETRIES
A <- figura9.plot + geom_point( aes(color = factor(con) ),size=3, alpha = 0.6) #+
#  geom_point( colour = "grey90",size=2.5)

# 3 OTROS
B <- A + labs(x = "Temperatura (°C)",y = "Viscosidad (mPa s)") + 
  scale_colour_hue(name="Concentración\nAmesus",
                   breaks=c("5", "10", "15"),
                   labels=c("5 %", "10 %", "15 %") ) +
  scale_shape_discrete(name="Tiempo",
                       breaks=c("1", "24"),
                       labels=c("1 hr.", "24 hrs."),
                       solid = FALSE )

#  scale_shape_manual(values=c(3, 16, 17))

# Imprimir todas las capas
#B + theme_classic()
B + theme_bw()
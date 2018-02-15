##########################################################################################################
# FIGURA 12 CHAPTER RESULTADOS

# Ya la tenía y la cagué
##############################################################################################33

#leer el archivo CSV generado en Excel
figura.12<-read.csv("rampeo_salmueras.csv", header = TRUE)

##### CAPAS ############################
# 1 MAPEO (AESTHETHICS)
figura12.plot <- ggplot(figura.12, aes(x = temp, y = visc, shape = factor(time) ) ) 

# 2 GEOMETRIES
A <- figura12.plot + geom_point( aes(color = factor(con) ),size=3, alpha = 0.6)

# 3 OTROS
B <- A + labs(x = "Temperatura (°C)",y = "Viscosidad (mPa s)") + 
  scale_colour_hue(name="Concentración\nAmesus",
                   breaks=c("5", "10", "15"),
                   labels=c("5 %", "10 %", "15 %") ) +
  scale_shape_discrete(name="Tiempo",
                       breaks=c("1", "24"),
                       labels=c("1 hr.", "24 hrs."),
                       solid = TRUE )

#  scale_shape_manual(values=c(3, 16, 17))

# Imprimir todas las capas
B + theme_bw()


### Puntos de cedencia ###############################################################################

#### FIGURA 14 ################################################################################

cedencia<-read.csv("cedencia_prueba.csv", header = TRUE)
cedencia.plot <- ggplot(cedencia, aes(x = Shear.Stress) ) 

# 2 GEOMETRIES
A <- cedencia.plot + geom_jitter( aes(y=Storage.Modulus),shape=15,size=3) +
  geom_line( aes(y=Storage.Modulus))
A <- A + geom_jitter( aes(y=Loss.Modulus),shape=17,size=3) +
  geom_line( aes(y=Loss.Modulus))

# 3 OTROS
B <- A + labs(x = "Esfuerzo de corte (mPa)",y = "G' G'' (mPa)")

#  scale_shape_manual(values=c(13, 15, 17)) #círculo, cuadro y triángulo 

# Imprimir todas las capas 500x380ppx
B + theme_bw()

#### FIGURA 15 ################################################################################

cedencia<-read.csv("cedencia.csv", header = TRUE)
cedencia.plot <- ggplot(cedencia, aes(x = con, y=cedencia, colour = factor(temp) ) ) 

# 2 GEOMETRIES
A <- cedencia.plot + geom_point(size=3, alpha = 0.6)

# 3 OTROS
B <- A + labs(x = "Concentracion de Amesus (ppm)",y = "Esfuerzo de cedencia (mPa)") + 
   scale_colour_hue(name="Temperatura (°C)",
                    breaks=c("23", "70"),
                    labels=c("23", "70") )
#   scale_shape_discrete(name="Temperatura (°C)",
#                        breaks=c("23", "70"),
#                        labels=c("23", "70"),
#                        solid = TRUE )
#  scale_shape_manual(values=c(3, 16, 17)) #círculo, cuadro, triángulo
   
# Imprimir todas las capas
B + theme_bw()
###############################################################################################################
#   Gráfica de Densidad de salmuera vs Concentración de surfactante para IFT 
tabla_8 <- data.frame(con = c(20000,10000,5000,2500,1250,625,325,162.5,143,65,1),
                      mg_50ml = c(1000,500,250,125,62.5,31.25,16.25,8.125,7.15,3.25,0),
                      mg_ml = c(20,10,5,2.5,1.25,0.625,0.325,0.1625,0.143,0.065,0),
                      den = c(1.15053,1.15389,1.15579,1.15765,1.15936,1.16064,1.16112,1.16124,1.16133,1.161335,1.16140),
                      ift = c(27.20,27.32,27.42,27.87,28.62,32.99,39.83,47.2,50.18,60.00,66.64)
)   #                                         1.15679                             #58.00
###  FIGURA 23  ################################################################################# 
##   DENSIDAD
write.table(tabla_8,file="tabla_8.txt",
            row.names=FALSE,col.names = FALSE,sep = ", ")

# Create the object containing the data and aes layers: 
figura23.plot <- ggplot(tabla_8[,c(1,4)], aes(x = con, y = den ) )
                       #tabla_8[4:10,c(1,4)]
a <- figura23.plot + geom_point(size = 3) + geom_line() + scale_x_continuous(trans='log10')

 a <- a + annotation_logticks(base = 10, sides = "bt", scaled = TRUE, alpha = 0.3) +
   labs( title = " 22°C ",
         x = "Concentración de surfactante (ppm)",
         y = bquote('Densidad (' *g/cm^3* ')' )
   )
# construida la gráfica podemos cambiar el tema
a + theme_bw()

###  FIGURA 24  #################################################################################
#  IFT

# Create the object containing the data and aes layers: 
figura24.plot <- ggplot(tabla_8[,c(1,5)], aes(x = con, y = ift ) )
#tabla_8[4:10,c(1,4)]
a <- figura24.plot + geom_point(size = 3) + geom_line() + scale_x_continuous(trans='log10')

a <- a + annotation_logticks(base = 10, sides = "bt", scaled = TRUE, alpha = 0.3) +
  labs( title = " 22°C ",
        x = "Concentración de surfactante (ppm)",
        y = bquote('IFT (' *N/cm^2* ')' )
  )
# construida la gráfica podemos cambiar el tema
a + theme_bw()


###  FIGURA 25  ###############################################################################
## IFT
#   Gráfica de Densidad de salmuera vs Concentración de surfactante para IFT 
tabla_9 <- data.frame(con = c(2500,1250,625,290,56.55,1),
                      den = c(1.15765,1.15936,1.16064,1.16109,1.161335,1.16140),
                      ift = c(1.64,3.64,6.11,8.23,10.88,19.45)
)#

##   DENSIDAD
write.table(tabla_9,file="tabla_8.txt",
            row.names=FALSE,col.names = FALSE,sep = ", ")

# Create the object containing the data and aes layers: 
figura25.plot <- ggplot(tabla_9, aes(x = con, y = den ) )
#tabla_8[4:10,c(1,4)]
a <- figura25.plot + geom_point(size = 3) + geom_line() + scale_x_continuous(trans='log10')

a <- a + annotation_logticks(base = 10, sides = "bt", scaled = TRUE, alpha = 0.3) +
  labs( title = " 22°C ",
        x = "Concentración de surfactante (ppm)",
        y = bquote('Densidad (' *g/cm^3* ')' )
  )
# construida la gráfica podemos cambiar el tema
a + theme_bw()

###  FIGURA 26  #################################################################################
#  IFT
# Create the object containing the data and aes layers: 
figura26.plot <- ggplot(tabla_9, aes(x = con, y = ift ) )
#tabla_8[4:10,c(1,4)]
a <- figura26.plot + geom_point(size = 3) + geom_line() + scale_x_continuous(trans='log10')

a <- a + annotation_logticks(base = 10, sides = "bt", scaled = TRUE, alpha = 0.3) +
  labs( title = " 22°C ",
        x = "Concentración de surfactante (ppm)",
        y = bquote('IFT (' *N/cm^2* ')' )
  )
# construida la gráfica podemos cambiar el tema
a + theme_bw()


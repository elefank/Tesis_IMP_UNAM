##########################################################################################################
# FIGURA 12 CHAPTER RESULTADOS

# para agregar un eje secundario
#A <- A + geom_point(data=subset(figura.12, con>0) , aes(y = visc ), size=3, alpha = 0.6) 
# adding the free oil viscosity data, transformed to match roughly the range of the visc
#A <- A + geom_point(data=subset(figura.12, con==0), aes(y = visc/4), size=3, alpha = 0.6 )
# now adding the secondary axis, following the example in the help file ?scale_y_continuous
# and, very important, reverting the above transformation
#A <- A + scale_y_continuous(sec.axis = sec_axis(~.*4, name = "Viscosidad (mPa s)" ))


#leer el archivo CSV generado en Excel
figura.12<-read.csv("rampeo_aceitelibre.csv", header = TRUE)

##### CAPAS ############################
# 1 MAPEO (AESTHETHICS)
A <- ggplot(figura.12, aes(x = temp, color = factor(con) ) )

# 2 GEOMETRIES
A <- A + geom_point( aes(y = visc ), size=3, alpha = 0.3)

# 3 OTROS: modifying colours and theme options
A <- A + labs(x = "Temperatura (°C)",y = "Viscosidad (mPa s)") + 
  scale_colour_discrete(name="Concentración\nAmesus",
                   breaks=c("0","3", "5", "10", "15"),
                   labels=c("aceite","3 %", "5 %", "10 %", "15 %") )
#scale_colour_tableau
# Imprimir todas las capas
A + theme_bw()
# A + theme_calc()
# A + theme_economist()
# A + theme_excel()
# A + theme_few()
# A + theme_fivethirtyeight()
# A + theme_gdocs()
# A + theme_hc() 
# A + theme_par()
# A + theme_solarized()
# A + theme_solarized_2()
# A + theme_stata()
# A + theme_tufte()
# A + theme_wsj() 
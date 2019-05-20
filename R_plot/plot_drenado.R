# reconplot
packrat::packrat_mode()

pkgs <-
  list("data.table", "magrittr", "ggplot2", "reconPlots", "clipr")

lapply(unlist(pkgs), require, character.only = TRUE)

Curvas_drenado_agua <-
  list(
    list(`0.5a` = function(q){4.08568 * log(q) + 3.0404},
         `0.5b` = function(q){0.5576 * log(q) + 42.18}),
    list(`1a` = function(q){5.8888 * log(q) - 7.7994},
       `1b` = function(q){0.9875 * log(q) + 37.161  }),
    list(`3a` = function(q){6.4535 * log(q) - 21.955 },
       `3b` = function(q){1.3011 * log(q) + 27.116 }),
    list(`5a` = function(q){6.2183 * log(q) - 14.098 },
       `5b` = function(q){1.1009 * log(q) + 34.187 }),
    list(`10a` = function(q){5.1719 * log(q) - 4.5032},
       `10b` = function(q){1.0031 * log(q) + 35.821}),
    list(`13a` = function(q){4.3896 * log(q) - 0.6269},
         `13b` = function(q){0.8029 * log(q) + 34.209}),
    list(`15a` = function(q){5.8937 * log(q) - 11.91},
       `15b` = function(q){1.021 * log(q) + 34.951})
       )

Curvas_drenado_gel <-
  list(
    list(`0.5a` = function(q){-7.168 * log(q) + 106.38 },
         `0.5b` = function(q){-0.493 * log(q) + 43.858}),
    list(`1a` = function(q){-5.67 * log(q) + 103.6},
         `1b` = function(q){-0.716 * log(q) + 56.935}),
    list(`3a` = function(q){-4.966 * log(q) + 94.576},
         `3b` = function(q){-0.741 * log(q) + 52.906}),
    list(`5a` = function(q){-4.991 * log(q) + 95.407},
         `5b` = function(q){-0.822 * log(q) + 55.829}),
    list(`10a` = function(q){-4.891 * log(q) + 97.284},
         `10b` = function(q){0.0206 * log(q) + 48.368}),
    list(`13a` = function(q){-4.276 * log(q) + 88.461},
         `13b` = function(q){-0.136 * log(q) + 47.677}),
    list(`15a` = function(q){-6.574 * log(q) + 113.45},
         `15b` = function(q){-0.461 * log(q) + 53.689})
  )


intersector <- function(lista){
  # dominio de estudio
  xrange <- 100:1000000
  curve_intersection <- 
    curve_intersect(lista[[1]],
                    lista[[2]],
                    empirical = FALSE,
                    domain = c(min(xrange), max(xrange)))
}

intersecciones <- 
  lapply(Curvas_drenado_agua, intersector)

names(intersecciones) <-
  c("0.5","1.0","3.0","5.0","10.0","13.0","15.0")

con = data.table(con = c(0.5,1.0,3.0,5.0,10.0,13.0,15.0))

sink(file = "./drenado_agua.csv",
     append = FALSE)

intersecciones %>% 
  as.data.table() %>% 
  t %>% 
  set_colnames(c("x","y")) %>% 
  cbind(con)

sink()

new <- fread(input = "drenado_gel.csv",
             skip = 1,
             drop = c(1),
             col.names = c("x", "y", "con"))

new %>% str()

ggplot(data = new) +
  geom_point(mapping = aes(x = 1,
                           y = y,
                           colour = as.factor(con)),
             size = 3,
             alpha = 0.6) +
  theme_classic() +
  facet_grid(facets = .~con, switch = "x") +
  #ggtitle("Drenado del agua (intersección)") +
  ggtitle("Drenado del gel (intersección)") +
  xlab("Concentración [%] ") +
  #ylab("Agua [ml]") +
  ylab("Gel [ml]") +
  theme(axis.line.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank(),
        axis.title.x = element_text(),
        legend.position = "none")
  


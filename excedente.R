# Excedente del consumidor

df <- tribble(
  ~x, ~y, ~curva,
  0,   1,  "oferta",
  12,   13, "oferta",
  0,   12,   "demanda",
  7, 0,    "demanda"
)

oferta_demanda <- function(df) {
  ggplot(df, aes(x, y)) + 
    geom_line(data = df, aes(color=curva)) + 
    geom_line(data = df, aes(color=curva)) + 
    scale_color_manual(name = NULL, 
                       labels = c("Demanda", "Oferta"),
                       values = c("#23576E", "#099FDB", 
                                  "#29B00E", "#208F84", 
                                  "#F55840", "#924F3E")) +
    scale_x_continuous(expand = c(0, 0.2),
                       breaks=1:13)  +
    scale_y_continuous(expand = c(0, 0.2),
                       breaks=1:13) + 
    geom_segment(aes(x = 0, y = 0, xend = 0, yend = 14), arrow = arrow(length=unit(0.2, "cm"))) +
    geom_segment(aes(x=0, y=0, xend = 14, yend = 0), arrow = arrow(length=unit(0.2, "cm"))) + 
    theme(axis.title.y = 
            element_text(angle = 0),
          axis.title.x = 
            element_text(hjust=0.95, vjust=6))  +
    labs(x="X", y="P")
  
}
  

# Ejercicio Lumen learnign
oferta_demanda(df)

# Calcular el equilibrio
# Calcular el excedente del consumidor
# Calcular el excedente del productor
# Suponer que el gobierno pone un precio máximo de $4
# Calcular EP
# Calcular EC

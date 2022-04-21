
# Excedente del consumidor

# https://pressbooks.bccampus.ca/uvicecon103/chapter/4-6-taxes/

# Excedente del consumidor
library(tidyverse)
library(patchwork)

df <- tribble(
  ~x, ~y, ~curva,
  0,   6,  "demanda",
  7,   2.5, "demanda",
  0,   0,   "oferta",
  6, 6,    "oferta"
)



base <- ggplot(df, aes(x, y)) + 
  geom_line(data = df, aes(color=curva)) + 
  geom_line(data = df, aes(color=curva)) + 
  scale_color_brewer(name = "",
                     palette = "Accent",
                     labels = c("Demanda", "Oferta")) +
  scale_x_continuous(expand = c(0, .1),
                     breaks=seq(0, 8, .5))  +
  scale_y_continuous(expand = c(0, .1),
                     breaks=seq(0, 6, .5)) + 
  geom_segment(aes(x = 0, y = 0, xend = 0, yend = 6.5), arrow = arrow(length=unit(0.2, "cm"))) +
  geom_segment(aes(x=0, y=0, xend = 7, yend = 0), arrow = arrow(length=unit(0.2, "cm"))) + 
  theme(axis.title.y = 
          element_text(angle = 0),
        axis.title.x = 
          element_text(hjust=0.95, vjust=6)) + 
  labs(x="", y="")


df_demanda_impuesto <- tribble(
  ~x, ~y, ~curva,
  0,  3, "Demanda con impuesto",
  6, 0, "Demanda con impuesto"
)

df_oferta_impuesto <- tribble(
  ~x, ~y, ~curva,
  0,  3, "Oferta con impuesto",
  3,  6, "Oferta con impuesto"
)

impuesto_productores <- base +
  geom_line(data = df_oferta_impuesto, linetype="dashed") +
  labs(title="Impuesto sobre los productores")
  
impuesto_consumidores <- base +
  geom_line(data = df_demanda_impuesto, linetype="dashed") +
  labs(title="Impuesto sobre los consumidores")


area <- tribble(
  ~id, ~x, ~y,
  "Exc. Cons.", 0, 6,
  "Exc. Cons.", 0, 5,
  "Exc. Cons.", 2, 5,
  "Gob", 0, 5,
  "Gob", 0, 2,
  "Gob", 2, 2,
  "Gob", 2, 5,
  "Ex. Prod.", 0, 0,
  "Ex. Prod.", 0, 2,
  "Ex. Prod.", 2, 2,
  "Peso Muerto", 2, 2,
  "Peso Muerto", 2,5,
  "Peso Muerto", 4, 4
)

bienestar_con_impuesto <- base +
  geom_polygon(data=area, aes(x, y, group=id, fill=id), alpha = .6) +
  scale_fill_brewer(palette = "Accent", name = "")


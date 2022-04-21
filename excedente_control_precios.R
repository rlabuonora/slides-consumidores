# Excedente del consumidor

# https://pressbooks.bccampus.ca/uvicecon103/chapter/4-6-taxes/

# Excedente del consumidor
library(tidyverse)
library(patchwork)

df <- tribble(
  ~x, ~y, ~curva,
  0,   1,  "oferta",
  12,   13, "oferta",
  0,   12,   "demanda",
  7, 0,    "demanda"
)

# https://pressbooks.bccampus.ca/uvicecon103/chapter/4-6-price-controls/

df <- tribble(
  ~x, ~y, ~curva,
  0,   0,  "oferta",
  600,   1200, "oferta",
  0,   1200,   "demanda",
  600, 0,    "demanda"
)

base <- ggplot(df, aes(x, y)) + 
    geom_line(data = df, aes(color=curva)) + 
    geom_line(data = df, aes(color=curva)) + 
    scale_color_brewer(name = NULL,
                       palette = "Accent",
                       labels = c("Demanda", "Oferta")) +
    scale_x_continuous(expand = c(0, 40),
                       breaks=seq(0, 600, 100))  +
    scale_y_continuous(expand = c(0, 40),
                       breaks=seq(0, 1200, 100)) + 
    geom_segment(aes(x = 0, y = 0, xend = 0, yend = 1300), arrow = arrow(length=unit(0.2, "cm"))) +
    geom_segment(aes(x=0, y=0, xend = 700, yend = 0), arrow = arrow(length=unit(0.2, "cm"))) + 
    theme(axis.title.y = 
            element_text(angle = 0),
          axis.title.x = 
            element_text(hjust=0.95, vjust=6))  +
    labs(x="X", y="P")




areas <- tribble(
  ~id, ~x, ~y,
  "Ex. Cons.", 0, 600,
  "Ex. Cons.", 0, 1200,
  "Ex. Cons.", 300, 600,
  "Ex. Prod.", 0,   0,
  "Ex. Prod.", 0, 600,
  "Ex. Prod.", 300, 600
)

antes <- base +
  geom_polygon(data=areas, aes(group=id, x=x, y=y, fill = id)) +
  scale_fill_brewer(name= "", palette = "Accent") +
  guides(color = guide_legend(order = 1), 
         fill = guide_legend(order = 2)) +
  labs(title="Sin control de Precios")

areas <- tribble(
  ~id, ~x, ~y,
  "Ex. Cons.", 0, 400,
  "Ex. Cons.", 0, 1200,
  "Ex. Cons.", 200, 800,
  "Ex. Cons.", 200, 400,
  "Ex. Prod.", 0,   0,
  "Ex. Prod.", 0, 400,
  "Ex. Prod.", 200, 400,
  "Perdida", 200, 400,
  "Perdida", 200, 800,
  "Perdida", 300, 600
)

despues <- base +
  geom_segment(x=0, y=400, xend = Inf, yend=400) +
  geom_polygon(data=areas, aes(group=id, x=x, y=y, fill = id)) +
  scale_fill_brewer(palette = "Accent", name= "") +
  labs(title="Con control de precios")



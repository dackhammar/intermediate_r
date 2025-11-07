#---- Load libraries ----
library(tidyverse)

#---- Load data ----
df <- iris

#---- Data exploration ----
head(df)
summary(df)
str(df)

#---- Data manipulation ----
df |> 
  mutate(Species = str_to_title(Species)) |> 
  group_by(Species) |> 
  summarize(
    "Mean petal width" = mean(Petal.Width),
    "Mean petal length" = mean(Petal.Length),
  )

#---- Plots ----
df |> 
  mutate(Species = str_to_title(Species)) |> 
  ggplot(aes(Petal.Length, Petal.Width, color = Species, shape = Species)) +
  geom_point() +
  labs(
    title = "Petal characteristics by species",
    x = "Petal length",
    y = "Petal width"
  ) +
  theme_minimal() +
  scale_color_brewer(palette = "Dark2")

df |> 
  pivot_longer(
    cols = starts_with("Sepal."),
    names_to = "Measurement",
    values_to = "Value"
  ) |> 
  mutate(
    Species = str_to_title(Species),
    Measurement = str_replace(Measurement,"\\.", " ") |> str_to_sentence()
  ) |> 
  ggplot(aes(Species, Value, fill = Species)) +
  geom_boxplot(show.legend = F) +
  theme_minimal() +
  labs(
    title = "Sepal characteristics",
    x = ""
  )+
  facet_wrap(~Measurement, scales = "free_y") +
  scale_fill_brewer(palette = "Dark2")
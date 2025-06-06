
install.packages("FSelectorRcpp")
install.packages("caret")
install.packages("dplyr")

library(ggplot2)
library(tidyverse)
library(FSelectorRcpp) 
library(caret)         
library(dplyr)

data <- read.csv("G://Final_task2//penguins_size.csv")
data <- na.omit(data)
data$species <- as.factor(data$species)
data$sex <- as.factor(data$sex)
data$island <- as.factor(data$island)

cat("\n Pearson Correlation \n")
cor_matrix <- cor(data %>% select_if(is.numeric))
print(round(cor_matrix, 3))

cat("\n ANOVA \n")
print(summary(aov(culmen_length_mm ~ species, data = data)))
print(summary(aov(culmen_depth_mm ~ species, data = data)))
print(summary(aov(flipper_length_mm ~ species, data = data)))
print(summary(aov(body_mass_g ~ species, data = data)))

cat("\n Chi-squared Tests \n")
chisq.test(table(data$sex, data$species))
chisq.test(table(data$island, data$species))

info_gain <- information_gain(species ~ ., data = data)
print("Mutual Information:")
print(info_gain)

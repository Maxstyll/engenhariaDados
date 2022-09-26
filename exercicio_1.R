# Solução do Exercício 1 em R

# Imports
install.packages("tidyverse")
library(tidyverse)

# Diretório de trabalho
setwd("E:/Developement/Estudos/samples/R/engenhariaDados")
getwd()

# Carrega o dataset
data <- read_csv("dados/CAERS_ASCII_2004_2017Q2.csv")


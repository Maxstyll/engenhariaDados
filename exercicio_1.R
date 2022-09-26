# Solução do Exercício 1 em R

# Imports
install.packages("tidyverse")
library(tidyverse)

# Diretório de trabalho
setwd("E:/Developement/Estudos/samples/R/engenhariaDados")
getwd()

# Carrega o dataset
data <- read_csv("dados/CAERS_ASCII_2004_2017Q2.csv")

#Mostre que a tabela foi importada com sucesso
View(data)


# 1. Qual o **tipo de reação** mais reportado na tabela?
data$`PRI_Product Role`


# 2. Qual o **nome da indústria** que tem **mais mortes** reportadas?
data$`PRI_FDA Industry Name`
data$`AEC_One Row Outcomes`

# 3. Quais as **3 principais reações adversas** de pessoas entre 18-25 anos na **indústria de cosméticos**?
# 4. Usando o `purrr`, escreva em uma pasta 10 tabelas diferentes com as **10 reações mais recorrentes** (uma tabela para cada reação).


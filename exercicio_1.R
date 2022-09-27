# Solução do Exercício 1 em R

# Imports
install.packages("tidyverse")

library(tidyverse)
library(purrr)

# Diretório de trabalho
setwd("E:/Developement/Estudos/samples/R/engenhariaDados")
getwd()

# Carrega o dataset
data <- read_csv("dados/CAERS_ASCII_2004_2017Q2.csv")

#Mostre que a tabela foi importada com sucesso
View(data)

# 1. Qual o **tipo de reação** mais reportado na tabela?
symptoms = data$`SYM_One Row Coded Symptoms`

symptoms.freq = sort(table(unlist(strsplit(symptoms, ", "))), decreasing = TRUE)
symptoms.freq[1]


# 2. Qual o **nome da indústria** que tem **mais mortes** reportadas?
dataDeth <- filter(data, `AEC_One Row Outcomes` == "DEATH")
Industry = dataDeth$`PRI_Reported Brand/Product Name`
Industry.freq = sort(table(Industry), decreasing = TRUE)
Industry.freq[1]


# 3. Quais as **3 principais reações adversas** de pessoas entre 18-25 anos na **indústria de cosméticos**?
dataAge <- filter(data, `CI_Age Unit` == "Year(s)" & 
                        `PRI_FDA Industry Name` == "Cosmetics" &
                        (`CI_Age at Adverse Event` >= 18 & 
                           `CI_Age at Adverse Event` <= 25))
symptomsForAge = dataAge$`SYM_One Row Coded Symptoms`
symptomsForAge.freq = sort(table(unlist(strsplit(symptoms, ", "))), decreasing = TRUE)
symptomsForAge.freq[1:3]


# 4. Usando o `purrr`, escreva em uma pasta 10 tabelas diferentes com as **10 reações mais recorrentes** (uma tabela para cada reação).
symptomsRecod = data$`SYM_One Row Coded Symptoms`
symptomsRecod.freq = sort(table(unlist(strsplit(symptoms, ", "))), decreasing = TRUE)

output_csv <- function(data, names){ 
  folder_path <- "./datasets/test-csv/"
  
  write_csv(data, paste0(folder_path, "test-excel-", names, ".csv"))
}

symptomsRecod.freq[1:10]

list(data = symptomsRecod.freq,
     names = names(symptomsRecod.freq)) %>% 
  purrr::pmap(output_csv) 

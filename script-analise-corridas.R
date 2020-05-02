#Analise dados corrida para projeto Cristine 25 abril 2020
#
library(readxl)
form_corrida_para_r <- read_excel("form-corrida-para-r.xlsx")
corridas <- form_corrida_para_r
# Tabelar frequencias exemplo para agrupar variavel continua por grupo
#library(dplyr)
#group_by(corridas, posicao) %>%
#  summarise(
#    count = n(),
#    median = median(score, na.rm = TRUE),
#    IQR = IQR(score, na.rm = TRUE)
#  )
#Usar pacote expss para colocar labels no dataframe corridas

library(expss)
corridas2 <- apply_labels(corridas,
                          idade= "Idade",
                          clasidade= "Classe de Idade",
                          estadocivil= "Estado Civil",
                          emae="É Mãe?",
                          numfilhos= "Número de Filhos",
                          tipoparto= "Tipo de Parto",
                          teveepisotiomia= "Teve Episotiomia",
                          cirurgiaginecologica= "Fez Cirurgia Ginecologica",
                          tipoativfisica= "Quais Atividades Fisicas",
                          freqsemcorr= "Frequencia de Corridas por Semana",
                          clasfreqcor= "Freq Corrida por Semana Categoria",
                          anoscorrendo= "Corre há quantos anos",
                          motivocorr= "Motivo de Correr",
                          kmsemana= "Km Corrida por Semana",
                          claskmsem= "Km Corrida por Categoria",
                          idadeiniciocorrida= "Com que idade comecou a correr",
                          vontadeurinarcorrida= "Tem vontade de urinar durante corrida",
                          perdaurinacorrida= "Tem perda de urina durante a corrida",
                          perdiantescorrer= "Perdia urina antes de correr?",
                          quandoperdeurina= "Quando perde urina?")
cro(corridas2$vontadeurinarcorrida,corridas2$perdaurinacorrida)
attach(corridas)
table0 <- table(corridas$vontadeurinarcorrida,corridas$perdaurinacorrida)
View(table0)
mosaicplot(table0,xlab="Vontade de Urinar", ylab= "Vazamento de Urina")
mosaicplot(table0,xlab="Vontade de Urinar", ylab= "Vazamento de Urina",sort=c(2,1))
mosaicplot(table0,xlab="Vontade de Urinar", ylab= "Vazamento de Urina",dir=c("v","h"))
corridas2 %>% 
  tab_cells(vontadeurinarcorrida) %>% 
  tab_cols(total(), perdaurinacorrida) %>% 
  tab_stat_cpct() %>% 
  tab_pivot()

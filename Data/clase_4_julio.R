# Instalar paquetes ----
install.packages("openxlsx")# permitir importar archivos de excel

#Cargar paquetes
library(openxlsx)
library(tidyverse)

# Importar data
data_banco<-read.xlsx("Data/Data_Banco.xlsx",sheet="DATA")

# Explorando data banco
data_banco
str(data_banco)

# as.*()--coercion
# num --chr

# Para crear factores: funcion factor()
caracter<-c("Regular","Regular","Excelente","Muy malo")
SATISFACCION<-factor(c("Regular","Regular","Excelente","Muy malo"),levels= c("Excelente","Muy Bueno","Bueno","Regular","Muy Malo"),ordered = T)

# COERCION DE CHR A FACTOR
as.factor(caracter)
caracter<-as.factor(caracter)
is.factor(caracter)
class(caracter) # tipo de estructura


# familia parse_*()--- pertenece al paquete readr
# parse: segmentar

# parse_number()
"la clase de hoy empieza a las 8 de la noche"
parse_number("la clase de hoy empieza a las 8 de la noche")

"90"
as.numeric("90")
"6_90"
parse_number("6_90r")

parse_factor("6_90r")
parse_factor(caracter,levels=,ordered =T)
# as factor ()no me permite los argumentos de levels y ordered

str(data_banco)

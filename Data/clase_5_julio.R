# Instalar paquetes ----
install.packages("openxlsx") # permite importar archivos de excel
install.packages("tidyverse")# manipulacion y ordenamiento de datos
install.packages("magrittr") # operador pipe
install.packages("readr") 
install.packages("dplyr")

#Cargar paquetes----
library(openxlsx)
library(tidyverse)
library(magrittr)
library("readr")
library("dplyr")

# Importar data
Data_Banco<-read.xlsx("Data/Data_Banco.xlsx",sheet="Data")
str(Data_Banco)
Data_Banco


paquetes<-c("openxlsx","tidyverse","magrittr","readr")

lapply(paquetes,library,character.only=TRUE)

#Tidyverse------
# sintaxis: %>% (shortcut: ctrl + shift +m ---MAC: CMD + SHIFT + m)

data_banco %>% head() # sintaxis de Tidyverse

data_banco %>% names %>% length()
names(data_banco)

length(names(data_banco)) # r base

# sintaxis r base
data_banco[,5]
data_banco[,c("Sucursal","Transaccion")]

## verbos del dplyr---

## filter(): filtrar filas
## == es el operador de equivalencia
Data_Banco %>% filter(Sucursal==62)
filter(data_banco,Sucursal == 62)

Data_Banco %>% filter(Sucursal == 85) %>% View()

# operador o: | (pleca)

# entregame las transacciones de las sucursales 62 - 85
Data_Banco %>%  filter(Sucursal ==62 | Sucursal == 85) %>% view("pleca")
data_banco

# operador %in%
Data_Banco %>% filter(Sucursal %in% c(62,85)) %>% view("operador_in")

# filtrado por excepcion
Data_Banco %>% filter (!(Sucursal %in% c(62,85))) %>% view("excepcion")

## filtrado para 2 variables

Data_Banco %>% filter(Sucursal %in% c(62,85), Tiempo_Servicio_seg > 100) %>% view("filtrado2")

## FILTRADO 3 VARIABLES: sUCURSAL 85 -Tiempo serv en seg menor a 100 - Satisfaccion:Muy Bueno

Data_Banco %>% filter(Sucursal %in% c(85) & Tiempo_Servicio_seg < 100 & Satisfaccion =="Muy Bueno") %>% View("filtrado3")

## operador  data banco %>% filter()##minitarea


# Selecionar: select()----
Data_Banco [,5] #rbase

Data_Banco %>% select()


# Seleccion por excepcion
Data_Banco %>% select(-Cajero) %>% view("excp1")

# select() y sus funciones auxiliadoras
# contains
Data_Banco %>% select(contains("Tra")) %>% view("contains")

# minitarea 2: replique el ejemplo de contains()con "on"

Data_Banco %>% select(starts_with("S")) %>% view("stars")
 
Data_Banco %>% select(contains("TRA"),ends_with("on")) %>% view("combined")
view(Data_Banco)

# mover columnas con select()
Data_Banco %>% select(Monto,Transaccion,everything()) %>% view ("combined2")

Data_Banco %>% select_all (toupper) %>% view()

Data_Banco %>% select(matches("r?sa")) %>% view()








# Loading files with function lists and Paths
source(file="C:\\DataTK\\R_Packages\\paths.R")
source(file="C:\\DataTK\\R_Packages\\functions.R")

#updating the list of packages
setwd(sourcePackagePath)
listPackages <- data.frame(read.csv("packages.txt", header=FALSE))
names(listPackages)[1] <- "name"

#just names of the packages
temp <- strsplit(as.character(listPackages$name),"_")
temp <- data.frame(library=matrix(unlist(temp), ncol=2, byrow=TRUE)[,1])
listPackages<- cbind(name=listPackages, library=temp$library)


#installing the missing packages
setwd(sourcePath)
function_install_4(listPackages)

library(dplyr, lib.loc=libPath)
library(ggplot2, lib.loc=libPath)
library(knitr, lib.loc=libPath)
library(magrittr, lib.loc=libPath)
library(modelr, lib.loc=libPath)
library(purrr, lib.loc=libPath)
library(rlang, lib.loc=libPath)
library(rmarkdown, lib.loc=libPath)
library(tidyr, lib.loc=libPath)
library(tidyverse, lib.loc=libPath)

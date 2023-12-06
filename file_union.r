#! /usr/bin/env Rscript


args = commandArgs(T)

m = as.character(args[1])

setwd(m)

library(readr)
read1 <- function(x){
  read_csv(x)
}

file_list <- lapply(list.files(), read1)

# 使用do.call调用rbind合并,file_list中每一个元素都是其参数，即其中的每一个小参数
#large list中每一个元素都是读取的一个小tibble
data <- do.call(rbind, file_list)
head(data)
names(data)


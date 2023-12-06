getwd()
setwd("D:\\Data-Engeering\\课程内容\\学习内容\\assignment\\assignment_idaccuracy\\Aminer")

library(readr)

#循环的写法
data <- data.frame()
for (i in list.files()) {
  print(i)
  temp <- read_csv(i)
  data <- rbind(data, temp)
}
head(data)
names(data)

#apply族函数：lapply
read1 <- function(x){
  read_csv(x)
}
file_list <- lapply(list.files(), read1)

# 使用do.call调用rbind合并,file_list中每一个元素都是其参数，即其中的每一个小参数
#large list中每一个元素都是读取的一个小tibble
data_lapply <- do.call(rbind, file_list)
head(data_lapply)
names(data_lapply)

#封装一个命令行运行的脚本，唯一参数是文件所在路径

#! /usr/bin/env Rscript

args = commandArgs(T)

m = as.character(args[1])

setwd(m)

read1 <- function(x){
  read_csv(x)
}

file_list <- lapply(list.files(m), read1)

# 使用do.call调用rbind合并,file_list中每一个元素都是其参数，即其中的每一个小参数
#large list中每一个元素都是读取的一个小tibble
data <- do.call(rbind, file_list)
head(data)
names(data)

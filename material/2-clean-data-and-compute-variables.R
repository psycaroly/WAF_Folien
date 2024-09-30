# daten einlesen
load(file="processed_data/merged-data.RData")

# compute condition
data$condition <- NA
data$condition <- ifelse(!is.na(data$ended_techni), 1, data$condition)
data$condition <- ifelse(!is.na(data$ended_ante), 2, data$condition)

table(data$birth)

# new data with only relevant conditions
data_all <- data
data <- data[!is.na(data$condition) & data$condition == 1 | !is.na(data$condition) & data$condition == 2,]

# recode all items
data$extra1_r <- (data$extra1-6)*-1

# compute scale
data$extraversion <- rowMeans(data[,c("extra1_r", "extra2", "extra3")], na.rm = FALSE)

# check descriptives
library(psych)
describe(data$extraversion)

# z standardization
data$extraversion_z <- (data$extraversion - mean(data$extraversion, na.rm = TRUE))/sd(data$extraversion, na.rm = TRUE)

describe(data$extraversion_z)

# differenz bilden
data$RS1_diff <- data$RS1_post - data$RS1_pre

save(data, file="processed_data/data.RData")

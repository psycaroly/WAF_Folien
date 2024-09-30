data <- read.csv("formr_anonymity.csv")
data <- data[data$ended != "",]

library(dplyr)
# let's try age and gender (1 = male, 2 = female)
unique_combos <- data %>%
  group_by(alter, geschlecht) %>%
  summarise(n = n()) %>%
  arrange((n))

# how many unique combinations do we have with age and gender?
table(unique_combos$n)

# show some of the critical ones
unique_combos[unique_combos$n == 1,]

data$Alterskategorie[data$alter < 20] <- "< 20 Jahre"
data$Alterskategorie[data$alter > 20] <- "20-40 Jahre"

data$alter <- NULL

write.csv(data, file = "data_anonymized.csv", row.names = FALSE)

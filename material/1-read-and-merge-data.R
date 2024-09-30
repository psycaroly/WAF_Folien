# daten einlesen
preQ <- read.csv("raw_data/preQ.csv")
techni <- read.csv("raw_data/KG_Technicolour.csv")
ante <- read.csv("raw_data/EG_Antebellum.csv")
postQ <- read.csv("raw_data/postQ.csv")

# leere session löschen
preQ <- preQ[preQ$session != "",]
techni <- techni[techni$session != "",]
ante <- ante[ante$session != "",]
postQ <- postQ[postQ$session != "",]

# datensätze kombinieren in einen einzelnen datensatz
data <- merge(preQ, techni, by = "session", suffixes = c("", "_techni"), all = TRUE)
data <- merge(data, ante, by = "session", suffixes = c("", "_ante"), all = TRUE)
data <- merge(data, postQ, by = "session", suffixes = c("_preQ", "_postQ"), all = TRUE)

# speichern
save(data, file = "processed_data/merged-data.RData")

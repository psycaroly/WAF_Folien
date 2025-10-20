library(ggplot2)

# create plausible data
newdat <- expand.grid(
  lebenszufriedenheit = c(-1,0,1),
  bedingung = c(0,1)
)

# predict outcome based on negative/positive main effects and negative/positive interaction
newdat$NegativerAffekt <- -0.10 * newdat$bedingung - 0 * newdat$lebenszufriedenheit - 0.20 * newdat$bedingung*newdat$lebenszufriedenheit

# plot the effects
ggplot(data = newdat, aes(x=lebenszufriedenheit, y=NegativerAffekt, linetype=factor(bedingung, levels=c(0,1), labels = c("Kontrollbedingung", "Experimentalbedingung")))) +
  theme_bw() +
  xlab("Lebenszufriedenheit")+
  ylab("Veränderung negativer Affekt")+
  geom_line(size=0.9)+
  guides(linetype=guide_legend(title="Bedingung"))

# create plausible data
newdat <- expand.grid(
  lebenszufriedenheit = c(-1,0,1),
  bedingung = c(0,1),
  pre = 0
)

# predict outcome based on negative/positive main effects and negative/positive interaction
newdat$post <- 0.10 * newdat$bedingung + 0 * newdat$lebenszufriedenheit + 0.20 * newdat$bedingung*newdat$lebenszufriedenheit + 0.5 * newdat$pre

# plot the effects
ggplot(data = newdat, aes(x=lebenszufriedenheit, y=post, linetype=factor(bedingung, levels=c(0,1), labels = c("Kontrollbedingung", "Experimentalbedingung")))) +
  theme_bw() +
  xlab("Lebenszufriedenheit")+
  ylab("Post")+
  geom_line(size=0.9)+
  guides(linetype=guide_legend(title="Bedingung"))

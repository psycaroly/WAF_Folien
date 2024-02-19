library(ggplot2)

# create plausible data
newdat <- expand.grid(
  coping = c(-1,0,1),
  stress = c(-1,0,1)
)

# predict outcome based on negative/positive main effects and negative/positive interaction
newdat$wb <- -0.05 * newdat$coping - 0.5 * newdat$stress + 0.5 * newdat$coping*newdat$stress

# plot the effects
ggplot(data = newdat, aes(x=stress, y=wb, linetype=factor(coping, levels=c(-1,0,1)))) +
  theme_bw() +
  xlab("stress")+
  ylab("wb")+
  geom_line(size=0.9)+	
  guides(linetype=guide_legend(title="coping"))


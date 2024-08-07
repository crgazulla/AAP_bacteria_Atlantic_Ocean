library(tidyverse)

#Figure 3A:
fig3A <- phototrophy %>% 
  filter(station > 4) %>% 
  select(CDEC_Bchla, CDEC_Chla) %>% 
  pivot_longer(1:2, names_to = "pigment", values_to = "CDEC") %>% 
  filter(CDEC > 0) %>% 
  ggplot(aes(x=pigment, y=CDEC))+
  geom_boxplot()+
  scale_y_continuous(trans = "log10")+
  xlab(" ")+ylab("Light energy captured per cell (J/cell·day)")+
  theme_bw()+theme(axis.text=element_text(size=8))

#Figure 3B 
phototrophy$DCM_layer <- factor(phototrophy$DCM_layer, levels = c("below_DCM",
                                                                    "DCM",
                                                                    "above_DCM",
                                                                    "surf"))
DCMlayers <- c("surf" = "#93D5B1", 
               "above_DCM" = "#5FAEAE",
               "DCM"= "#4A82A1",
               "below_DCM" = "#415191", 
               "deep" = "#332848")

fig3B0<-phototrophy %>% 
  filter(station > 4) %>% 
  select(CDEC_Bchla, CDEC_Chla, DCM_layer) %>% 
  pivot_longer(1:2, names_to = "pigment", values_to = "CDEC") %>% 
  filter(CDEC > 0) %>% 
  ggplot(aes(x=CDEC, y=DCM_layer, fill=DCM_layer))+
  geom_boxplot(alpha=0.8)+
  scale_x_continuous(trans = "log10")+
  scale_fill_manual(values=DCMlayers)+
  ylab(" ")+xlab("Light energy captured per cell (J/cell·day)")+
  theme_bw()+
  facet_wrap(~pigment)+theme(axis.text=element_text(size=7))

fig3B <-fig3B0+theme(legend.position = "none")
fig3A+fig3B

#Script to generate panels B (right) and C (right) in Figure 2. 
#Panels A, B (left) and C (left) were generated with Ocean Data View.

library(tidyverse)
POS_data <- read_csv("data/expedition_data.csv")

#Figure 2, panel B right

POS_data %>% 
  filter(Bchla > 0) %>% 
  ggplot(aes(x=ab_aaps, y=Chla))+
  geom_point()+
  geom_smooth(method='lm', color="black",size=0.5)+
  ylab("AAP bacteria (cells/mL)")+
  xlab("Chlorophyll"~italic(a)~"(pM)")+
  theme_bw()

#Figure 2, panel C right

POS_data %>% 
  filter(Bchla > 0) %>% 
  ggplot(aes(x=Bchla, y=Chla))+
  geom_point()+
  geom_smooth(method='lm', color="black",size=0.5)+
  ylab("Bacteriochlorophyll"~italic(a)~"(pM)")+
  xlab("Chlorophyll"~italic(a)~"(pM)")+
  theme_bw()

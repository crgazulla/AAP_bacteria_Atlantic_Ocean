#Script to generate panels B (right) and C (right) in Figure 2. 
#Panels A, B (left) and C (left) were generated with Ocean Data View.

library(tidyverse)



 %>% 
  filter(DCM == "surf") %>% 
  ggplot(aes(x=Chla, y=Bchla))+
  geom_point()+
  geom_smooth(method='lm', color="black",size=0.5)+
  ylab("Bacteriochlorophyll"~italic(a)~"(pM)")+
  xlab("Chlorophyll"~italic(a)~"(pM)")+
  #geom_text(aes(label=ifelse(station<4,as.character(station),'')),hjust=1,vjust=1)+
  geom_text(aes(label=ifelse(station<4,as.character(station),'')),hjust=1.5,vjust=1.5, size=3)+
  geom_text(aes(label=ifelse(station==16,as.character(station),'')),hjust=1.5,vjust=1.5, size=3)+
  theme_bw()

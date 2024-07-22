#Scripts for Supplementary Figures S7, S8 and S9.


#Figure S7

expedition_data %>% 
  filter(DCM == "surf") %>% 
  ggplot(aes(x=Chla, y=Bchla))+
  geom_point()+
  geom_smooth(method='lm', color="black",size=0.5)+
  ylab("Bacteriochlorophyll"~italic(a)~"(pM)")+
  xlab("Chlorophyll"~italic(a)~"(pM)")+
  geom_text(aes(label=ifelse(station<4,as.character(station),'')),hjust=1.5,vjust=1.5, size=3)+
  geom_text(aes(label=ifelse(station==16,as.character(station),'')),hjust=1.5,vjust=1.5, size=3)+
  theme_bw()


#Figure S8

DCMlayers <- c("surf" = "#93D5B1", 
               "above_DCM" = "#5FAEAE",
               "DCM"= "#4A82A1",
               "below_DCM" = "#415191", 
               "deep" = "#332848")

phototrophy %>% 
  mutate(bchla_prop = (Bchla/(Bchla + Chla))*100 ) %>% 
  ggplot(aes(x=bchla_prop, y=DCM_layer, fill=DCM_layer)) +
  geom_boxplot()+
  scale_fill_manual(values=DCMlayers)+
  ylab(" ")+
  xlab("Bacteriochlorophyll"~italic(a)~"(%)")+
  theme_bw()+theme(legend.position = "none")

#Figure S9

phototrophy$DCM_layer <- factor(phototrophy$DCM_layer, levels=c("below_DCM",
                                                                "DCM",
                                                                "above_DCM",
                                                                "surf"))

phototrophy %>% 
  select(DCM_layer, PSU_L_Chla, PSU_L_Bchla) %>% 
  pivot_longer(2:3, names_to = "pigment", values_to = "PSU_L") %>% 
  ggplot(aes(x=PSU_L, y=DCM_layer))+
  geom_boxplot()+
  facet_wrap(~pigment, scales="free")+
  theme_bw()

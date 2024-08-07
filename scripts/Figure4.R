library(tidyverse)

#Figure 4A

fig4A <- phototrophy %>% 
  filter(station > 4) %>%
  ggplot(aes(x=ratio_CDEC, y=DCM_layer, fill=DCM_layer))+
  geom_boxplot(alpha=0.7)+
  scale_fill_manual(values=DCMlayers)+
  scale_x_continuous(trans="log10")+
  theme_bw()+
  ylab(" ")+xlab("Ratio of light energy captured Bchl a / Chl a")+
  theme(legend.position = "none")

#Figure 4B

integrated_data <- read_csv("data/integrated_data.csv")

groups <- c("Chla_light_int" = "#21b517",
            "BChla_light_int" = "#ab17b5") #7019a8

fig4B <- integrated_data %>%
  filter(station>4) %>% 
  select(latitude, BChla_light_int, Chla_light_int) %>% 
  pivot_longer(2:3, names_to = "group", values_to = "depth_int_light_capt") %>% 
  ggplot(aes(x=latitude, y=depth_int_light_capt, color=group, fill=group))+
  #geom_line()+
  scale_y_continuous(trans = "log10")+
  geom_smooth()+
  scale_color_manual(values=groups)+
  scale_fill_manual(values=groups)+
  xlim(-30, 25)+
  ylab("Depth integrated light energy captured \n (KJ/m2 day)")+
  xlab("Latitude")+
  theme_bw()

fig4A+fig4B

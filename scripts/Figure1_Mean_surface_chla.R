library(ncdf4) # package for netcdf manipulation
library(tidyverse) # package for tidying tables
library(reshape2) #to use melt function


surf_chla	<- nc_open("data/SNPP_VIIRS.20190301_20190331.L3m.MO.CHL.chlor_a.9km.nc")
POS_data <- read_csv("github_test/previous_phototrophy.csv") 


lon<-ncvar_get(surf_chla,"lon")
lat<-ncvar_get(surf_chla,"lat")
value<-ncvar_get(surf_chla,"chlor_a")
unit<-ncatt_get(surf_chla,"chlor_a","units")$value

dimnames(value)<-list(lon=lon,lat=lat)
dat_var<-melt(value,id="lon")
remove(lon)
remove(lat)

del_reg <- dat_var %>% 
  filter(lat <  30 & lon < 0) %>% 
  filter(lat > -60 & lon > -75) 

POS_data_map <- POS_data %>% 
  select(latitude, longitude)

del_reg %>% 
  filter(value < 5) %>% 
  ggplot(aes(lon, lat))+
  geom_tile(aes(fill=value))+
  ggtitle("Near surface chlorophyll concentration \nMarch 2019")+
  #scale_fill_gradient(name = "count", trans = "log")+
  geom_point(data = data.frame(x=POS_data_map$longitude,
                               y=POS_data_map$latitude), aes(x=x, y=y),
             color="black", size=2)+
  geom_point(data = data.frame(x=POS_data_map$longitude,
                               y=POS_data_map$latitude), aes(x=x, y=y),
             color="white", size=1)+
  scale_fill_gradientn(colours = c("#111F58", 
                                   "#23479E", 
                                   "#3D7AB3", 
                                   "#62B3C2",
                                   "#C1E2BC",
                                   "#FDFED7"),
                       trans = "log",
                       breaks = c(0.001,0.01,0.1,1,3),
                       name= expression(mg~m^{"-3"}))+
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  theme(
    panel.background = element_rect(fill = "snow3",
                                    colour = "snow3",
                                    size = 0.5, linetype = "solid"),
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank()
  )

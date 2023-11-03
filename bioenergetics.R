library(tidyverse)

light <- read_csv("light_data.csv") 

env <- read_csv("Abundance_and_pigment_data.csv") 

env_autopico <- env %>% 
  mutate(auto_picoplankton = Procs + Peuk1 + Syn) %>% 
  drop_na()

env_autopico_light <- env_autopico %>% 
  inner_join(light) %>% 
  mutate(PAR0 = PAR*0.94,
         PARz_mol = PAR0*exp(-(Kd*Depth)),
         PARz_day = PARz_mol*1000000,
         PARz = PARz_day/86400)

NAvog = 6.022*10^23

#Bacteriochlorophyll a
E0 = 5.4799*10^(-23)
Vmax = 87
Km = 191

#Chlorophyll a
E0_C = 1.0445*10^(-22)
Vmax_C = 140
Km_C = 40


phototrophy <- env_data_phototrophy_calc2 %>% 
  mutate(molec_per_cell_Bchla = Bchla*(10^(-12))*NAvog*(1/ab_aaps)*(1/1000),
         RC_per_cell_Bchla = molec_per_cell_Bchla/34,
         PSU_L_Bchla = ab_aaps*RC_per_cell_Bchla*1000,
         CDEC_Bchla = RC_per_cell_Bchla*E0*((Vmax*PARz)/(Km + PARz))*43200,
         net_benefit_Bchla = CDEC_Bchla - RC_per_cell_Bchla*(8.29*10^(-18)),
         
         molec_per_cell_Chla = Chla*(10^(-12))*NAvog*(1/auto_picoplankton)*(1/1000),
         RC_per_cell_Chla = molec_per_cell_Chla/300,
         PSU_L_Chla = auto_picoplankton*RC_per_cell_Chla*1000,
         CDEC_Chla = RC_per_cell_Chla*E0_C*((Vmax_C*PARz)/(Km_C + PARz))*43200,
         
         ratio_CDEC=CDEC_Bchla/CDEC_Chla,
         ratio_molmol=(Bchla/Chla)*100,
         
         Chla_ngL=Chla*(10^(-12))*893.5*1000)


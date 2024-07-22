# Scripts for *Vertical distribution and light energy capture by AAP bacteria along contrasted areas of productivity in the Atlantic Ocean*
A manuscript under review in *Limnology & Oceanography*
(BioRxiv doi: doi: https://doi.org/10.1101/2023.11.28.568994)

By Carlota R. Gazulla

Data and scripts are organized as follows:

Data
-
A main file ```Metadata Gazulla et al 2024 L&O.xlsx``` summarizes all the metadata. Below are listed the .csv files that should be used in the scripts.
- ```SNPP_VIIRS.20190301_20190331.L3m.MO.CHL.chlor_a.9km.nc``` is the near-surface chlorophyll data from March 2019, that is represented in Figure 1. It was downloaded from https://oceancolor.gsfc.nasa.gov/l3/. 
- ```expedition_data.csv``` contains basic data from the Poseidon Expedition (stations, depths, coordinates...), cell abundances from flow cytometry and pigment concentrations from the HPLC.
- ```light_data.csv``` contains the photosynthetic active radiation (PAR) and diffuse attenuation coefficients at 490 nm (Kd) for each station. The data has been downloaded from https://oceancolor.gsfc.nasa.gov/l3/.
- ```integrated_data.csv``` contains the integrated cellular daily energy yield at each station.

  
Scripts
-
- ```0_Bioenergetics.R``` contain all the light and bioenergetics calculations. It should be executed before the next scripts.
- ```Figure1_Mean_surface_chla.R``` is to generate Figure 1.
- ```Figure2.R``` to generate panels B (right) and C (right) in Figure 2. 
- ```Figure3.R``` to generate Figure 3.
- ```Figure4.R``` to generate Figure 4.
- ```Supplementary_Figures.R``` to generate Supplementary Figures S7, S8 and S9.

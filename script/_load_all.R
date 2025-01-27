library(tidyverse)


sa.countries <- c("Latin America and the Caribbean", "South America",
                  "Argentina", "Bolivia (Plurinational State of)", "Bolivia",
                  "Brazil", "Chile", "Colombia", "Ecuador", "French Guiana",
                  "Guyana", "Paraguay", "Peru", "Suriname", "Uruguay",
                  "Venezuela (Bolivarian Republic of)", "Venezuela", "Venezuela, RB")

##
### CO2 Emissions 
past.co2.emissions <- read_csv(
  "https://docs.google.com/spreadsheets/d/e/2PACX-1vQrCWZIziIphRJf5VusYOkeqeyFHn9Mu7e0hMwUn1WNsWQ5Tvnm8kgvQT6CucMRyw/pub?gid=241499434&single=true&output=csv"
) %>% subset(`Country Name` %in% sa.countries)


past.co2.emissions.edgar <- read_csv(
  "https://docs.google.com/spreadsheets/d/e/2PACX-1vQM1NHsby9rGPsy1u7KbEiTalWDHAeUP1oDTPZmaK_WoIOUqugKjcbGqO9MKnfuLA/pub?gid=4911012&single=true&output=csv"
) %>% subset(country_name %in% sa.countries)



sa.codes <- past.co2.emissions$`Country Code`


##
### Temperature: Historic and Forecasted
###

past.temps <- read_csv(
  "https://docs.google.com/spreadsheets/d/e/2PACX-1vTK88_VAPq64Ynx9-3KvLkbbgXVj0vqKLbZkPEY-f75_9oziJwn1KXnbuK_lxO1DT3EFb2ijwNxv9yf/pub?gid=119339870&single=true&output=csv"
)%>% subset( Country %in% sa.countries)

future.temps <- read_csv(
  "https://docs.google.com/spreadsheets/d/e/2PACX-1vSOISUFAmnpH1jbvnlmBMA-ejmdZiFqKqe6Od-HwWE85jOxDYDMoLEZ3OwiXcWs2gN57sDmvcg77Fg7/pub?output=csv"
)%>% subset( Country %in% sa.countries)



#
## Tree Loss
## Source: FAO


past.forest.area.change <- read_csv(
  "https://docs.google.com/spreadsheets/d/e/2PACX-1vT9hhXZnnSXLwTNqgC7LshGk4T2lFcSSGGehaODKQI3Z1i8Lj-u2At2J36oEp2vA5xSpaAgNH4sSmbu/pub?gid=882232606&single=true&output=csv"
) %>% 
  subset( Entity  %in% sa.countries)



#
## IUCN Red List
## Source: IUCN

past.endangered.species <- read_csv(
  "https://docs.google.com/spreadsheets/d/e/2PACX-1vRPNNZgi-QzPv2XIL0V-sBYh9bjdREZTiEyYau18U81IvcTm4nrZazoB50KWQTDs--hmX4avWWW76lj/pub?gid=126816506&single=true&output=csv"
) %>% 
  subset( Entity  %in% sa.countries)




#
## Renewable Energy
## Source: WB

past.renewable.energy.perc <- read_csv(
  "https://docs.google.com/spreadsheets/d/e/2PACX-1vSMlEG1R9u2xM96yZJJFKv3e7Z8PPzjWj-VgslOKduS3XbEd8tmQ-ln6LFeZsJsAA/pub?gid=603083004&single=true&output=csv"
) %>% 
  subset( `Country Name`  %in% sa.countries)



#
## Sea Level Rise
## Source: WB

future.sealevelrise.land <- read_csv(
  "https://docs.google.com/spreadsheets/d/e/2PACX-1vSiG4kAW772UuqbPX6qwmCGzmG9UokcJroGy4sKv39PHIixvP_C6BMAPHSmMOZ-HA/pub?gid=515851616&single=true&output=csv"
) %>% 
  subset( countryname  %in% sa.countries)


future.sealevelrise.pop<- read_csv(
  "https://docs.google.com/spreadsheets/d/e/2PACX-1vSiG4kAW772UuqbPX6qwmCGzmG9UokcJroGy4sKv39PHIixvP_C6BMAPHSmMOZ-HA/pub?gid=1107893548&single=true&output=csv"
) %>% 
  subset( countryname  %in% sa.countries)




#
## Protected Terrestrial Area
## Source: WB

past.protected.area <- read_csv(
  "https://docs.google.com/spreadsheets/d/e/2PACX-1vQCDBjKa-W72vMltqyxtxaHMuAGEzS3GlMtdcAN5WlGHw2UX4GYA5nolMr29HNfm98XlmScBgNZV6Fz/pub?gid=1466645411&single=true&output=csv"
) %>% 
  subset( Entity  %in% sa.countries)







#
## Population: Historic & Forecast
## Source: UN
## In the 1000

past.pop.historic <- read_csv(
  "https://docs.google.com/spreadsheets/d/e/2PACX-1vRgWsKgsI1hbUu_WZQ9LSXciv5ylJQWySYjAc6ZKMd5EeAkP8S45UysPYyPU7rE4w/pub?gid=16662483&single=true&output=csv"
)%>% 
  subset( region  %in% sa.countries)


future.pop.forecast <- read_csv(
  "https://docs.google.com/spreadsheets/d/e/2PACX-1vRgWsKgsI1hbUu_WZQ9LSXciv5ylJQWySYjAc6ZKMd5EeAkP8S45UysPYyPU7rE4w/pub?gid=1003568403&single=true&output=csv"
)%>% 
  subset( region  %in% sa.countries)






#
## Water Availability
##


past.wateravailabily.current <- read_csv(
  "https://docs.google.com/spreadsheets/d/e/2PACX-1vRoXnZn7nAwK43uOeJfsf0BWIavRMKuaMuRY1V-PbU2I9EQD0d7e7vTIxzO6hC4ow/pub?gid=868895140&single=true&output=csv"
) %>% 
  subset( name  %in% sa.countries)


future.wateravailabily.forecast <- read_csv(
  "https://docs.google.com/spreadsheets/d/e/2PACX-1vROD3ePdtl-0b8B8ieyo9bPjCgXgZCXx0Q6869WTM3UqMBg1lID2T2UX8k0MskvwQ/pub?gid=195587449&single=true&output=csv"
) %>% 
  subset( Name  %in% sa.countries)


##
## CRI
## Source: Germanwatch

past.cri.score <- read_csv(
  "https://docs.google.com/spreadsheets/d/e/2PACX-1vQvocPpyIUr_Vo5YeVfTEgi7GEmjiFu6jkO3K_Z1u0i7mzu5Nb6Ju0gbzRj9f67z2uMyBc0D20AAjF0/pub?gid=0&single=true&output=csv"
)

past.cri.score$cri_score <- as.numeric(as.character(past.cri.score$cri_score))



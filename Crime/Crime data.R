library("RSocrata")
library("censusxy")
library("tidyverse")
library("data.table")
library("parallel")
df <- read.socrata(
  "https://data.lacity.org/resource/63jg-8b9z.json",
  app_token = "Y3Xn05U2hZFFzIFyBbtuA0Xv2",
  email     = ,
  password  = 
)

voilent_crimes <- c(110, 113, 121, 122, 815, 820, 210, 220, 230, 235, 236, 250, 
                    251, 761, 926, 435, 436, 437, 622, 623, 624, 625, 627, 647,
                    763, 928, 930)
property_crimes <- c(310, 320, 510, 520, 433, 330, 331, 410, 420, 421, 350, 351,
                     352, 353, 450, 451, 452, 453, 341, 343, 440, 441, 442, 443, 
                     444, 445, 470, 471, 472, 473, 474, 475, 480, 485, 487, 491)
crime_data<-df %>%                     
  select("date_rptd","crm_cd", "lat","lon","dr_no")%>%
  summarize(
    "Date"        = as.Date(date_rptd),
    "Crime_Code"  = as.numeric(crm_cd),
    "Latitude"    = as.numeric(lat),
    "Longitude"   = as.numeric(lon),
    "Crime_Type"  = 0
    )
for (i in 1:length(crime_data$Crime_Code)){
  if(crime_data$Crime_Code[i] %in% voilent_crimes){
    crime_data$Crime_Type[i] = 1
  }
  else if(crime_data$Crime_Code[i] %in% property_crimes){
    crime_data$Crime_Type[i] = 2
  }
  print(i)
}
crime_data<-filter(crime_data, crime_data$Crime_Type !=0)
crime_data<-filter(crime_data, crime_data$Latitude !=0 & crime_data$Longitude !=0)
crime_data<-crime_data[order(as.Date(crime_data$Date, format="%Y/%m/%d")),]

lon<-crime_data$Longitude[1:100000]
lat<-crime_data$Latitude[1:100000]
date <-crime_data$Date[1:100000]
type <-crime_data$Crime_Type[1:100000]

crime_blocks <- data.frame(matrix(ncol = 4, nrow = 0))

colnames(crime_blocks)<- c("X2020.Census.Blocks.GEOID","X2020.Census.Blocks.BLOCK","Census.Tracts.TRACT")
block<-function(lon,lat,date,type){
  crime_geo<-cxy_geography(lon,lat)
  crime_blocks<-select(crime_geo,"X2020.Census.Blocks.GEOID","X2020.Census.Blocks.BLOCK","Census.Tracts.TRACT")
  print(date)
  return (crime_blocks)
}
crimeblock<-rbind(t(mcmapply(lon,lat,date,type,FUN=block,mc.cores = 4)),crime_blocks)
crimeblock15 <- crimeblock15[-c(1),]
fwrite(crimeblock15,"crimeblock15.csv")
crimeblock1<-rbind(t(mapply(block,lon,lat,date)),crime_blocks)
crimeblock1<-rbind(t(mapply(block,lon,lat,date)),crime_blocks)
fwrite(crime_data,"crime_data.csv")
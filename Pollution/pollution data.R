library("magrittr")
library("tidyverse")
library("data.table")

POL_2011 <- readr::read_csv("./pollution dataset/RSEI_blockgroup_year2011_consistent2011_lower48.csv")%>%
  mutate(
    'toxconc.2011' = toxconc)%>%
  select(
    geoid,toxconc.2011
  )
POL_2012 <- readr::read_csv("./pollution dataset/RSEI_blockgroup_year2012_consistent2011_lower48.csv")%>%
  mutate(
  'toxconc.2012' = toxconc)%>%
  select(
    geoid,toxconc.2012
  )
POL_2013 <- readr::read_csv("./pollution dataset/RSEI_blockgroup_year2013_consistent2011_lower48.csv")%>%
mutate(
  'toxconc.2013' = toxconc)%>%
  select(
    geoid,toxconc.2013
  )
POL_2014 <- readr::read_csv("./pollution dataset/RSEI_blockgroup_year2014_consistent2011_lower48.csv")%>%
mutate(
  'toxconc.2014' = toxconc)%>%
  select(
    geoid,toxconc.2014
  )
POL_2015 <- readr::read_csv("./pollution dataset/RSEI_blockgroup_year2015_consistent2011_lower48.csv")%>%
  mutate(
    'toxconc.2015' = toxconc)%>%
  select(
    geoid,toxconc.2015
  )

POL_2016 <- readr::read_csv("./pollution dataset/RSEI_blockgroup_year2016_consistent2011_lower48.csv")%>%
  mutate(
    'toxconc.2016' = toxconc)%>%
  select(
    geoid,toxconc.2016
  )

POL_2017 <- readr::read_csv("./pollution dataset/RSEI_blockgroup_year2017_consistent2011_lower48.csv")%>%
  mutate(
    'toxconc.2017' = toxconc)%>%
  select(
    geoid,toxconc.2017
  )

POL_2018 <- readr::read_csv("./pollution dataset/RSEI_blockgroup_year2018_consistent2011_lower48.csv")%>%
  mutate(
    'toxconc.2018' = toxconc)%>%
  select(
    geoid,toxconc.2018
  )

POL_2019 <- readr::read_csv("./pollution dataset/RSEI_blockgroup_year2019_consistent2011_lower48.csv")%>%
  mutate(
    'toxconc.2019' = toxconc)%>%
  select(
    geoid,toxconc.2019
  )
POL_2020 <- readr::read_csv("./pollution dataset/RSEI_blockgroup_year2020_consistent2011_lower48.csv")%>%
  mutate(
    'toxconc.2020' = toxconc)%>%
  select(
    geoid,toxconc.2020
  )

pollution.1 <- merge (POL_2011,POL_2012,by="geoid")
pollution.1<-merge(pollution.1,POL_2013,by="geoid")
pollution.1<-merge(pollution.1,POL_2014,by="geoid")
pollution.1<-merge(pollution.1,POL_2015,by="geoid")
pollution.1<-pollution.1%>%
  mutate(
    "GEO_ID"       =	paste("1500000US",geoid, sep=""),
    "mean_toxconc" = as.numeric(toxconc.2011+toxconc.2012+toxconc.2013+toxconc.2014+toxconc.2015)/5
  )%>%
  select(
    GEO_ID,mean_toxconc
  )


pollution.2 <- merge (POL_2016,POL_2017,by="geoid")
pollution.2<-merge(pollution.2,POL_2018,by="geoid")
pollution.2<-merge(pollution.2,POL_2019,by="geoid")
pollution.2<-merge(pollution.2,POL_2020,by="geoid")

pollution.2<-pollution.2%>%
  mutate(
    "GEO_ID"       =	paste("1500000US",geoid, sep=""),
    "mean_toxconc" = as.numeric(toxconc.2016+toxconc.2017+toxconc.2018+toxconc.2019+toxconc.2020)/5
  )%>%
  select(
    GEO_ID,mean_toxconc
  )
pollution.2 <- merge(pollution.2, Geographic_crosswalk_10_20,by="GEO_ID")%>%
  mutate(
    "GEO_ID" = GEO_ID_20
  )%>%
  select(
    "GEO_ID","mean_toxconc")


    
  


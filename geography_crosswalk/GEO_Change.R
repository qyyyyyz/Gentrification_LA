Geographic_crosswalk_10_20 <- read.csv("./Crime/geography_crosswalk/nhgis_bg2020_bg2010_06.csv")%>%
 mutate(
    "GEO_ID"=case_when(str_length(bg2010ge) ==11~paste("1500000US0",bg2010ge,sep=""),
             str_length(bg2010ge) ==12~paste("1500000US", bg2010ge,sep="")),
    "GEO_ID_20"=case_when(str_length(bg2020ge) ==11~paste("1500000US0",bg2020ge,sep=""),
                    str_length(bg2020ge) ==12~paste("1500000US", bg2020ge,sep=""))
  )%>%
  select(
    "GEO_ID","GEO_ID_20"
  )

Geographic_crosswalk_00_10 <- read.csv("./Crime/geography_crosswalk/nhgis_blk2000_blk2010_ge_06.csv")%>%
  mutate(
    "GEO_ID_00"=case_when(str_length(substr(GEOID00,1,str_length(GEOID00)-3)) ==11~paste("1500000US0",substr(GEOID00,1,str_length(GEOID00)-3),sep=""),
                       str_length(substr(GEOID00,1,str_length(GEOID00)-3)) ==12~paste("1500000US", substr(GEOID00,1,str_length(GEOID00)-3),sep="")),
    "GEO_ID"=case_when(str_length(substr(GEOID10,1,str_length(GEOID10)-3)) ==11~paste("1500000US0",substr(GEOID10,1,str_length(GEOID10)-3),sep=""),
                          str_length(substr(GEOID10,1,str_length(GEOID10)-3)) ==12~paste("1500000US", substr(GEOID10,1,str_length(GEOID10)-3),sep=""))
  )%>%
  select(
    "GEO_ID","GEO_ID_00")
Geographic_crosswalk_00_10<- Geographic_crosswalk_00_10[!duplicated(Geographic_crosswalk_00_10), ]
# Need to drop merged district
Geographic_crosswalk <- merge(Geographic_crosswalk_00_10,Geographic_crosswalk_10_20,by ="GEO_ID")

Geographic_crosswalk_00_20 <- Geographic_crosswalk%>%
  mutate(
    "GEO_ID"    =GEO_ID_00,
    "GEO_ID_20" =GEO_ID_20
  )%>%
  select(
    "GEO_ID","GEO_ID_20"
  )
Geographic_crosswalk_00_20<- Geographic_crosswalk_00_20[!duplicated(Geographic_crosswalk_00_20), ]

Geographic_crosswalk_10_20 <-Geographic_crosswalk_10_20%>%
  add_count(GEO_ID_20)%>%
  filter(n==1)%>%
  select(
    'GEO_ID',"GEO_ID_20"
  )
library("tidyverse")
library("data.table")
LA_2011<- read.csv("./migration/LA_2011.csv")
LA_2012<- read.csv("./migration/LA_2012.csv")
LA_2013<- read.csv("./migration/LA_2013.csv")
LA_2014<- read.csv("./migration/LA_2014.csv")
LA_2015<- read.csv("./migration/LA_2015.csv")

LA_2016<- read.csv("./migration/LA_2016.csv")
LA_2017<- read.csv("./migration/LA_2017.csv")
LA_2018<- read.csv("./migration/LA_2018.csv")
LA_2019<- read.csv("./migration/LA_2019.csv")
LA_2020<- read.csv("./migration/LA_2020.csv")


LA_2011<-LA_2011%>%
  filter(
    OWNER_RENTER_STATUS!=6 &OWNER_RENTER_STATUS !=5&OWNER_RENTER_STATUS!=4
  )%>%
  transmute(
    'FAMILYID'           = FAMILYID,
    'BLOCKID2011'        = paste("06","0",GE_ALS_COUNTY_CODE_2010,GE_ALS_CENSUS_TRACT_2010,GE_ALS_CENSUS_BG_2010,sep=""),
    'NAME2011'           = paste(first_name_1, first_name_2, first_name_3, last_name_1, last_name_2, last_name_3, sep=""),
    'STATUS2011'         = if_else(OWNER_RENTER_STATUS>=7,0,1),
    'OWNER_RENTER_STATUS'= OWNER_RENTER_STATUS,
    'INCOME_ES2011'          = FIND_DIV_1000
     )
    
LA_2012<-LA_2012%>%
  filter(
    OWNER_RENTER_STATUS!=6 &OWNER_RENTER_STATUS !=5&OWNER_RENTER_STATUS!=4
  )%>%
  transmute(
    'FAMILYID'         = FAMILYID,
    'BLOCKID2012'      = paste("06","0",GE_ALS_COUNTY_CODE_2010,GE_ALS_CENSUS_TRACT_2010,GE_ALS_CENSUS_BG_2010,sep=""),
    'NAME2012'         = paste(first_name_1, first_name_2, first_name_3, last_name_1, last_name_2, last_name_3, sep=""),
    'STATUS2012'       = if_else(OWNER_RENTER_STATUS>=7,0,1),
    'INCOME_ES2012'        = FIND_DIV_1000
  )
LA_2013<-LA_2013%>%
  filter(
    OWNER_RENTER_STATUS!=6 &OWNER_RENTER_STATUS !=5&OWNER_RENTER_STATUS!=4
  )%>%
  transmute(
    'FAMILYID'         = FAMILYID,
    'BLOCKID2013'      = paste("06","0",GE_ALS_COUNTY_CODE_2010,GE_ALS_CENSUS_TRACT_2010,GE_ALS_CENSUS_BG_2010,sep=""),
    'NAME2013'         = paste(first_name_1, first_name_2, first_name_3, last_name_1, last_name_2, last_name_3, sep=""),
    'STATUS2013'       = if_else(OWNER_RENTER_STATUS>=7,0,1),
    'INCOME_ES2013'        = FIND_DIV_1000
  )

LA_2014<-LA_2014%>%
  filter(
    OWNER_RENTER_STATUS!=6 &OWNER_RENTER_STATUS !=5&OWNER_RENTER_STATUS!=4
  )%>%
  transmute(
    'FAMILYID'         = FAMILYID,
    'BLOCKID2014'      = paste("06","0",GE_ALS_COUNTY_CODE_2010,GE_ALS_CENSUS_TRACT_2010,GE_ALS_CENSUS_BG_2010,sep=""),
    'NAME2014'         = paste(first_name_1, first_name_2, first_name_3, last_name_1, last_name_2, last_name_3, sep=""),
    'STATUS2014'       = if_else(OWNER_RENTER_STATUS>=7,0,1),
    'INCOME_ES2014'        = FIND_DIV_1000
  )
LA_2015<-LA_2015%>%
  filter(
    OWNER_RENTER_STATUS!=6 &OWNER_RENTER_STATUS !=5&OWNER_RENTER_STATUS!=4
  )%>%
  transmute(
    'FAMILYID'         = FAMILYID,
    'BLOCKID2015'      = paste("06","0",GE_ALS_COUNTY_CODE_2010,GE_ALS_CENSUS_TRACT_2010,GE_ALS_CENSUS_BG_2010,sep=""),
    'NAME2015'         = paste(first_name_1, first_name_2, first_name_3, last_name_1, last_name_2, last_name_3, sep=""),
    'STATUS2015'       = if_else(OWNER_RENTER_STATUS>=7,0,1),
    'INCOME_ES2015'        = FIND_DIV_1000
  )

LA_2016<-LA_2016%>%
  filter(
    OWNER_RENTER_STATUS!=6 &OWNER_RENTER_STATUS !=5&OWNER_RENTER_STATUS!=4
  )%>%
  transmute(
    'FAMILYID'         = FAMILYID,
    'BLOCKID2016'      = paste("06","0",GE_ALS_COUNTY_CODE_2010,GE_ALS_CENSUS_TRACT_2010,GE_ALS_CENSUS_BG_2010,sep=""),
    'NAME2016'         = paste(first_name_1, first_name_2, first_name_3, last_name_1, last_name_2, last_name_3, sep=""),
    'STATUS2016'       = if_else(OWNER_RENTER_STATUS>=7,0,1),
    'INCOME_ES2016'        = FIND_DIV_1000
  )

LA_2017<-LA_2017%>%
  filter(
    OWNER_RENTER_STATUS!=6 &OWNER_RENTER_STATUS !=5&OWNER_RENTER_STATUS!=4
  )%>%
  transmute(
    'FAMILYID'         = FAMILYID,
    'BLOCKID2017'      = paste("06","0",GE_ALS_COUNTY_CODE_2010,GE_ALS_CENSUS_TRACT_2010,GE_ALS_CENSUS_BG_2010,sep=""),
    'NAME2017'         = paste(first_name_1, first_name_2, first_name_3, last_name_1, last_name_2, last_name_3, sep=""),
    'STATUS2017'       = if_else(OWNER_RENTER_STATUS>=7,0,1),
    'INCOME_ES2017'        = FIND_DIV_1000
  )

LA_2018<-LA_2018%>%
  filter(
    OWNER_RENTER_STATUS!=6 &OWNER_RENTER_STATUS !=5&OWNER_RENTER_STATUS!=4
  )%>%
  transmute(
    'FAMILYID'         = FAMILYID,
    'BLOCKID2018'      = paste("06","0",GE_ALS_COUNTY_CODE_2010,GE_ALS_CENSUS_TRACT_2010,GE_ALS_CENSUS_BG_2010,sep=""),
    'NAME2018'         = paste(first_name_1, first_name_2, first_name_3, last_name_1, last_name_2, last_name_3, sep=""),
    'STATUS2018'       = if_else(OWNER_RENTER_STATUS>=7,0,1),
    'INCOME_ES2018'        = FIND_DIV_1000
  )
LA_2019<-LA_2019%>%
  filter(
    OWNER_RENTER_STATUS!=6 &OWNER_RENTER_STATUS !=5&OWNER_RENTER_STATUS!=4
  )%>%
  transmute(
    'FAMILYID'         = FAMILYID,
    'BLOCKID2019'      = paste("06","0",GE_ALS_COUNTY_CODE_2010,GE_ALS_CENSUS_TRACT_2010,GE_ALS_CENSUS_BG_2010,sep=""),
    'NAME2019'         = paste(first_name_1, first_name_2, first_name_3, last_name_1, last_name_2, last_name_3, sep=""),
    'STATUS2019'       = if_else(OWNER_RENTER_STATUS>=7,0,1),
    'INCOME_ES2019'        = FIND_DIV_1000
  )

LA_2020$GEO_ID<- GEO_2020$X2020.Census.Blocks.GEOID
LA_2020<-LA_2020%>%
  filter(
    owner_renter_status!=6 &owner_renter_status!=5&owner_renter_status!=4
  )%>%
  transmute(
    'FAMILYID'         = FamilyID,
    'NAME2020'         = paste(first_name_2, first_name_3, last_name_1, last_name_2, last_name_3, sep=""),
    'STATUS2020'           = if_else(owner_renter_status>=7,0,1),
    'GEO_ID'           = GEO_ID,
    'INCOME_ES2020'        = find_div_1000
  )
LA_2020$GEO_ID = substr(LA_2020$GEO_ID,1,str_length(LA_2020$GEO_ID)-3)
LA_2020$GEO_ID = case_when(str_length(LA_2020$GEO_ID) ==11~paste("1500000US0",LA_2020$GEO_ID,sep=""),
                           str_length(LA_2020$GEO_ID) ==12~paste("1500000US", LA_2020$GEO_ID,sep=""))
#adjust 2020 data into 2010 census geographical blocks
LA_2020_st <- merge(LA_2020, Geographic_crosswalk_10_20,by="GEO_ID")%>%
  mutate(
    "GEO_ID" = substr(GEO_ID_10,10,str_length(GEO_ID_10))
  )%>%
  select(
    "GEO_ID","FAMILYID","NAME2020","STATUS2020"
  )



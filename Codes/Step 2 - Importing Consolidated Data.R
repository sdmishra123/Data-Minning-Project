setwd("C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/test/Processed data")

library("rjson")
library(plyr)
library(readr)
library(tidyr)
library(dplyr)
library(stringr)
library(sqldf)

mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/test/Processed data"
# myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
# myfiles
# kick_2016_2020 = ldply(myfiles, read_csv)

kick_2020<- read.csv("data_2020_final.csv")
kick_2019<- read.csv("data_2019_final.csv")
kick_2018<- read.csv("data_2018_final_v1.csv")
kick_2017<- read.csv("data_2017_final.csv")
kick_2016<- read.csv("data_2016_final.csv")

#Kaggle Dataset
kaggle_data_asof2018<- read.csv("ks-projects-201801.csv")
#No duplicates found

kaggle_data_asof2018$source<-"Kaggle-2016-2018"



kick_2020$source<-"Web-2020"
kick_2019$source<-"Web-2019"
kick_2018$source<-"Web-2018"
kick_2017$source<-"Web-2017"
kick_2016$source<-"Web-2016"

kick_2020$Year<-2020
kick_2019$Year<-2019
kick_2018$Year<-2018
kick_2017$Year<-2017
kick_2016$Year<-2016

kaggle_data_asof2018$state_changed_date<-kaggle_data_asof2018$deadline

kick_2016_2020_v1<- rbind(kick_2020,kick_2019,kick_2018,kick_2017,kick_2016)

kick_2016_2020_v1<-arrange(kick_2016_2020_v1,id,desc(Year)) 

#test<-sqldf("select id, count(Year) as cnt from kick_2016_2020_v1 group by id ")
#test1<- sqldf("select * from kick_2016_2020_v1 where id='8624'")
#test2<- sqldf("select * from kick_2016_2020_v2 where id='8624'")

kick_2016_2020_v2 <- kick_2016_2020_v1 %>% 
  group_by(id) %>%
  slice(which.max(Year))

# kaggle_data_asof2018_v1<-kaggle_data_asof2018[!duplicated(kaggle_data_asof2018$ID),]
# kick_2020_v1<-kick_2020[!duplicated(kick_2020$id),]
# kick_2019_v1<-kick_2019[!duplicated(kick_2019$id),]
# kick_2018_v1<-kick_2018[!duplicated(kick_2018$id),]
# kick_2017_v1<-kick_2017[!duplicated(kick_2017$id),]
# kick_2016_v1<-kick_2016[!duplicated(kick_2016$id),]

#new_DF <- DF[is.na(DF$Var),]
#test_name_2020<-subset(kick_2020_v1,is.na(kick_2020_v1$name))

#write.csv(kick_2016_2020_v1,"web_data.csv")
#kick_2016_2020_v1$flag2<-"Web"
#kick_2016_2020_v1$flag1<-""

kick_2016_2020_v2$usd_pledged_real<-kick_2016_2020_v2$usd_pledged
kick_2016_2020_v2$usd_goal_real<-kick_2016_2020_v2$usd_goal

kick_2016_2020_v2$Month<-months(as.Date(kick_2016_2020_v2$launched_date))
kick_2016_2020_v2$Month<-substr(kick_2016_2020_v2$Month,1,3)

#Check if the # of variables in all the tables are same
n_2020<-names(kick_2020)
n_2019<-names(kick_2019)
n_2018<-names(kick_2018)
n_2017<-names(kick_2017)
n_2016<-names(kick_2016)

#common_data<- sqldf("select a.ID from kaggle_data_asof2018_v1 a inner join kick_2016_2020_v2 b
                    #on a.ID = b.id")

#uncommon_data<- sqldf("select a.ID, b.id as missing_ids from kaggle_data_asof2018_v1 a left join kick_2016_2020_v2 b
                    #on a.ID = b.id")

#missing_data<-uncommon_data[is.na(uncommon_data$missing_ids),]

#fetch_mis_data_kagg<-sqldf("select * from kaggle_data_asof2018_v1 a inner join missing_data b
                           #on a.ID = b.ID")

#tesstt<- sqldf("select * from kick_2016_2020_v1 where id='1000002330' ")


kaggle_data_asof2018$state_changed_date<-kaggle_data_asof2018$deadline
kaggle_data_asof2018$created_date<-kaggle_data_asof2018$launched
#kaggle_data_asof2018_v1$Month_Yr<-format(as.Date(kaggle_data_asof2018_v1$launched), "%Y-%m")
#kaggle_data_asof2018_v1$Year<-format(as.Date(kaggle_data_asof2018_v1$launched), "%Y")
kaggle_data_asof2018$Month_Yr<-paste(kaggle_data_asof2018$Year,kaggle_data_asof2018$Month,sep="-")


kaggle_data_asof2018_v2<-kaggle_data_asof2018 %>% rename(id=ID,backers_count=backers,
                                                            category_name=category,main_category_name=main_category,
                             country=country,currency=currency,goal=goal,
                             state= state,
                             pledged=pledged,
                             usd_pledged=usd.pledged,
                             usd_goal_real=usd_goal_real,
                             deadline_date=deadline,
                             launched_date=launched,
                             created_date=created_date,
                             name=name,
                             usd_pledged_real=usd_pledged_real,
                             Year=Year
)

head(kaggle_data_asof2018_v2)

keep_vars<-c("id","name","category_name","main_category_name","country",
             "currency" ,  
             "backers_count",
             "goal" ,"pledged" ,"usd_pledged","usd_pledged_real","usd_goal_real",
             "launched_date","created_date","state_changed_date","deadline_date" ,  
              "Month_Yr", "state" ,"Year" , "Month" , "source")


kaggle_data_asof2018_v3<-kaggle_data_asof2018_v2[,names(kaggle_data_asof2018_v2) %in% keep_vars]

kick_2016_2020_v3<-kick_2016_2020_v2[,names(kick_2016_2020_v2) %in% keep_vars]
kick_2016_2020_v3$Year<-as.numeric(kick_2016_2020_v3$Year)

final_combined_dataset_v1<-bind_rows(kick_2016_2020_v3,kaggle_data_asof2018_v3)

final_combined_dataset_v2<-arrange(final_combined_dataset_v1,id,Year) 

#test<-sqldf("select id, count(Year) as cnt from final_combined_dataset_v2 group by id ")
tt<-sqldf("select * from final_combined_dataset_v1 where id ='1556198855' ")

final_combined_dataset_v3 <- final_combined_dataset_v2 %>% 
  group_by(id) %>%
  slice(which.max(Year))  

tt<-sqldf("select * from kaggle_data_asof2018_v3 where id ='1131956331' ")
tt<-sqldf("select * from kick_2016_2020_v3 where id ='1131956331' ")
#final_combined_dataset_v1$state_changed_date_v1 <- ifelse(final_combined_dataset_v1$source=="Kaggle-2016-2018",as.Date(final_combined_dataset_v1$deadline_date,"%B %d %Y"),as.Date(final_combined_dataset_v1$state_changed_date,"%B %d %Y"))

table(final_combined_dataset_v3$source)
#table(final_combined_dataset_v1$flag1)
#table(final_combined_dataset_v1$flag2)

write.csv(final_combined_dataset_v3,"Web_Kaggle_Data_2015_2020_v1.csv")

#miss_value<-sqldf("select * from final_combined_dataset_v1 where state_changed_date='' ")


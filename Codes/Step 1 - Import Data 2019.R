library("rjson")
library(plyr)
library(readr)
library(tidyr)
library(dplyr)
library(stringr)
library(sqldf)


#JAN 2019
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2019/1 Jan"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2019_jan = ldply(myfiles, read_csv)

#FEB
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2019/2 Feb"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2019_feb= ldply(myfiles, read_csv)

#MAR
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2019/3 Mar"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2019_mar = ldply(myfiles, read_csv)

#APR
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2019/4 Apr"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2019_apr = ldply(myfiles, read_csv)

#MAY
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2019/5 May"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2019_may = ldply(myfiles, read_csv)

#JUN
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2019/6 Jun"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2019_jun = ldply(myfiles, read_csv)

#JUL
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2019/7 Jul"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2019_jul = ldply(myfiles, read_csv)

#AUG
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2019/8 Aug"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2019_aug = ldply(myfiles, read_csv)

#SEP
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2019/9 Sep"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2019_sep = ldply(myfiles, read_csv)

#OCT
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2019/10 Oct"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2019_oct = ldply(myfiles, read_csv)

#NOV
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2019/11 Nov"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2019_nov = ldply(myfiles, read_csv)

#DEC
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2019/12 Dec"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2019_dec = ldply(myfiles, read_csv)


drop <- c("unread_messages_count","unseen_activity_count")
data_2019_jun = data_2019_jun[,!(names(data_2019_jun) %in% drop)]

drop <- c("country_displayable_name")
data_2019_dec = data_2019_dec[,!(names(data_2019_dec) %in% drop)]

drop <- c("country_displayable_name")
data_2019_oct = data_2019_oct[,!(names(data_2019_oct) %in% drop)]

drop <- c("country_displayable_name")
data_2019_nov = data_2019_nov[,!(names(data_2019_nov) %in% drop)]


data_2019_jan_v1<-data_2019_jan[!duplicated(data_2019_jan$id),]
data_2019_feb_v1<-data_2019_feb[!duplicated(data_2019_feb$id),]
data_2019_mar_v1<-data_2019_mar[!duplicated(data_2019_mar$id),]
data_2019_apr_v1<-data_2019_apr[!duplicated(data_2019_apr$id),]
data_2019_may_v1<-data_2019_may[!duplicated(data_2019_may$id),]
data_2019_jun_v1<-data_2019_jun[!duplicated(data_2019_jun$id),]
data_2019_jul_v1<-data_2019_jul[!duplicated(data_2019_jul$id),]
data_2019_aug_v1<-data_2019_aug[!duplicated(data_2019_aug$id),]
data_2019_sep_v1<-data_2019_sep[!duplicated(data_2019_sep$id),]
data_2019_oct_v1<-data_2019_oct[!duplicated(data_2019_oct$id),]
data_2019_nov_v1<-data_2019_nov[!duplicated(data_2019_nov$id),]
data_2019_dec_v1<-data_2019_dec[!duplicated(data_2019_dec$id),]



# I saw that the field usd_type was not populated correctly.
data_2019 <- rbind(data_2019_dec_v1,data_2019_nov_v1,data_2019_oct_v1,data_2019_sep_v1,data_2019_aug_v1,data_2019_jul_v1,
                   data_2019_jun_v1,data_2019_may_v1,data_2019_apr_v1,data_2019_mar_v1,data_2019_feb_v1,data_2019_jan_v1)

data_2019$usd_type_v1<- ifelse(data_2019$currency=="USD", "domestic","international")

data_2019<-data_2019[!duplicated(data_2019$id),]

data_2019$category<-str_sub(data_2019$category, 2, str_length(data_2019$category))
data_2019$creator<-str_sub(data_2019$creator, 2, str_length(data_2019$creator))
data_2019$location<-str_sub(data_2019$location, 2, str_length(data_2019$location))
data_2019$profile<-str_sub(data_2019$profile, 2, str_length(data_2019$profile))


#testt<-sqldf("select * from data_2019 where id =188790")

data_2019_v1<-separate(data = data_2019, col =category, sep = ",", 
                       c("category_id","category_name","main_category_name","position_id","parent_id","color_id","urls_link"))



data_2019_v1<-separate(data = data_2019_v1, col =creator, sep = ",", 
                       c("creator_id","creator_name","is_registered","chosen_currency","is_superbacker","avatar","urls_link1"))


data_2019_v1<-separate(data = data_2019_v1, col =location, sep = ",", 
                       c("location_id","location_name","location_slug","location_short_name","loc_displayable_name","localized_name","loc_country_ID","loc_state",
                         "location_type","loc_is_root","loc_expanded_country","loc_url_links2","location_link","location_api"))  


data_2019_v1<-separate(data = data_2019_v1, col =profile, sep = ",", 
                       c("profile_id","prof_project_id","prof_state","prof_state_change_date","prof_name","prof_full_name",
                         "back_color","prof_text_color","prof_link_color","prof_link_text_color","prof_link_text",
                         "prof_url","prof_show_feature_image","background_image_opacity","should_show_feature_image_section",
                         "feature_image_attributes","baseball_card"))  

data_2019_v1<-separate(data = data_2019_v1, col =main_category_name, sep = "/", c("main_category_name","category_name_lcase"))





#CATEGORY
data_2019_v1$category_id<-gsub('"id":', "", data_2019_v1$category_id)
data_2019_v1$category_name<-gsub('"name":', "", data_2019_v1$category_name)
data_2019_v1$category_name<-gsub('"', "", data_2019_v1$category_name)

data_2019_v1$main_category_name<-gsub('"slug":', "", data_2019_v1$main_category_name)
data_2019_v1$main_category_name<-gsub('"', "", data_2019_v1$main_category_name)

data_2019_v1$category_name_lcase<-gsub('"', "", data_2019_v1$category_name_lcase)

data_2019_v1$position_id<-gsub('"position":', "", data_2019_v1$position_id)

data_2019_v1$parent_id<-gsub('"parent_id":', "", data_2019_v1$parent_id)

data_2019_v1$color_id<-gsub(gsub('"color":', "", data_2019_v1$color_id),'"',"")

data_2019_v1$urls_link<-gsub('"name"', "", data_2019_v1$urls_link)


#CREATOR
data_2019_v1$creator_id<-gsub('"id":', "", data_2019_v1$creator_id)
data_2019_v1$creator_name<-gsub('"name":', "", data_2019_v1$creator_name)
data_2019_v1$creator_name<-gsub('"', "", data_2019_v1$creator_name)

#LOCATION
data_2019_v1$location_id<-gsub('"id":', "", data_2019_v1$location_id)

data_2019_v1$location_name<-gsub('"name":', "", data_2019_v1$location_name)
data_2019_v1$location_name<-gsub('"', "", data_2019_v1$location_name)

data_2019_v1$loc_state<-gsub('"localized_name":', "", data_2019_v1$loc_state)
data_2019_v1$loc_state<-gsub('"', "", data_2019_v1$loc_state)




data_2019_v1$location_type<-gsub('"country":', "", data_2019_v1$location_type)
data_2019_v1$location_type<-gsub('"', "", data_2019_v1$location_type)

data_2019_v1$loc_expanded_country<-gsub('"type":', "", data_2019_v1$loc_expanded_country)
data_2019_v1$loc_expanded_country<-gsub('"', "", data_2019_v1$loc_expanded_country)

data_2019_v1$location_link<-gsub('"expanded_country":', "", data_2019_v1$location_link)
data_2019_v1$location_link<-gsub('"', "", data_2019_v1$location_link)


#PROFILE
data_2019_v1$profile_id<-gsub('"id":', "", data_2019_v1$profile_id)
data_2019_v1$prof_state<-gsub('"state":', "", data_2019_v1$prof_state)
data_2019_v1$prof_state<-gsub('"', "", data_2019_v1$prof_state)

data_2019_v1$created_date<-as.Date(as.POSIXct(data_2019_v1$created_at, origin="1970-01-01"))
data_2019_v1$launched_date<-as.Date(as.POSIXct(data_2019_v1$launched_at, origin="1970-01-01"))
data_2019_v1$deadline_date<-as.Date(as.POSIXct(data_2019_v1$deadline, origin="1970-01-01"))
data_2019_v1$state_changed_date<-as.Date(as.POSIXct(data_2019_v1$state_changed_at, origin="1970-01-01"))



data_2019_v1$usd_goal<- data_2019_v1$goal*data_2019_v1$static_usd_rate



data_2019_fin <-  data_2019_v1 %>% select(id,profile_id,category_id,position_id,parent_id,creator_id,location_id,
                                          name,
                                          backers_count,blurb,category_name,main_category_name,
                                          converted_pledged_amount,country,creator_name,
                                          currency,currency_symbol,currency_trailing_code,current_currency,disable_communication,
                                          friends,fx_rate,goal,is_backing,is_starrable,is_starred,location_name,
                                          loc_state,location_type,location_link,prof_state,spotlight,staff_pick,state,
                                          urls,static_usd_rate,pledged,usd_pledged,goal,usd_goal,usd_type,created_date,deadline_date,
                                          state_changed_date,launched_date
                                          #,country_displayable_name
)



write.csv(head(data_2019_fin,10),"C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/test/data_2019.csv")



print(min(data_2019_fin$launched_date))
print(max(data_2019_fin$launched_date))


data_2019_fin$Month_Yr <- format(as.Date(data_2019_fin$created_date), "%Y-%m")
data_2019_fin$Year <- format(as.Date(data_2019_fin$created_date), "%Y")
write.csv(data_2019_fin,"C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/test/data_2019_final.csv")

data_2019_fin$flag<-ifelse(data_2019_fin$created_date>=data_2019_fin$deadline_date ,'Y','N')
testt1<- sqldf("select * from data_2019_fin where flag='Y' ")



library("rjson")
library(plyr)
library(readr)
library(tidyr)
library(dplyr)
library(stringr)
library(sqldf)


#JAN 2016
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2016/1 Jan"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2016_jan = ldply(myfiles, read_csv)

#FEB
# mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2016/2 Feb"
# myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
# myfiles
# data_2016_feb= ldply(myfiles, read_csv)

#MAR
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2016/3 Mar"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2016_mar = ldply(myfiles, read_csv)

#APR
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2016/4 Apr"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2016_apr = ldply(myfiles, read_csv)

#MAY
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2016/5 May"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2016_may = ldply(myfiles, read_csv)

#JUN
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2016/6 Jun"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2016_jun = ldply(myfiles, read_csv)

#JUL
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2016/7 Jul"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2016_jul = ldply(myfiles, read_csv)

#AUG
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2016/8 Aug"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2016_aug = ldply(myfiles, read_csv)

#SEP
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2016/9 Sep"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2016_sep = ldply(myfiles, read_csv)

#OCT
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2016/10 Oct"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2016_oct = ldply(myfiles, read_csv)

#NOV
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2016/11 Nov"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2016_nov = ldply(myfiles, read_csv)

#DEC
mydir = "C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/2016/12 Dec"
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)
myfiles
data_2016_dec = ldply(myfiles, read_csv)

data_2016_jan_v1<-data_2016_jan[!duplicated(data_2016_jan$id),]
#data_2016_feb_v1<-data_2016_feb[!duplicated(data_2016_feb$id),]
data_2016_mar_v1<-data_2016_mar[!duplicated(data_2016_mar$id),]
data_2016_apr_v1<-data_2016_apr[!duplicated(data_2016_apr$id),]
data_2016_may_v1<-data_2016_may[!duplicated(data_2016_may$id),]
data_2016_jun_v1<-data_2016_jun[!duplicated(data_2016_jun$id),]
data_2016_jul_v1<-data_2016_jul[!duplicated(data_2016_jul$id),]
data_2016_aug_v1<-data_2016_aug[!duplicated(data_2016_aug$id),]
data_2016_sep_v1<-data_2016_sep[!duplicated(data_2016_sep$id),]
data_2016_oct_v1<-data_2016_oct[!duplicated(data_2016_oct$id),]
data_2016_nov_v1<-data_2016_nov[!duplicated(data_2016_nov$id),]
data_2016_dec_v1<-data_2016_dec[!duplicated(data_2016_dec$id),]

drop_vars<-c("unread_messages_count","unseen_activity_count","last_update_published_at")
data_2016_nov_v1 = data_2016_nov_v1[,!(names(data_2016_nov_v1) %in% drop_vars)]

data_2016_dec_v1[,"friends"]<-NA
data_2016_dec_v1[,"is_starred"]<-NA
data_2016_dec_v1[,"is_backing"]<-NA
data_2016_dec_v1[,"permissions"]<-NA

data_2016_jan_v1[,"friends"]<-NA
data_2016_jan_v1[,"is_starred"]<-NA
data_2016_jan_v1[,"is_backing"]<-NA
data_2016_jan_v1[,"permissions"]<-NA

data_2016_dec_v1["converted_pledged_amount"]<-data_2016_dec_v1$usd_pledged
data_2016_nov_v1["converted_pledged_amount"]<-data_2016_nov_v1$usd_pledged
data_2016_oct_v1["converted_pledged_amount"]<-data_2016_oct_v1$usd_pledged
data_2016_sep_v1["converted_pledged_amount"]<-data_2016_sep_v1$usd_pledged
data_2016_aug_v1["converted_pledged_amount"]<-data_2016_aug_v1$usd_pledged
data_2016_jul_v1["converted_pledged_amount"]<-data_2016_jul_v1$usd_pledged
data_2016_jun_v1["converted_pledged_amount"]<-data_2016_jun_v1$usd_pledged
data_2016_may_v1["converted_pledged_amount"]<-data_2016_may_v1$usd_pledged
data_2016_apr_v1["converted_pledged_amount"]<-data_2016_apr_v1$usd_pledged
data_2016_mar_v1["converted_pledged_amount"]<-data_2016_mar_v1$usd_pledged
#data_2016_feb_v1["converted_pledged_amount"]<-data_2016_feb_v1$usd_pledged
data_2016_jan_v1["converted_pledged_amount"]<-data_2016_jan_v1$usd_pledged

data_2016_dec_v1["current_currency"]<-data_2016_dec_v1$currency
data_2016_nov_v1["current_currency"]<-data_2016_nov_v1$currency
data_2016_oct_v1["current_currency"]<-data_2016_oct_v1$currency
data_2016_sep_v1["current_currency"]<-data_2016_sep_v1$currency
data_2016_aug_v1["current_currency"]<-data_2016_aug_v1$currency
data_2016_jul_v1["current_currency"]<-data_2016_jul_v1$currency
data_2016_jun_v1["current_currency"]<-data_2016_jun_v1$currency
data_2016_may_v1["current_currency"]<-data_2016_may_v1$currency
data_2016_apr_v1["current_currency"]<-data_2016_apr_v1$currency
data_2016_mar_v1["current_currency"]<-data_2016_mar_v1$currency
#data_2016_feb_v1["converted_pledged_amount"]<-data_2016_feb_v1$usd_pledged
data_2016_jan_v1["current_currency"]<-data_2016_jan_v1$currency

data_2016_dec_v1["fx_rate"]<-NA
data_2016_nov_v1["fx_rate"]<-NA
data_2016_oct_v1["fx_rate"]<-NA
data_2016_sep_v1["fx_rate"]<-NA
data_2016_aug_v1["fx_rate"]<-NA
data_2016_jul_v1["fx_rate"]<-NA
data_2016_jun_v1["fx_rate"]<-NA
data_2016_may_v1["fx_rate"]<-NA
data_2016_apr_v1["fx_rate"]<-NA
data_2016_mar_v1["fx_rate"]<-NA
#data_2016_feb_v1["converted_pledged_amount"]<-data_2016_feb_v1$usd_pledged
data_2016_jan_v1["fx_rate"]<-NA

data_2016_dec_v1["is_starrable"]<-NA
data_2016_nov_v1["is_starrable"]<-NA
data_2016_oct_v1["is_starrable"]<-NA
data_2016_sep_v1["is_starrable"]<-NA
data_2016_aug_v1["is_starrable"]<-NA
data_2016_jul_v1["is_starrable"]<-NA
data_2016_jun_v1["is_starrable"]<-NA
data_2016_may_v1["is_starrable"]<-NA
data_2016_apr_v1["is_starrable"]<-NA
data_2016_mar_v1["is_starrable"]<-NA
#data_2016_feb_v1["converted_pledged_amount"]<-data_2016_feb_v1$usd_pledged
data_2016_jan_v1["is_starrable"]<-NA

data_2016_dec_v1["usd_type"]<-ifelse(data_2016_dec_v1$currency=="USD", "domestic","international")
data_2016_nov_v1["usd_type"]<-ifelse(data_2016_nov_v1$currency=="USD", "domestic","international")
data_2016_oct_v1["usd_type"]<-ifelse(data_2016_oct_v1$currency=="USD", "domestic","international")
data_2016_sep_v1["usd_type"]<-ifelse(data_2016_sep_v1$currency=="USD", "domestic","international")
data_2016_aug_v1["usd_type"]<-ifelse(data_2016_aug_v1$currency=="USD", "domestic","international")
data_2016_jul_v1["usd_type"]<-ifelse(data_2016_jul_v1$currency=="USD", "domestic","international")
data_2016_jun_v1["usd_type"]<-ifelse(data_2016_jun_v1$currency=="USD", "domestic","international")
data_2016_may_v1["usd_type"]<-ifelse(data_2016_may_v1$currency=="USD", "domestic","international")
data_2016_apr_v1["usd_type"]<-ifelse(data_2016_apr_v1$currency=="USD", "domestic","international")
data_2016_mar_v1["usd_type"]<-ifelse(data_2016_mar_v1$currency=="USD", "domestic","international")
#data_2016_feb_v1["converted_pledged_amount"]<-data_2016_feb_v1$usd_pledged
data_2016_jan_v1["usd_type"]<-ifelse(data_2016_jan_v1$currency=="USD", "domestic","international")


# I saw that the field usd_type was not populated correctly.
data_2016 <- rbind(data_2016_dec_v1,data_2016_nov_v1,data_2016_oct_v1,data_2016_sep_v1,data_2016_aug_v1,data_2016_jul_v1,
                   data_2016_jun_v1,data_2016_may_v1,data_2016_apr_v1,data_2016_mar_v1,
                   #data_2016_feb_v1,
                   data_2016_jan_v1)

data_2016$usd_type_v1<- ifelse(data_2016$currency=="USD", "domestic","international")

data_2016<-data_2016[!duplicated(data_2016$id),]

data_2016$category<-str_sub(data_2016$category, 2, str_length(data_2016$category))
data_2016$creator<-str_sub(data_2016$creator, 2, str_length(data_2016$creator))
data_2016$location<-str_sub(data_2016$location, 2, str_length(data_2016$location))
data_2016$profile<-str_sub(data_2016$profile, 2, str_length(data_2016$profile))


#testt<-sqldf("select * from data_2016 where id =188790")

data_2016_v1<-data_2016
data_2016_v1$category_v1<-sapply(strsplit(data_2016_v1$category, ","), function(x) paste(rev(x), collapse=","))

data_2016_v1<-separate(data = data_2016_v1, col =category_v1, sep = ",", 
                       c("main_category_name","position_id","category_id","category_name","parent_id","color_id","urls_link"))


data_2016_v1<-separate(data = data_2016_v1, col =creator, sep = ",", 
                       c("urls_link1","api_link","creator_name","creator_id","avatar"))

data_2016_v1$location_v1<-sapply(strsplit(data_2016$location, ","), function(x) paste(rev(x), collapse=","))


data_2016_v1<-separate(data = data_2016_v1, col =location, sep = ",", 
                       c("loc_country_ID","loc_url_links2","location_api","location_name","loc_displayable_name",
                         "location_short_name","loc_state","location_id","location_type","loc_is_root",
                         "location_slug"))  

#write.csv(head(data_2016_v1,10),"C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/test/data_2016_test.csv")

data_2016_v1<-separate(data = data_2016_v1, col =profile, sep = ",", 
                       c("background_image_opacity","should_show_feature_image_section","prof_link_text_color",
                         "prof_state_change_date","profile_blurb","background_color","prof_project_id","prof_name",
                         "feature_image_attributes","prof_link_url","prof_show_feature_image",
                         "profile_id","prof_state","prof_text_color","prof_link_text","link_background_color"))  

data_2016_v1<-separate(data = data_2016_v1, col =main_category_name, sep = "/", c("main_category_name","category_name_lcase"))





#CATEGORY
data_2016_v1$category_id<-gsub('"id":', "", data_2016_v1$category_id)
data_2016_v1$category_name<-gsub('"name":', "", data_2016_v1$category_name)
data_2016_v1$category_name<-gsub('"', "", data_2016_v1$category_name)

data_2016_v1$main_category_name<-gsub('"slug":', "", data_2016_v1$main_category_name)
data_2016_v1$main_category_name<-gsub('"', "", data_2016_v1$main_category_name)

data_2016_v1$category_name_lcase<-gsub('"', "", data_2016_v1$category_name_lcase)

data_2016_v1$position_id<-gsub('"position":', "", data_2016_v1$position_id)

data_2016_v1$parent_id<-gsub('"parent_id":', "", data_2016_v1$parent_id)

data_2016_v1$color_id<-gsub(gsub('"color":', "", data_2016_v1$color_id),'"',"")

data_2016_v1$urls_link<-gsub('"name"', "", data_2016_v1$urls_link)


#CREATOR
data_2016_v1$creator_id<-gsub('"id":', "", data_2016_v1$creator_id)
data_2016_v1$creator_name<-gsub('"name":', "", data_2016_v1$creator_name)
data_2016_v1$creator_name<-gsub('"', "", data_2016_v1$creator_name)

#LOCATION
data_2016_v1$location_id<-gsub('"id":', "", data_2016_v1$location_id)

data_2016_v1$location_name<-gsub('"name":', "", data_2016_v1$location_name)
data_2016_v1$location_name<-gsub('"', "", data_2016_v1$location_name)

data_2016_v1$loc_state<-gsub('"localized_name":', "", data_2016_v1$loc_state)
data_2016_v1$loc_state<-gsub('"', "", data_2016_v1$loc_state)

data_2016_v1$location_id<-gsub('"short_name":', "", data_2016_v1$location_id)
data_2016_v1$location_id<-gsub('"', "", data_2016_v1$location_id)


data_2016_v1$location_type<-gsub('"country":', "", data_2016_v1$location_type)
data_2016_v1$location_type<-gsub('"', "", data_2016_v1$location_type)

#data_2016_v1$loc_expanded_country<-gsub('"type":', "", data_2016_v1$loc_expanded_country)
#data_2016_v1$loc_expanded_country<-gsub('"', "", data_2016_v1$loc_expanded_country)

#data_2016_v1$location_link<-gsub('"expanded_country":', "", data_2016_v1$location_link)
#data_2016_v1$location_link<-gsub('"', "", data_2016_v1$location_link)
data_2016_v1$location_link<-NA


#PROFILE
data_2016_v1$profile_id<-gsub('"id":', "", data_2016_v1$profile_id)
data_2016_v1$prof_state<-gsub('"state":', "", data_2016_v1$prof_state)
data_2016_v1$prof_state<-gsub('"', "", data_2016_v1$prof_state)

data_2016_v1$created_date<-as.Date(as.POSIXct(data_2016_v1$created_at, origin="1970-01-01"))
data_2016_v1$launched_date<-as.Date(as.POSIXct(data_2016_v1$launched_at, origin="1970-01-01"))
data_2016_v1$deadline_date<-as.Date(as.POSIXct(data_2016_v1$deadline, origin="1970-01-01"))
data_2016_v1$state_changed_date<-as.Date(as.POSIXct(data_2016_v1$state_changed_at, origin="1970-01-01"))



data_2016_v1$usd_goal<- data_2016_v1$goal*data_2016_v1$static_usd_rate



data_2016_fin <-  data_2016_v1 %>% select(id,profile_id,category_id,position_id,parent_id,creator_id,location_id,
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



write.csv(head(data_2016_fin,10),"C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/test/data_2016.csv")



print(min(data_2016_fin$launched_date))
print(max(data_2016_fin$launched_date))


data_2016_fin$Month_Yr <- format(as.Date(data_2016_fin$created_date), "%Y-%m")
data_2016_fin$Year <- format(as.Date(data_2016_fin$created_date), "%Y")
write.csv(data_2016_fin,"C:/Sapna/Graham/Data Mining/Project/Kickstarter/Datasets/test/data_2016_final.csv")

data_2016_fin$flag<-ifelse(data_2016_fin$created_date>=data_2016_fin$deadline_date ,'Y','N')
testt2<- sqldf("select * from data_2016_fin where flag='Y' ")
#testtt<- filter(data_2016_fin_v1, created_date < "2016-01-01")



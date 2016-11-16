
library(streamR)
library(ROAuth)
library(tidyverse)
library(lubridate)

load("/Users/jamesadams/projects/lita-stream/data/myoauth.Rdata")

tweetTemp <- tempfile(fileext = ".json")

filterStream(tweetTemp, track = "NationalFastFoodDay", timeout = 60, oauth = myoauth, verbose = TRUE)

df_raw <- parseTweets(tweetTemp, simplify = TRUE)

write_csv(df_raw, paste0("/Users/jamesadams/OneDrive - Dartmouth College/lita-tweets/", as.numeric(now()),"-raw.csv"))

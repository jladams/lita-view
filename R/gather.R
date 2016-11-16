
library(streamR)
library(ROAuth)
library(tidyverse)
library(lubridate)

load("./data/myoauth.Rdata")

tweetTemp <- tempfile(fileext = ".json")

filterStream(tweetTemp, track = "WednesdayWisdom", timeout = 30, oauth = myoauth, verbose = TRUE)

df_raw <- parseTweets(tweetTemp, simplify = TRUE)

write_csv(df_raw, paste0("~/Box Sync/lita-tweets/", as.numeric(now()),"-raw.csv"))

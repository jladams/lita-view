
library(streamR)
library(ROAuth)
library(tidyverse)

load("./data/myoauth.Rdata")

tweetTemp <- tempfile(fileext = ".json")

filterStream(tweetTemp, track = "TuesdayMotivation", timeout = 30, oauth = myoauth, verbose = TRUE)

df <- parseTweets(tweetTemp, simplify = TRUE) %>%
  select(id_str, text, lang, geo_enabled, retweet_count, created_at, time_zone)

write_csv(df, "./data/tweets.csv")

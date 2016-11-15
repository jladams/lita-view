
library(streamR)
library(ROAuth)
library(tidyverse)
library(lubridate)

load("./data/myoauth.Rdata")

tweetTemp <- tempfile(fileext = ".json")

filterStream(tweetTemp, track = "AmericaRecyclesDay", timeout = 300, oauth = myoauth, verbose = TRUE)

df <- parseTweets(tweetTemp, simplify = TRUE) %>%
  mutate(created = as.POSIXct(created_at, 
                              format="%a %b %d %H:%M:%S +0000 %Y", 
                              tz="GMT", 
                              origin="1970-01-01"
                              )
         ) %>%
  select(id_str, created, text, lang, geo_enabled, retweet_count, time_zone)

write_csv(df, "./data/tweets.csv")

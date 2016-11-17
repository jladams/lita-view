
library(streamR)
library(ROAuth)
library(lubridate)
library(readr)

load("/Users/jamesadams/projects/lita-view/data/myoauth.Rdata")

tweetTemp <- tempfile(fileext = ".json")

filterStream(tweetTemp, track = "litaforum", timeout = 1800, oauth = myoauth, verbose = TRUE)

df_raw <- parseTweets(tweetTemp, simplify = TRUE)

write_csv(df_raw, paste0("/Users/jamesadams/OneDrive - Dartmouth College/lita-tweets/", as.numeric(now()),"-raw.csv"))

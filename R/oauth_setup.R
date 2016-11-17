# Following instructions from: https://github.com/pablobarbera/streamR

library(streamR)
library(ROAuth)

# Keep consumer key and consumer secret in an ignored file
source("./R/oauth.R")

requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"

myoauth <- OAuthFactory$new(consumerKey = consumerKey, 
                            consumerSecret = consumerSecret, 
                            requestURL = requestURL, 
                            accessURL = accessURL, 
                            authURL = authURL
)

myoauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))

save(myoauth, file = "./data/myoauth.Rdata")
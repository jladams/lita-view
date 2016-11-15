
library(tidytext)
library(tidyverse)



df <- read_csv("./data/tweets.csv", col_types = cols(id_str = col_character()))

df_tidy <- df %>%
  unnest_tokens(output = word, input = text) %>%
  anti_join(stop_words)

df_sentiment <- df_tidy %>%
  left_join(get_sentiments(lexicon = "nrc")) %>%
  filter(!is.na(sentiment))

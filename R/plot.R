
library(tidytext)
library(tidyverse)
library(lubridate)


df <- read_csv("./data/tweets.csv", col_types = cols(id_str = col_character()))

df_tidy <- df %>%
  unnest_tokens(output = word, input = text) %>%
  anti_join(stop_words)

df_sentiment <- df_tidy %>%
  left_join(get_sentiments(lexicon = "nrc")) %>%
  filter(!is.na(sentiment)) %>%
  group_by(sentiment, day = wday(created, label = TRUE), time = floor_date(created,unit = "minutes")) %>%
  summarize(frequency = n()) %>%
  arrange(desc(frequency))

sentiment_freq <- ggplot(df_sentiment, aes(x = sentiment, y = frequency)) +
  geom_col(aes(fill = sentiment)) +
  guides(fill = FALSE) +
  facet_grid(.~day)

print(sentiment_freq)

sentiment_lines <- ggplot(df_sentiment, aes(x = time, y = frequency)) +
  geom_line(aes(color = sentiment, group = sentiment)) +
  geom_point(aes(color = sentiment)) +
  facet_grid(day~.)

print(sentiment_lines)


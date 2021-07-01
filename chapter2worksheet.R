## Chapter 1 exercises...
spahn <- read_csv("data/spahn.csv")
spahn %>% 
  mutate(FIP = (13 * HR + 3 * BB - 2 * SO) / IP) -> spahn


spahn %>%
  arrange(FIP) %>%
  select(Year, Age, W, L, ERA, FIP) %>%
  head()

spahn %>% filter(Tm == "BSN" | Tm == "MLN") -> spahn1

spahn1 <- spahn1 %>%
  mutate(Tm = factor(Tm, levels = c("BSN", "MLN")))

spahn1 %>%
  group_by(Tm) %>%
  summarize(mean_W.L = mean(W.L, na_rm = TRUE),
            mean_ERA = mean(ERA),
            mean_WHIP = mean(WHIP),
            mean_FIP = mean(FIP))

NLbatting <- read_csv("data/NLbatting.csv")
NLpitching <-read_csv("data/NLpitching.csv")
NL <- inner_join(NLbatting, NLpitching, by = 'Tm')

NLbatting %>%
  arrange(HR) %>%
  filter (HR > 150) -> NL_150 
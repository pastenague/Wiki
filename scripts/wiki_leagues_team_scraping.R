pacman::p_load(tidyverse, jsonlite, rvest,
               glue, stringr)

write_data_csv <- function(data, filename_root) {
   csv_filename <- str_c("../csv/", filename_root, ".csv", sep = "")
   write_csv(data, csv_filename)
   return(csv_filename)
}

save_data_RDS <- function(data, filename_root) {
   RDS_filename <- str_c("../rds/", filename_root, ".rds", sep = "")
   saveRDS(data, RDS_filename)
   return(RDS_filename)
}

leagues_teams <- c()
leagues <- c("Premier League",
             "EFL Championship",
             "EFL League One",
             "EFL League Two",
             "La Liga",
             "Segunda División",
             "Ligue 1",
             "Ligue 2",
             "Bundesliga",
             "2. Bundesliga",
             "Serie A",
             "Serie B",
             "Primeira Liga",
             "Russian Premier League",
             "Eredivisie",
             "Belgian First Division A",
             "Süper Lig",
             "Scottish Premiership",
             "Swiss Super League",
             "Superleague Greece",
             "Danish Superliga",
             "Ukrainian Premier League",
             "Argentine Primera División",
             "Liga MX season",
             "A-League"
)
for (i in 1:length(leagues)) {
   league_raw <- leagues[i] %>% str_replace_all(" ", "_")
   league_url <- glue("https://en.wikipedia.org/wiki/2019–20_{league_raw}")
   print(league_url)
   league_source <- read_html(league_url)
   league_clubs <- league_source %>% html_nodes(".sportsrbrtable-team") %>% html_nodes("a") %>%
      html_attr("href") %>%
      str_subset("League", negate = TRUE) %>% str_subset("EFL", negate = TRUE) %>%
      str_subset("División", negate = TRUE) %>% str_subset("EFL", negate = TRUE) %>%
      str_subset("\\#", negate = TRUE) %>% str_subset("Template", negate = TRUE) %>%
      str_subset("/w/", negate = TRUE) %>% str_subset("2020", negate = TRUE) %>%
      str_replace_all("/wiki/", "") %>% unique()
   if (length(league_clubs) == 0) {
      j <- 4
      league_clubs <- ""
      while (!any(str_detect(league_clubs, "Arsenal")) &
             !any(str_detect(league_clubs, "Ipswich")) |
             any(str_detect(league_clubs, "Netherlands"))) {
         league_clubs <- html_nodes(league_source, ".wikitable")[j] %>% html_nodes("a") %>%
            html_attr("href") %>%
            str_subset("League", negate = TRUE) %>% str_subset("EFL", negate = TRUE) %>%
            str_subset("División", negate = TRUE) %>% str_subset("EFL", negate = TRUE) %>%
            str_subset("\\#", negate = TRUE) %>% str_subset("Template", negate = TRUE) %>%
            str_subset("/w/", negate = TRUE) %>% str_subset("2020", negate = TRUE) %>%
            str_replace_all("/wiki/", "") %>% unique()
         if (length(league_clubs) == 0) { league_clubs <- "" }
         if (length(league_clubs) == 10 |
             length(league_clubs) == 12 |
             length(league_clubs) == 16 |
             length(league_clubs) == 18 |
             length(league_clubs) == 20 |
             length(league_clubs) == 22 |
             length(league_clubs) == 24 ) { break }
         j <- j + 1
      }
   }
   leagues_teams <- leagues_teams %>% bind_rows(tibble(league = leagues[i], team = league_clubs))
   save_data_RDS(leagues_teams, glue("leagues_teams_{format(Sys.time(), \"%Y-%m-%d_%H%M\")}"))
   write_data_csv(leagues_teams, glue("leagues_teams_{format(Sys.time(), \"%Y-%m-%d_%H%M\")}"))
}
leagues <- c("Major League Soccer season",
             "Campeonato Brasileiro Série A",
             "League of Ireland Premier Division",
             "Allsvenskan",
             "Eliteserien",
             "Chilean Primera División",
             "J1 League",
             "Chinese Super League"
)
for (i in 1:length(leagues)) {
   league_raw <- leagues[i] %>% str_replace_all(" ", "_")
   league_url <- glue("https://en.wikipedia.org/wiki/2019_{league_raw}")
   print(league_url)
   league_source <- read_html(league_url)
   league_clubs <- league_source %>% html_nodes(".sportsrbrtable-team") %>% html_nodes("a") %>%
      html_attr("href") %>% str_replace_all("/wiki/", "") %>% unique()
   if (length(league_clubs) == 0) {
      j <- 4
      league_clubs <- ""
      while (!any(str_detect(league_clubs, "Arsenal")) &
             !any(str_detect(league_clubs, "Ipswich")) |
             !any(str_detect(league_clubs, "Huachipato"))) {
         league_clubs <- html_nodes(league_source, ".wikitable")[j] %>% html_nodes("a") %>%
            html_attr("href") %>%
            str_subset("League", negate = TRUE) %>% str_subset("EFL", negate = TRUE) %>%
            str_subset("División", negate = TRUE) %>% str_subset("Primera", negate = TRUE) %>%
            str_subset("\\#", negate = TRUE) %>% str_subset("Template", negate = TRUE) %>%
            str_subset("/w/", negate = TRUE) %>% str_subset("2020", negate = TRUE) %>%
            str_replace_all("/wiki/", "") %>% unique()
         if (length(league_clubs) == 0) { league_clubs <- "" }
         if (length(league_clubs) == 10 |
             length(league_clubs) == 12 |
             length(league_clubs) == 16 |
             length(league_clubs) == 18 |
             length(league_clubs) == 20 |
             length(league_clubs) == 22 |
             length(league_clubs) == 24 ) { break }
         j <- j + 1
      }
   }
   leagues_teams <- leagues_teams %>% bind_rows(tibble(league = leagues[i], team = league_clubs))
   save_data_RDS(leagues_teams, glue("leagues_teams_{format(Sys.time(), \"%Y-%m-%d_%H%M\")}"))
   write_data_csv(leagues_teams, glue("leagues_teams_{format(Sys.time(), \"%Y-%m-%d_%H%M\")}"))
}
leagues <- c("South African Premier Division")
for (i in 1:length(leagues)) {
   league_raw <- leagues[i] %>% str_replace_all(" ", "_")
   league_url <- glue("https://en.wikipedia.org/wiki/2018-19_{league_raw}")
   league_source <- read_html(league_url)
   league_clubs <- league_source %>% html_nodes(".sportsrbrtable-team") %>% html_nodes("a") %>%
      html_attr("href") %>% str_replace_all("/wiki/", "") %>% unique()
   if (length(league_clubs) == 0) {
      j <- 4
      league_clubs <- ""
      while (!any(str_detect(league_clubs, "Arsenal")) &
             !any(str_detect(league_clubs, "Ipswich")) |
             any(str_detect(league_clubs, "Netherlands"))) {
         league_clubs <- html_nodes(league_source, ".wikitable")[j] %>% html_nodes("a") %>%
            html_attr("href") %>%
            str_subset("League", negate = TRUE) %>% str_subset("Cup", negate = TRUE) %>%
            str_subset("Division", negate = TRUE) %>% str_subset("EFL", negate = TRUE) %>%
            str_subset("\\#", negate = TRUE) %>% str_subset("Template", negate = TRUE) %>%
            str_subset("/w/", negate = TRUE) %>% str_subset("2020", negate = TRUE) %>%
            str_replace_all("/wiki/", "") %>% unique()
         if (length(league_clubs) == 0) { league_clubs <- "" }
         if (length(league_clubs) == 10 |
             length(league_clubs) == 12 |
             length(league_clubs) == 16 |
             length(league_clubs) == 18 |
             length(league_clubs) == 20 |
             length(league_clubs) == 22 |
             length(league_clubs) == 24 ) { break }
         j <- j + 1
      }
   }
   leagues_teams <- leagues_teams %>% bind_rows(tibble(league = leagues[i], team = league_clubs))
   save_data_RDS(leagues_teams, glue("leagues_teams_{format(Sys.time(), \"%Y-%m-%d_%H%M\")}"))
   write_data_csv(leagues_teams, glue("leagues_teams_{format(Sys.time(), \"%Y-%m-%d_%H%M\")}"))
}
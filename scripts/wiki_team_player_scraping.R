pacman::p_load(tidyverse, jsonlite, rvest,
               glue, stringr,
               humaniformat, WikipediR)

wait <- function(wait_time) {
   date_time <- Sys.time()
   while ((as.numeric(Sys.time()) - as.numeric(date_time)) < wait_time) { }
}

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

get_team_players <- function(team_category, num_queries = 50) {
   team <- team_category %>% str_replace_all("\\_", " ") %>% str_remove_all("\\.|\\Qplayers\\E") %>% str_trim() %>% str_squish()
   team_players <- c()
   JSON_response <-
      fromJSON(glue("https://en.wikipedia.org/w/api.php?action=query&format=json&generator=categorymembers&gcmlimit={num_queries}&gcmtitle=Category%3A{team_category}"))
   if (length(JSON_response$query$pages) > 0) {
      player_page_titles <- JSON_response$query$pages %>% sapply(`[[`, "title") %>% unname()
      team_players <- c(team_players, player_page_titles) %>%
         str_subset("List of", negate = TRUE) %>%
         str_subset("Clubs", negate = TRUE) %>%
         str_subset("Category", negate = TRUE) %>%
         str_subset("File", negate = TRUE) %>%
         str_replace_all("\\([^\\)]*\\)", "") %>%
         str_trim() %>% str_squish()
      while (length(JSON_response$continue) > 0) {
         JSON_response <-
            fromJSON(glue("https://en.wikipedia.org/w/api.php?action=query&format=json&generator=categorymembers&gcmlimit={num_queries}&gcmtitle=Category%3A{team_category}&gcmcontinue={JSON_response$continue$gcmcontinue}"))
         player_page_titles <- JSON_response$query$pages %>% sapply(`[[`, "title") %>% unname()
         team_players <- c(team_players, player_page_titles) %>%
            str_subset("List of", negate = TRUE) %>%
            str_subset("Clubs", negate = TRUE) %>%
            str_subset("Category", negate = TRUE) %>%
            str_subset("File", negate = TRUE) %>%
            str_replace_all("\\([^\\)]*\\)", "") %>%
            str_trim() %>% str_squish()
      }
   }
   print(glue("{team}: {length(team_players)} players."))
   if (is.null(team_players)) {
      team_players <- character()
      team = character()
   }
   return(tibble(team = team, player = team_players))
}

start_time <- proc.time()
wait_time <- 1
leagues_teams <- readRDS("../rds/leagues_teams.rds")
team_categories <- leagues_teams$team %>% unique() %>% str_c("_players") %>% str_replace_all(" ", "_")
teams_players <- tibble(team = character(), player = character())
teams_to_search <- 551:591
for (i in teams_to_search) {
   if (i <= length(team_categories)) {
      cat(glue("{i}: "))
      team_category <- team_categories[i]
      team_players <- get_team_players(team_category)
      if (nrow(team_players) < 5) {
         team_category <- team_category %>% str_replace("players", "footballers")
         team_players <- get_team_players(team_category)
      }
      if (nrow(team_players) < 5) {
         if (team_category %>% str_detect("Almagro")) {
            team_category <- team_category %>% str_replace("_de_Almagro", "")
         }
         else if (team_category %>% str_detect("River_Plate")) {
            team_category <- "River_Plate_footballers"
         }
         else if (team_category %>% str_detect("Hurac%C3%A1n")) {
            team_category <- "Hurac%C3%A1n_footballers"
         }
         else if (team_category %>% str_detect("Puebla")) {
            team_category <- "Puebla_F.C._players"
         }
         else if (team_category %>% str_detect("Col%C3%B3n")) {
            team_category <- "Col%C3%B3n_F.C._players"
         }
         else if (team_category %>% str_detect("Banfield")) {
            team_category <- "Banfield_footballers"
         }
         else if (team_category %>% str_detect("Godoy")) {
            team_category <- "Godoy_Cruz_footballers"
         }
         else if (team_category %>% str_detect("Gimnasia_y_Esgrima_La_Plata")) {
            team_category <- "Gimnasia_y_Esgrima_de_La_Plata_footballers"
         }
         else if (team_category %>% str_detect("C.D._Cobresal")) {
            team_category <- "Cobresal_footballers"
         }
         else if (team_category %>% str_detect("Universidad_de_Chile")) {
            team_category <- "Universidad_de_Chile_footballers"
         }
         else if (team_category %>% str_detect("Concepci%C3%B3n")) {
            team_category <- "Universidad_de_Concepci%C3%B3n_footballers"
         }
         else if (team_category %>% str_detect("Sinobo")) {
            team_category <- "Beijing_Guoan_F.C._players"
         }
         else if (team_category %>% str_detect("Dangdai")) {
            team_category <- "Chongqing_Lifan_F.C._players"
         }
         else if (team_category %>% str_detect("TEDA")) {
            team_category <- "Tianjin_Teda_F.C._players"
         }
         else if (team_category %>% str_detect("Shenhua")) {
            team_category <- "Shanghai_Shenhua_F.C._players"
         }
         else if (team_category %>% str_detect("Sundowns")) {
            team_category <- "Mamelodi_Sundowns_F.C._players"
         }
         else if (team_category %>% str_detect("Wits")) {
            team_category <- "Bidvest_Wits_F.C._players"
         }
         else if (team_category %>% str_detect("Polokwane")) {
            team_category <- "Polokwane_City_F.C._players"
         }
         else if (team_category %>% str_detect("Polokwane")) {
            team_category <- "Polokwane_City_F.C._players"
         }
         team_players <- get_team_players(team_category)
      }
      if (nrow(team_players) < 5) {
         if (team_category %>% str_detect("_de_")) {
            team_category <- team_category %>% str_replace("_de_", "_")
         }
         else if (team_category %>% str_detect("F.C.") &
             !str_detect(team_category, "A.F.C.") &
             !str_detect(team_category, "P.F.C.")) {
            team_category <- team_category %>% str_replace("F.C.", "A.F.C.")
         }
         else if (team_category %>% str_detect("A.F.C.")) {
            team_category <- team_category %>% str_replace("A.F.C.", "AFC")
         }
         else if (team_category %>% str_detect("PFC")) {
            team_category <- team_category %>% str_replace("PFC", "FC")
         }
         else if (team_category %>% str_detect("(football)")) {
            team_category <- team_category %>% str_replace("\\(football\\)", "")
         }
         team_players <- get_team_players(team_category)
      }
      teams_players <- teams_players %>% bind_rows(team_players)
      if (i != tail(teams_to_search, 1)) {
         print(glue("Waiting {wait_time} seconds ..."))
         wait(wait_time)
      }
   }
}

runtime <- proc.time() - start_time
elapsed_time <- runtime[3]
cat("Runtime info: ")
cat(str_c(round(as.double(elapsed_time), 2), "seconds to scrape",
          length(teams_to_search), "team at a rate of",
          round(as.double(elapsed_time)/as.double(length(teams_to_search)), 2), "seconds per team.\n",
          sep = " "))
teams_players <- teams_players %>% distinct(team, player)
RDS_filename <- save_data_RDS(teams_players, glue("teams_players_{head(teams_to_search, 1)}-{tail(teams_to_search, 1)}"))
csv_filename <- write_data_csv(teams_players, glue("teams_players_{head(teams_to_search, 1)}-{tail(teams_to_search, 1)}"))
cat(str_c("Data saved to \"", RDS_filename, "\".\n", sep = ""))
cat(str_c("Data saved to \"", csv_filename, "\".\n", sep = ""))

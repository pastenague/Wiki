pacman::p_load(tidyverse, glue, stringr, textclean,
               stringdist, RecordLinkage, humaniformat)

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

format_names <- function(names) {
   parsed_names <- humaniformat::parse_names(names) %>% as_tibble() %>%
      mutate(first_initial = ifelse(str_detect(first_name, "-"),
                                    gsub("([A-Z])([A-Z]+)$", "\\1.-\\2", gsub("[^A-Z]", "", first_name), ""),
                                    substr(first_name, 1, 1)
      ),
      middle_initial = substr(middle_name, 1, 1),
      initials = str_c(ifelse(((first_initial == "") |
                                  (is.na(first_initial))
      ),
      "",
      str_c(first_initial, ".", sep = "")
      ),
      ifelse(((middle_initial == "") |
                 (is.na(middle_initial))
      ),
      "",
      str_c(middle_initial, ".", sep = "")
      ),
      sep = ""
      ),
      short_name = str_c(initials, last_name, sep = " ")
      ) %>% mutate(short_name = ifelse(is.na(short_name), first_name, short_name))
   parsed_names %>% select(first_name, middle_name, last_name, short_name) %>% return()
}

get_avg_name_dist <- function(name_part, all_name_parts) {
   # name_part_sim <- stringsim(name_part, all_name_parts, method = "dl")
   name_part_sim <- levenshteinSim(name_part, all_name_parts)
   name_part_sim[is.nan(name_part_sim)] <- 1
   # name_part_sim <- jarowinkler(name_part, all_name_parts)
   # if (nchar(name_part) == 0) { name_part_sim[name_part_sim == 0] <- 1 }
   avg_name_part_sim <- name_part_sim %>% mean()
   return(avg_name_part_sim)
}

get_avg_name <- function(team_players) {
   first_name_dists <- sapply(str_c(team_players$first_name, team_players$last_name),
                              get_avg_name_dist,
                              all_name_parts = team_players$first_name) %>% unname()
   middle_name_dists <- sapply(team_players$middle_name,
                              get_avg_name_dist,
                              all_name_parts = team_players$middle_name) %>% unname()
   last_name_dists <- sapply(str_c(team_players$first_name, team_players$last_name),
                               get_avg_name_dist,
                               all_name_parts = team_players$last_name) %>% unname()
   avg_first_name <- team_players$first_name[which.max(first_name_dists)]
   avg_middle_name <- team_players$middle_name[which.max(middle_name_dists)]
   avg_last_name <- team_players$last_name[which.max(last_name_dists)]
   return(list(avg_first_name = avg_first_name,
               avg_middle_name = avg_middle_name,
               avg_last_name = avg_last_name))
}

start_time <- proc.time()
teams_players <- readRDS("../rds/teams_players_1_to_591.rds")
teams_players <- teams_players %>%
   bind_cols(format_names(teams_players$player)) %>%
   replace_na(list(first_name = "",
                   middle_name = "",
                   last_name = ""))
teams <- teams_players %>% distinct(team) %>%
   mutate(avg_first_name = "",
          avg_middle_name = "",
          avg_last_name = "",
          avg_name = "")
teams_to_calc <- 51:100
for (i in teams_to_calc) {
   cat(glue("{teams$team[i]} ({i}): "))
   team_players <- teams_players %>% filter(team == teams$team[i])
   avg_name_parts <- get_avg_name(team_players)
   teams$avg_first_name[i] <- avg_name_parts$avg_first_name
   teams$avg_middle_name[i] <- avg_name_parts$avg_middle_name
   teams$avg_last_name[i] <- avg_name_parts$avg_last_name
   teams$avg_name[i] <- str_c(avg_name_parts$avg_first_name,
                                  avg_name_parts$avg_middle_name,
                                  avg_name_parts$avg_last_name,
                                  sep = " ") %>% str_squish() %>% str_trim()
   cat(teams$avg_name[i], sep = "\n")
}

runtime <- proc.time() - start_time
elapsed_time <- runtime[3]
cat("Runtime info: ")
cat(str_c(round(as.double(elapsed_time), 2), "seconds to process",
          length(teams_to_calc), "teams at a rate of",
          round(as.double(elapsed_time)/as.double(length(teams_to_calc)), 2), "seconds per team.\n",
          sep = " "))
teams <- teams %>% filter(avg_name %>% nchar() > 0)
RDS_filename <- save_data_RDS(teams, glue("teams_players_avg_names_{head(teams_to_calc, 1)}-{tail(teams_to_calc, 1)}"))
csv_filename <- write_data_csv(teams, glue("teams_players_avg_names_{head(teams_to_calc, 1)}-{tail(teams_to_calc, 1)}"))
cat(str_c("Data saved to \"", RDS_filename, "\".\n", sep = ""))
cat(str_c("Data saved to \"", csv_filename, "\".\n", sep = ""))


pacman::p_load(tidyverse, glue, stringr, readr, stringi,
               tm, tidyselect, pracma)

start_time <- proc.time()

get_filename_root <- function(request, request_type) {
   filename_root <- str_c(request_type, "_", head(request, n = 1), "_to_", tail(request, n = 1),
                          sep = "")
   return(filename_root)
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

get_filename_root_numbers <- function(matches_filepaths) {
   temp_filename_root_numbers <- gsub("[.]", "q", matches_filepaths) %>%
      str_replace("-", "%")
   filename_root_numbers_list <- gsub("[^0-9|%]", "", temp_filename_root_numbers) %>% str_split("%")
   filename_root_numbers <-
      (filename_root_numbers_list[[1]] %>% head(n = 1) %>%
          as.numeric()):(filename_root_numbers_list[[length(filename_root_numbers_list)]] %>%
                            tail(n = 1) %>% as.numeric())
}

smart_ascii <- function(name) {
   name <- name %>%
      str_replace_all("é|è|ê|ë|ę|ē|ė", "e") %>%
      str_replace_all("á|à|â|ä|ã|ą|å", "a") %>%
      str_replace_all("ó|ò|ô|ö|õ|ō|ø", "o") %>%
      str_replace_all("í|ì|î|ï|į|ī|ı", "i") %>%
      str_replace_all("ú|ù|û|ü|ū", "u") %>%
      str_replace_all("ÿ|ý", "y") %>%
      str_replace_all("æ", "ae") %>%
      str_replace_all("œ", "oe") %>%
      str_replace_all("ł", "l") %>%
      str_replace_all("ð", "d") %>%
      str_replace_all("ř", "r") %>%
      str_replace_all("š|ś", "s") %>%
      str_replace_all("ǧ", "g") %>%
      str_replace_all("đ", "d") %>%
      str_replace_all("ž|ź|ż", "z") %>%
      str_replace_all("ñ|ń", "n") %>%
      str_replace_all("ç|ć|č", "c") %>%
      str_replace_all("ß", "ss") %>%
      str_replace_all("É|È|Ê|Ë|Ę|Ē|Ė", "E") %>%
      str_replace_all("Á|À|Â|Ä|Ã|Å|Ā", "A") %>%
      str_replace_all("Ó|Ò|Ô|Ö|Õ|Ō|Ø", "O") %>%
      str_replace_all("Í|Ì|Î|Ï|Į|Ī|İ", "I") %>%
      str_replace_all("Ú|Ù|Û|Ü|Ū", "U") %>%
      str_replace_all("Ÿ", "Y") %>%
      str_replace_all("Æ", "AE") %>%
      str_replace_all("Œ", "OE") %>%
      str_replace_all("Ł", "L") %>%
      str_replace_all("Đ", "D") %>%
      str_replace_all("Ř", "R") %>%
      str_replace_all("Š|Ś", "S") %>%
      str_replace_all("Ğ", "G") %>%
      str_replace_all("Đ", "D") %>% 
      str_replace_all("Ž|Ź|Ż", "Z") %>%
      str_replace_all("Ñ|Ń", "N") %>%
      str_replace_all("Ç|Ć|Č", "C")
}

combine_matches <- function(matches_filepaths) {
   filename_root_numbers <- get_filename_root_numbers(matches_filepaths)
   filename_root <- get_filename_root(filename_root_numbers, "teams_players")
   
   all_players <- c()
   for (match_filepath in matches_filepaths) {
      print(match_filepath)
      match_info <- readRDS(match_filepath) %>%
         mutate(player = iconv(player, to = "ASCII//TRANSLIT") %>%
                   str_replace_all("\'|\"", ""))
      all_players <- all_players %>% bind_rows(match_info)
   }
   all_players <- all_players %>% distinct(team, player)
   all_players <- all_players %>%
      filter(str_detect(player, "roster", negate = TRUE)) %>%
      filter(str_detect(player, "Template", negate = TRUE)) %>%
      filter(str_detect(player, "squad", negate = TRUE)) %>%
      filter(str_detect(player, "player", negate = TRUE)) %>%
      filter(str_detect(player, "F.C.", negate = TRUE)) %>%
      filter(str_detect(player, "team", negate = TRUE))
   
   csv_filename <- write_data_csv(all_players, filename_root)
   cat(str_c("Data written to \"", csv_filename, "\".\n", sep = ""))
   
   RDS_filename <- save_data_RDS(all_players, filename_root)
   cat(str_c("Data saved to \"", RDS_filename, "\".\n", sep = ""))
   
   return(all_players)
}

all_players <- combine_matches(c("../rds/teams_players_1-50.rds",
                                 "../rds/teams_players_51-100.rds",
                                 "../rds/teams_players_101-150.rds",
                                 "../rds/teams_players_151-200.rds",
                                 "../rds/teams_players_201-250.rds",
                                 "../rds/teams_players_251-300.rds",
                                 "../rds/teams_players_301-350.rds",
                                 "../rds/teams_players_351-400.rds",
                                 "../rds/teams_players_401-450.rds",
                                 "../rds/teams_players_451-500.rds",
                                 "../rds/teams_players_501-550.rds",
                                 "../rds/teams_players_551-591.rds"
                                 )
                               )
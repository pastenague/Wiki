pacman::p_load(tidyverse, glue, stringr, textclean,
               stringdist, RecordLinkage, humaniformat)

get_freq_trafos <- function(guess, words) {
   M_count <- 0
   I_count <- 0
   D_count <- 0
   S_count <- 0
   print(guess)
   print(words)
   longest_length <- max(nchar(words))
   longest_word <- words[which.max(nchar(words))]
   print(longest_length)
   if (longest_length < nchar(guess)) { longest_length <- nchar(guess) }
   freq_trafos <- vector(mode = "character", length = longest_length)
   trafos <- attr(adist(guess, words, counts = TRUE), "trafos") %>% as.vector()
   longest_trafos <- trafos[which.max(nchar(words))]
   I_locs <- longest_trafos %>% str_locate_all("I")
   for (i in 1:length(trafos)) {
      if (nchar(trafos[i]) < longest_length) {
         for (j in 1:length(I_locs)) {
            print(I_locs[[1]][j,][["start"]])
            stri_sub(trafos[i],
                     I_locs[[1]][j,][["start"]],
                     I_locs[[1]][j,][["start"]] - 1) <- "N"
         }
      }
   }
   print(trafos)
}

get_freq_trafos("Paulo Dybala", c("Mario Mandzukic",
                                  "George Ackerley",
                                  "Roberto Benigni",
                                  "Julio"))

# start_time <- proc.time()
# teams_players <- readRDS("../rds/teams_players_1_to_591.rds")
# teams_players <- teams_players %>%
#    bind_cols(format_names(teams_players$player)) %>%
#    replace_na(list(first_name = "",
#                    middle_name = "",
#                    last_name = ""))
# teams <- teams_players %>% distinct(team) %>%
#    mutate(avg_first_name = "",
#           avg_middle_name = "",
#           avg_last_name = "",
#           avg_name = "",
#           mode_first_name = "",
#           mode_middle_name = "",
#           mode_last_name = "",
#           mode_name = ""
#    )
# teams_to_calc <- 1:1
# for (i in teams_to_calc) {
#    cat(glue("{teams$team[i]} ({i}): "))
#    team_players <- teams_players %>% filter(team == teams$team[i])
#    get_freq_trafos(team_players$player[1], team_players$player[2:3])
# }
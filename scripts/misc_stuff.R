# get_league_teams <- function(league_category, num_queries = 50) {
#    league_teams <- c()
#    league <- league_category %>% str_replace_all("\\_", " ") %>% str_remove_all("\\.|\\Qclubs\\E") %>% str_trim() %>% str_squish()
#    JSON_response <-
#       fromJSON(glue("https://en.wikipedia.org/w/api.php?action=query&format=json&generator=categorymembers&gcmlimit={num_queries}&gcmtitle=Category%3A{league_category}"))
#    if (length(JSON_response$query$pages) > 0) {
#       team_page_titles <- JSON_response$query$pages %>% sapply(`[[`, "title") %>% unname()
#       league_teams <- c(league_teams, team_page_titles) %>%
#          str_subset("List of", negate = TRUE) %>%
#          str_subset("Clubs", negate = TRUE) %>%
#          str_subset("Category", negate = TRUE) %>%
#          str_trim() %>% str_squish()
#       while (length(JSON_response$continue) > 0) {
#          JSON_response <-
#             fromJSON(glue("https://en.wikipedia.org/w/api.php?action=query&format=json&generator=categorymembers&gcmlimit={num_queries}&gcmtitle=Category%3A{league_category}&gcmcontinue={JSON_response$continue$gcmcontinue}"))
#          team_page_titles <- JSON_response$query$pages %>% sapply(`[[`, "title") %>% unname()
#          league_teams <- c(league_teams, team_page_titles) %>%
#             str_subset("List of", negate = TRUE) %>%
#             str_subset("clubs", negate = TRUE) %>%
#             str_subset("Category", negate = TRUE) %>%
#             str_trim() %>% str_squish()
#       }
#       print(glue("{league}: {length(league_teams)} teams"))
#    }
#    return(tibble(league = league, team = league_teams))
# }
# 
# league_categories <- c("English_Football_League_clubs",
#                        "Premier_League_clubs",
#                        "La_Liga_clubs"
#                        )
# 
# for (i in 1:length(league_categories)) {
#    league_teams <- get_league_teams(league_categories[i])
#    leagues_teams <- leagues_teams %>% bind_rows(league_teams)
# }
# 
# leagues_teams <- leagues_teams %>% filter(team != "Wimbledon F.C." &
#                                              !str_detect(team, "Yeovil") &
#                                              !str_detect(team, "Inter Miami"))
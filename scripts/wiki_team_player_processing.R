pacman::p_load(tidyverse, tictoc, glue, stringr, knitr,
               stringdist, humaniformat, urltools)

write_data_csv <- function(data, filename_root) {
   csv_filename <- str_c("../csv/", filename_root, ".csv", sep = "")
   write_csv(data, csv_filename)
   "Data saved to \"{csv_filename}\"." %>% glue() %>% print()
   return(csv_filename)
}

save_data_RDS <- function(data, filename_root) {
   RDS_filename <- str_c("../rds/", filename_root, ".rds", sep = "")
   saveRDS(data, RDS_filename)
   "Data saved to \"{RDS_filename}\"." %>% glue() %>% print()
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

mode <- function(x) {
   if ( length(x) <= 2 ) { return(x[1]) }
   if ( anyNA(x) ) { x = x[!is.na(x)] }
   ux <- unique(x)
   count_match <- tabulate(match(x, ux))
   names_match <- ux[which(count_match == max(count_match))]
   name_thresh <- 3
   if (length(names_match) == 1) {
      names_match <- glue("{names_match} ({max(count_match)})")
   }
   else if (length(names_match) > 1 && length(names_match) <= name_thresh) {
      names_match <- str_c(str_c(names_match, collapse = glue(", ")), glue(" ({max(count_match)})"))
   }
   else if (length(names_match) > name_thresh) {
      names_match <- "X"
   }
   return(names_match)
}

get_Mode_Name <- function(team_players) {
   team_players <- team_players %>% filter(nchar(first_name) > 0 &
                                              nchar(last_name) > 0)
   Mode_First_Name <- mode(team_players$first_name)
   Mode_Middle_Name <- mode(team_players$middle_name)
   Mode_Last_Name <- mode(team_players$last_name)
   return(list(Mode_First_Name = Mode_First_Name,
               Mode_Middle_Name = Mode_Middle_Name,
               Mode_Last_Name = Mode_Last_Name))
}

clean_player_name <- function(player_name) {
   player_name <- player_name %>%
      str_replace_all("Jo~ao", "João") %>%
      str_replace_all("Jose", "José") %>%
      str_replace_all("Goncalo", "Gonçalo") %>%
      str_replace_all("Ugur", "Uğur") %>%
      str_replace_all("Ozturk", "Öztürk") %>%
      str_replace_all("Ozkan", "Özkan") %>%
      str_replace_all("Gokhan", "Gökhan") %>%
      str_replace_all("Yilmaz", "Yılmaz") %>%
      str_replace_all("Dogan", "Doğan") %>%
      str_replace_all("Sebastien", "Sébastien") %>%
      str_replace_all("Frederic", "Frédéric") %>%
      str_replace_all("Muller", "Müller") %>%
      str_replace_all("Garcia", "García") %>%
      str_replace_all("Sorensen", "Sørensen") %>%
      str_replace_all("Gonzalez", "González") %>%
      str_replace_all("Rodriguez", "Rodríguez") %>%
      str_replace_all("Lopez", "López") %>%
      str_replace_all("Sanchez", "Sánchez") %>%
      str_replace_all("Fernandez", "Fernández") %>%
      str_replace_all("Gutierrez", "Gutiérrez") %>%
      str_replace_all("Alvarez", "Álvarez") %>%
      str_replace_all("Perez", "Pérez") %>%
      str_replace_all("Hernandez", "Hernández") %>%
      str_replace_all("Martinez", "Martínez") %>%
      str_replace_all("Ramirez", "Ramírez") %>%
      str_replace_all("Traore", "Traoré") %>%
      str_replace_all("Toure", "Touré") %>%
      str_replace_all("Cisse", "Cissé") %>%
      str_replace_all("Sane", "Sané") %>%
      str_replace_all("Diabate", "Diabaté") %>%
      str_replace_all("`ere", "ère")
   return(player_name)
}

clean_team_names <- function(teams) {
   teams <- teams %>% mutate(Club = Club %>% url_decode() %>%
                                str_replace_all(" footballers", "") %>%
                                str_replace_all(" CF$", "") %>%
                                str_replace_all(" Taobao FC$", "") %>%
                                str_replace_all(" y Esgrima", "") %>%
                                str_replace_all(" de Santiago del Estero$", "") %>%
                                str_replace_all(" Esporte Clube$", "") %>%
                                str_replace_all("^Esporte Clube ", "") %>%
                                str_replace_all("^Club Deportivo U", "U") %>%
                                str_replace_all("^Tiburones Rojos de ", "") %>%
                                str_replace_all("^Associação", "") %>%
                                str_replace_all(" de Futebol$", "") %>%
                                str_replace_all(" Sporting Club$", "") %>%
                                str_replace_all(" Soccer Club$", "") %>%
                                str_replace_all("^Sport Club ", "") %>%
                                str_replace_all(" Fotboll$", "") %>%
                                str_replace_all(" Fodbold$", "") %>%
                                str_replace_all(" Gymnastikforening$", "") %>%
                                str_replace_all(" Foot-Ball Porto Alegrense", "") %>%
                                str_replace_all(" Paulista$", "") %>%
                                str_replace_all(" de Futebol e Regatas$", "") %>%
                                str_replace_all("^Sociedade Esportiva ", "") %>%
                                str_replace_all("^Clube de Regatas do ", "") %>%
                                str_replace_all("^Club de Regatas ", "") %>%
                                str_replace_all("^Clube ", "") %>%
                                str_replace_all("^Club ", "") %>%
                                str_replace_all("^RC ", "") %>%
                                str_replace_all("^SBV ", "") %>%
                                str_replace_all("^SBV ", "") %>%
                                str_replace_all(" Alsace$", "") %>%
                                str_replace_all("^Brugge ", "Club Brugge ") %>%
                                str_replace_all(" Calcio$", "") %>%
                                str_replace_all("^Calcio ", "") %>%
                                str_replace_all(" FCO$", "") %>%
                                str_replace_all(" KV$", "") %>%
                                str_replace_all(" KSV$", "") %>%
                                str_replace_all("^CF ", "") %>%
                                str_replace_all("^CD ", "") %>%
                                str_replace_all("^AD ", "") %>%
                                str_replace_all("^UD ", "") %>%
                                str_replace_all("^UC ", "") %>%
                                str_replace_all("^SD ", "") %>%
                                str_replace_all(" CFC$", "") %>%
                                str_replace_all(" AFC$", "") %>%
                                str_replace_all("^AFC ", "") %>%
                                str_replace_all(" FC$", "") %>%
                                str_replace_all("Angeles", "Angeles FC")
                             )
   return(teams)
}

get_team_flairs <- function(teams) {
   club_flairs <- read_csv("../soccerbot/club_flairs.csv", col_types = "cc")
   maxDist <- 3
   teams <- teams %>%
      mutate(Club =
                str_c(ifelse(is.na(club_flairs$sprite[amatch(Club, club_flairs$name, maxDist = maxDist)]),
                             "",
                             str_c(club_flairs$sprite[amatch(Club, club_flairs$name, maxDist = maxDist)], " ")),
                      Club))
   return(teams)
}

get_countries_leagues <- function(teams) {
   teams <- teams %>% mutate(number = row_number() + 1,
                             Country = case_when(number %in% 2:93 ~ "England + Wales",
                                                 number %in% 94:135 ~ "Spain",
                                                 number %in% 136:174 ~ "France",
                                                 number %in% 175:210 ~ "Germany",
                                                 number %in% 211:249 ~ "Italy",
                                                 number %in% 250:267 ~ "Portugal",
                                                 number %in% 268:283 ~ "Russia",
                                                 number %in% 284:300 ~ "Netherlands",
                                                 number %in% 301:316 ~ "Belgium",
                                                 number %in% 317:334 ~ "Turkey",
                                                 number %in% 335:346 ~ "Scotland",
                                                 number %in% 347:356 ~ "Switzerland",
                                                 number %in% 357:368 ~ "Greece",
                                                 number %in% 369:381 ~ "Denmark",
                                                 number %in% 382:393 ~ "Ukraine",
                                                 number %in% 394:416 ~ "Argentina",
                                                 number %in% 417:434 ~ "Mexico",
                                                 number %in% 435:446 ~ "Australia",
                                                 number %in% 447:470 ~ "United States + Canada",
                                                 number %in% 471:490 ~ "Brazil",
                                                 number %in% 491:499 ~ "Ireland",
                                                 number %in% 500:515 ~ "Sweden",
                                                 number %in% 516:530 ~ "Norway",
                                                 number %in% 531:546 ~ "Chile",
                                                 number %in% 547:564 ~ "Japan",
                                                 number %in% 565:580 ~ "China"
                                                 )) %>% select(-number)
   return(teams)
}

tictoc::tic("Calculation")
teams_players <- readRDS("../rds/teams_players_1_to_591.rds")
teams_players <- teams_players %>%
   bind_cols(format_names(teams_players$player)) %>%
   replace_na(list(first_name = "",
                   middle_name = "",
                   last_name = ""))
teams <- teams_players %>% distinct(team) %>% rename(Club = team) %>%
   mutate(Country = "",
          Mode_First_Name = "",
          Mode_Last_Name = "",
          Mode_Name = "") %>% select(Country, everything())
teams_to_calc <- 1:nrow(teams)
for (i in teams_to_calc) {
   team_players <- teams_players %>% filter(team == teams$Club[i])
   Mode_Name_parts <- get_Mode_Name(team_players)
   teams$Mode_First_Name[i] <-
      Mode_Name_parts$Mode_First_Name %>% clean_player_name()
   teams$Mode_Last_Name[i] <-
      Mode_Name_parts$Mode_Last_Name %>% clean_player_name()
   teams$Mode_Name[i] <-
      str_c(Mode_Name_parts$Mode_First_Name %>% str_replace_all(", ", "-"),
            Mode_Name_parts$Mode_Last_Name %>% str_replace_all(", ", "-"),
            sep = " ") %>%
      str_replace_all(" *\\(.*?\\) *", " ") %>%
      str_squish() %>% str_trim() %>% clean_player_name()
   "{teams$Club[i]} ({i}): {teams$Mode_Name[i]}" %>% glue() %>% print()
}

tictoc::toc()

teams <- teams %>%
   clean_team_names() %>%
   get_countries_leagues()
RDS_filename <- save_data_RDS(teams, glue("teams_players_common_names_{head(teams_to_calc, 1)}-{tail(teams_to_calc, 1)}"))
csv_filename <- write_data_csv(teams, glue("teams_players_common_names_{head(teams_to_calc, 1)}-{tail(teams_to_calc, 1)}"))

countries_to_present <- c("England + Wales", "Germany", "France", "Italy", "Spain",
                          "Portugal", "Russia", "Netherlands", "Turkey", "Scotland",
                          "United States + Canada", "Brazil", "Belgium", "Switzerland",
                          "Greece", "Argentina", "Mexico")
teams <- teams %>% get_team_flairs() %>% filter(Country %in% countries_to_present)
teams_split <- teams %>% filter(Country %in% countries_to_present) %>%
   group_by(Country) %>% group_split()
club_flairs <- read_csv("../soccerbot/country_flairs.csv", col_types = "cc")
maxDist <- 10
countries <- teams %>% group_by(Country) %>% group_keys() %>%
   filter(Country %in% countries_to_present)

desired_order <- match(countries_to_present, countries$Country)
countries <- countries %>% slice(desired_order)
teams_split <- teams_split[desired_order]
countries <- countries %>%
   mutate(Country = str_c(ifelse(is.na(club_flairs$sprite[amatch(Country, club_flairs$name, maxDist = maxDist)]),
                                 "",
                                 str_c(club_flairs$sprite[amatch(Country, club_flairs$name, maxDist = maxDist)], " ")),
                          Country))

md_filename <- "../blurbs/teams_players_common_names_{head(teams_to_calc, 1)}-{tail(teams_to_calc, 1)}.md" %>% glue()
for (i in 1:length(countries$Country)) {
   "# {countries$Country[i]}" %>% glue() %>% write_lines(md_filename, append = ifelse(i == 1, FALSE, TRUE), sep = "\n\n")
   teams_split[[i]] %>% select(-Country) %>%
      kable() %>% str_c(collapse = "\n") %>%
      write_lines(md_filename, append = TRUE, sep = ifelse(i == length(countries$Country), "", "\n\n"))
}

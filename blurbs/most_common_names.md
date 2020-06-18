# [Link to Spreadsheet: Most Common First + Last Names for Players of 579 Clubs](https://docs.google.com/spreadsheets/d/1CMd7gvD4WUp5t0P0Eka7f4Qh-g2NKjNjPVL_MyulGs0/)

---

# Introduction

Back in September, I had a random idea about figuring out the most common player names for a given club. Now at home I had some time to resurrect and make that idea a reality.

I used Wikipedia's API (through the [`WikipediR` R package](https://rdrr.io/cran/WikipediR/)) to extract the names of every player with a Wikipedia page that belonged to the category "X football players" or "X footballers" for a given club X. I did this extraction back in September, so all this data is only accurate as of September 2019 and does not account for any 2019-20 winter transfers. I compiled the list of players for every club, and then used the [`humaniformat` R package](https://rdrr.io/cran/humaniformat/) to "intelligently" split every player name into first and last names. Finally, I calculated the modes among the lists of first and last names of the players for each club. I have posted the code in a [Github repository](https://github.com/pastenague/Wiki) in case anyone is interested.

The following tables encompass as many teams from as many countries/leagues as I could fit with a reasonable length. The full list is available in the Google Sheets spreadsheet listed at the top of this post. The full list of data encompasses each of the countries below, as well as some others including China, Japan, and some Scandinavian countries), for a total of 579 clubs across the top or top two divisions of 26 countries (England + Wales includes League One and League Two teams as well).

I encourage anyone whose club is not listed in this post to peruse through that spreadsheet, as you will hopefully find it there. In addition, I have listed links to separate discussions on for some of the countries whose full list is not displayed in this post. Finally, I apologize if the names of any club are listed incorrectly - I had to do some processing to condense their names from the "official" name (which the Wikipedia pages are often named for) to their common names. Enjoy!

**Note: "X" represents a case in which there were more than 3 names that were all tied for being the most common for their club.**

---

# [](#sprite6-p222) England + [](#sprite6-p224) Wales

|Club                                     |First Name       |Last Name             |Name                  |
|:----------------------------------------|:---------------------|:--------------------------|:--------------------------|
|[](#sprite1-p3) Liverpool                |John (54)             |Jones (16)                 |John Jones                 |
|[](#sprite1-p10) Manchester City         |David (27)            |Smith (9)                  |David Smith                |
|[](#sprite1-p87) Leicester City          |John (25)             |Smith (12)                 |John Smith                 |
|[](#sprite1-p67) Crystal Palace          |John (31)             |Smith, Taylor (9)          |John Smith-Taylor          |
|[](#sprite1-p1) Arsenal                  |John (32)             |Jones (6)                  |John Jones                 |
|[](#sprite1-p15) Everton                 |John (43)             |Jones (13)                 |John Jones                 |
|[](#sprite1-p21) West Ham United         |George (30)           |X                          |George X                   |
|[](#sprite1-p2) Manchester United        |John (53)             |Jones, Williams (11)       |John Jones-Williams        |
|[](#sprite1-p5) Tottenham Hotspur        |John (38)             |Smith (13)                 |John Smith                 |
|[](#sprite1-p159) Sheffield United       |John (41)             |Smith (14)                 |John Smith                 |
|[](#sprite1-p4) Chelsea                  |John (28)             |Smith (12)                 |John Smith                 |
|[](#sprite1-p156) Burnley                |John (42)             |Smith (17)                 |John Smith                 |
|[](#sprite1-p38) Southampton             |George (40)           |Brown (11)                 |George Brown               |
|[](#sprite1-p11) Newcastle United        |John (44)             |Smith (10)                 |John Smith                 |
|[](#sprite1-p218) Bournemouth            |John (27)             |Smith (10)                 |John Smith                 |
|[](#sprite1-p103) Brighton & Hove Albion |Jack (33)             |Smith (13)                 |Jack Smith                 |
|[](#sprite1-p70) Wolverhampton Wanderers |George (34)           |Jones (10)                 |George Jones               |
|[](#sprite1-p19) Aston Villa             |John (36)             |Evans, Williams (8)        |John Evans-Williams        |
|[](#sprite1-p44) Norwich City            |John (26)             |Smith (12)                 |John Smith                 |
|[](#sprite1-p112) Watford                |Jimmy (24)            |Smith (10)                 |Jimmy Smith                |
|[](#sprite1-p212) Barnsley               |John (38)             |Smith (11)                 |John Smith                 |
|[](#sprite1-p102) Birmingham City        |Jack (35)             |Smith (16)                 |Jack Smith                 |
|[](#sprite1-p83) Blackburn Rovers        |John (41)             |Jones, Taylor (8)          |John Jones-Taylor          |
|[](#sprite1-p198) Brentford              |John (48)             |Smith (17)                 |John Smith                 |
|[](#sprite1-p158) Bristol City           |John (26)             |Williams (12)              |John Williams              |
|[](#sprite1-p80) Cardiff City            |John (28)             |Jones (18)                 |John Jones                 |
|[](#sprite1-p147) Charlton Athletic      |John (29)             |Smith (8)                  |John Smith                 |
|[](#sprite1-p116) Derby County           |John (34)             |Smith (11)                 |John Smith                 |
|[](#sprite1-p29) Fulham                  |John (28)             |Brown (13)                 |John Brown                 |
|[](#sprite1-p199) Huddersfield Town      |Paul (28)             |Smith (18)                 |Paul Smith                 |
|[](#sprite1-p117) Hull City              |George (25)           |Smith (10)                 |George Smith               |
|[](#sprite1-p27) Leeds United            |David, John (25)      |Smith (10)                 |David-John Smith           |
|[](#sprite1-p206) Luton Town             |John (28)             |Brown (8)                  |John Brown                 |
|[](#sprite1-p91) Middlesbrough           |John (25)             |Smith (9)                  |John Smith                 |
|[](#sprite1-p185) Millwall               |John (34)             |Smith (14)                 |John Smith                 |
|[](#sprite1-p66) Nottingham Forest       |John (37)             |Brown, Jones, Smith (8)    |John Brown-Jones-Smith     |
|[](#sprite1-p179) Preston North End      |John (38)             |Brown, Smith (11)          |John Brown-Smith           |
|[](#sprite1-p57) Queens Park Rangers     |John (25)             |Smith (11)                 |John Smith                 |
|[](#sprite1-p73) Reading                 |John (23)             |Smith (9)                  |John Smith                 |
|[](#sprite1-p92) Sheffield Wednesday     |John (25)             |Jones (10)                 |John Jones                 |
|[](#sprite1-p81) Stoke City              |John (58)             |Smith (17)                 |John Smith                 |
|[](#sprite1-p39) Swansea City            |John (24)             |Jones (18)                 |John Jones                 |
|[](#sprite1-p78) West Bromwich Albion    |George (27)           |Jones (11)                 |George Jones               |
|[](#sprite1-p105) Wigan Athletic         |John (27)             |Roberts, Taylor (5)        |John Roberts-Taylor        |

##### [Discussion on /r/Championship]()

# [](#sprite6-p64) Germany

|Club                                       |First Name                |Last Name            |Name                              |
|:------------------------------------------|:------------------------------|:-------------------------|:--------------------------------------|
|[](#sprite5-p14) RB Leipzig                |X                              |Müller (3)                |X Müller                               |
|[](#sprite1-p8) FC Bayern Munich           |Hans, Thomas (9)               |Müller (3)                |Hans-Thomas Müller                     |
|[](#sprite1-p427) VfL Wolfsburg            |Thomas (7)                     |Madsen (3)                |Thomas Madsen                          |
|[](#sprite1-p132) Bayer 04 Leverkusen      |Markus (7)                     |X                         |Markus X                               |
|[](#sprite1-p12) Borussia Dortmund         |Thomas (7)                     |Schmidt, Schneider (3)    |Thomas Schmidt-Schneider               |
|[](#sprite1-p154) SC Freiburg              |Michael (8)                    |X                         |Michael X                              |
|[](#sprite1-p86) Eintracht Frankfurt       |Thomas (11)                    |Lindner, Schmitt (3)      |Thomas Lindner-Schmitt                 |
|[](#sprite1-p134) Borussia Mönchengladbach |Michael (10)                   |Schulz (3)                |Michael Schulz                         |
|[](#sprite1-p353) TSG 1899 Hoffenheim      |Kevin, Andreas (5)             |Haas (4)                  |Kevin-Andreas Haas                     |
|[](#sprite1-p79) FC Schalke 04             |Michael (10)                   |X                         |Michael X                              |
|[](#sprite3-p23) 1 FC Union Berlin         |Daniel (7)                     |X                         |Daniel X                               |
|[](#sprite1-p203) Fortuna Düsseldorf       |Thomas, Christian, Michael (7) |X                         |Thomas-Christian-Michael X             |
|[](#sprite1-p64) SV Werder Bremen          |Frank (6)                      |Schmidt (3)               |Frank Schmidt                          |
|[](#sprite1-p125) 1 FC Köln                |X                              |Müller, Rahn, Schmitz (3) |X Müller-Rahn-Schmitz                  |
|[](#sprite2-p231) SC Paderborn 07          |Sebastian (8)                  |Brinkmann (2)             |Sebastian Brinkmann                    |
|[](#sprite1-p291) FC Augsburg              |Michael (9)                    |Müller (4)                |Michael Müller                         |
|[](#sprite1-p121) Hertha BSC               |Christian (8)                  |Müller (5)                |Christian Müller                       |
|[](#sprite1-p205) 1 FSV Mainz 05           |Christian (5)                  |Müller (4)                |Christian Müller                       |

##### [Full List (including 2. Bundesliga) & Discussion on /r/Bundesliga]()

# [](#sprite6-p60) France

|Club                                       |First Name                 |Last Name             |Name                             |
|:------------------------------------------|:-------------------------------|:--------------------------|:-------------------------------------|
|[](#sprite4-p31) Amiens SC                 |Fabrice (6)                     |Traoré (3)                 |Fabrice Traoré                        |
|[](#sprite4-p32) Angers SCO                |Stephane (7)                    |Traoré (3)                 |Stephane Traoré                       |
|[](#sprite1-p271) FC Girondins de Bordeaux |Andre (7)                       |Santos (3)                 |Andre Santos                          |
|[](#sprite2-p459) Dijon                    |Florent, Frédéric, Benjamin (4) |Martin (3)                 |Florent-Frédéric-Benjamin Martin      |
|[](#sprite1-p320) Lille OSC                |Jean, Philippe (6)              |X                          |Jean-Philippe X                       |
|[](#sprite1-p106) Olympique Lyonnais       |Eric (7)                        |Kone, Mendes (3)           |Eric Kone-Mendes                      |
|[](#sprite1-p119) Olympique de Marseille   |Laurent (8)                     |Pérez, Camara, NDiaye (3)  |Laurent Pérez-Camara-NDiaye           |
|[](#sprite1-p429) FC Metz                  |Philippe (8)                    |NDiaye, Traoré (4)         |Philippe NDiaye-Traoré                |
|[](#sprite1-p186) AS Monaco                |Eric, Sébastien, Nicolas (7)    |Traoré (5)                 |Eric-Sébastien-Nicolas Traoré         |
|[](#sprite1-p337) Montpellier HSC          |Nicolas (6)                     |Passi (3)                  |Nicolas Passi                         |
|[](#sprite1-p363) FC Nantes                |Nicolas (6)                     |Touré (5)                  |Nicolas Touré                         |
|[](#sprite2-p71) OGC Nice                  |Anthony (7)                     |Traoré (3)                 |Anthony Traoré                        |
|[](#sprite5-p347) Nîmes Olympique          |X                               |X                          |X X                                   |
|[](#sprite1-p35) Paris Saint-Germain       |Stephane (7)                    |Traoré (3)                 |Stephane Traoré                       |
|[](#sprite2-p389) Stade de Reims           |Thomas (6)                      |Fontaine, Sinibaldi (3)    |Thomas Fontaine-Sinibaldi             |
|[](#sprite2-p13) Stade Rennais             |Olivier, Stephane (7)           |Diallo, Diarra, Traoré (3) |Olivier-Stephane Diallo-Diarra-Traoré |
|[](#sprite1-p321) AS Saint-Étienne         |Laurent (7)                     |Camara (3)                 |Laurent Camara                        |
|[](#sprite4-p155) Strasbourg               |Stephane, David (7)             |Santos (3)                 |Stephane-David Santos                 |
|[](#sprite2-p108) Toulouse                 |Christophe, Mathieu (6)         |X                          |Christophe-Mathieu X                  |

##### [Full List (including Ligue 2) & Discussion on /r/Ligue1]()

# [](#sprite6-p82) Italy

|Club                                   |First Name           |Last Name                 |Name                                  |
|:--------------------------------------|:-------------------------|:------------------------------|:------------------------------------------|
|[](#sprite2-p182) Atalanta BC          |Andrea, Giuseppe (14)     |X                              |Andrea-Giuseppe X                          |
|[](#sprite2-p129) Bologna FC 1909      |Andrea (15)               |Ferrari (4)                    |Andrea Ferrari                             |
|[](#sprite2-p430) Brescia              |Andrea, Luca (14)         |Ferrari, Romano (3)            |Andrea-Luca Ferrari-Romano                 |
|[](#sprite2-p183) Cagliari             |Marco (15)                |X                              |Marco X                                    |
|[](#sprite1-p149) ACF Fiorentina       |Giuseppe, Marco (13)      |Manfredini, Orlando, Rizzo (3) |Giuseppe-Marco Manfredini-Orlando-Rizzo    |
|[](#sprite2-p130) Genoa                |Francesco (18)            |X                              |Francesco X                                |
|[](#sprite2-p90) Hellas Verona         |Marco (17)                |Ferrari (4)                    |Marco Ferrari                              |
|[](#sprite1-p25) Inter Milan           |Giuseppe (25)             |Colombo, Sala (4)              |Giuseppe Colombo-Sala                      |
|[](#sprite1-p17) Juventus              |Giuseppe (18)             |Rossi (5)                      |Giuseppe Rossi                             |
|[](#sprite1-p189) SS Lazio             |Roberto (14)              |X                              |Roberto X                                  |
|[](#sprite2-p185) US Lecce             |Giuseppe (14)             |Di Chiara, Petrachi (3)        |Giuseppe Di Chiara-Petrachi                |
|[](#sprite1-p13) AC Milan              |Marco (19)                |X                              |Marco X                                    |
|[](#sprite1-p75) SSC Napoli            |Roberto (14)              |Esposito, Ferrara, Fontana (3) |Roberto Esposito-Ferrara-Fontana           |
|[](#sprite1-p430) Parma Calcio 1913    |Marco, Alessandro (19)    |Ferrari (4)                    |Marco-Alessandro Ferrari                   |
|[](#sprite1-p36) AS Roma               |Marco, Paolo (16)         |Conti, Ferrari (4)             |Marco-Paolo Conti-Ferrari                  |
|[](#sprite2-p186) Sampdoria            |Andrea (17)               |Ferrari (4)                    |Andrea Ferrari                             |
|[](#sprite7-p312) SPAL                 |Marco (12)                |Vecchi (3)                     |Marco Vecchi                               |
|[](#sprite1-p486) Torino               |Alessandro, Giuseppe (16) |Benedetti, López, Romano (3)   |Alessandro-Giuseppe Benedetti-López-Romano |
|[](#sprite1-p310) Udinese              |Antonio, Marco (10)       |Santos (5)                     |Antonio-Marco Santos                       |

# [](#sprite6-p161) Spain

|Club                                     |First Name        |Last Name                   |Name                         |
|:----------------------------------------|:----------------------|:--------------------------------|:---------------------------------|
|[](#sprite1-p76) Atlético Madrid         |José (24)              |López, Diaz, Rodríguez (5)       |José López-Diaz-Rodríguez         |
|[](#sprite1-p171) Athletic Bilbao        |José (25)              |García (7)                       |José García                       |
|[](#sprite1-p229) Sevilla                |José (18)              |Silva, López (4)                 |José Silva-López                  |
|[](#sprite2-p105) Levante UD             |José (20)              |Rodríguez (5)                    |José Rodríguez                    |
|[](#sprite1-p9) Real Madrid              |José (28)              |Fernández (7)                    |José Fernández                    |
|[](#sprite2-p87) CA Osasuna              |Javier, José (11)      |García (12)                      |Javier-José García                |
|[](#sprite5-p12) Deportivo Alavés        |Sergio (9)             |García (7)                       |Sergio García                     |
|[](#sprite1-p6) FC Barcelona             |José (18)              |García (8)                       |José García                       |
|[](#sprite2-p63) Granada                 |Antonio (12)           |Pérez (5)                        |Antonio Pérez                     |
|[](#sprite1-p107) Valencia               |José (15)              |Navarro (5)                      |José Navarro                      |
|[](#sprite2-p377) Real Valladolid        |José (24)              |Fernández, García (6)            |José Fernández-García             |
|[](#sprite1-p408) Celta de Vigo          |José (13)              |Fernández (6)                    |José Fernández                    |
|[](#sprite1-p237) Real Sociedad          |José (16)              |Alonso (4)                       |José Alonso                       |
|[](#sprite2-p264) RCD Mallorca           |Juan (12)              |López (7)                        |Juan López                        |
|[](#sprite1-p296) Real Betis             |José (16)              |Fernández, Rodríguez, García (5) |José Fernández-Rodríguez-García   |
|[](#sprite1-p270) Villarreal             |Javier (13)            |González (5)                     |Javier González                   |
|[](#sprite2-p180) Getafe                 |David (10)             |Diaz (5)                         |David Diaz                        |
|[](#sprite1-p500) Eibar                  |José (19)              |García (7)                       |José García                       |
|[](#sprite2-p22) RCD Espanyol            |José (23)              |López (7)                        |José López                        |
|[](#sprite5-p28) Leganés                 |Carlos (9)             |García (6)                       |Carlos García                     |

# [](#sprite6-p139) Portugal

|Club                                   |First Name             |Last Name             |Name                      |
|:--------------------------------------|:---------------------------|:--------------------------|:------------------------------|
|[](#sprite1-p26) SL Benfica            |José (28)                   |Pereira, Silva (10)        |José Pereira-Silva             |
|[](#sprite1-p342) SC Braga             |João (15)                   |Silva, Santos (9)          |João Silva-Santos              |
|[](#sprite1-p37) FC Porto              |Carlos, Antonio (13)        |Pereira (13)               |Carlos-Antonio Pereira         |
|[](#sprite1-p52) Sporting CP           |X                           |Tavares (2)                |X Tavares                      |

##### [Full List & Discussion on /r/PrimeiraLiga]()

# [](#sprite6-p142) Russia

|Club                                       |Mode_First_Name        |Mode_Last_Name                        |Mode_Name                                 |
|:------------------------------------------|:----------------------|:-------------------------------------|:-----------------------------------------|
|[](#sprite1-p247) FC Spartak Moscow        |Aleksandr (48)         |Ivanov (5)                            |Aleksandr Ivanov                          |
|[](#sprite2-p72) FC Lokomotiv Moscow       |Aleksandr (45)         |Kuznetsov (5)                         |Aleksandr Kuznetsov                       |
|[](#sprite3-p11) FC Zenit Saint Petersburg |Sergei (20)            |Ivanov (6)                            |Sergei Ivanov                             |
|[](#sprite1-p220) PFC CSKA Moscow          |Sergei (33)            |Ivanov, Kuznetsov (4)                 |Sergei Ivanov-Kuznetsov                   |

# [](#sprite6-p124) Netherlands

|Club                              |First Name            |Last Name                 |Name                    |
|:---------------------------------|:--------------------------|:------------------------------|:----------------------------|
|[](#sprite1-p22) Ajax             |Wim, Jan (12)              |Keizer (4)                     |Wim-Jan Keizer               |
|[](#sprite1-p120) PSV Eindhoven   |Jan (9)                    |de Jong (5)                    |Jan de Jong                  |
|[](#sprite1-p65) Feyenoord        |Jan, Henk, John (7)        |X                              |Jan-Henk-John X              |

##### [Full List & Discussion on /r/Eredivisie]()

# [](#sprite6-p177) Turkey

|Club                                     |First Name             |Last Name             |Name                                 |
|:----------------------------------------|:---------------------------|:--------------------------|:-----------------------------------------|
|[](#sprite1-p88) Fenerbahçe SK           |Mehmet (9)                  |Simsek (3)                 |Mehmet Simsek                             |
|[](#sprite1-p357) Trabzonspor            |X                           |Demir, Yılmaz (4)          |X Demir-Yılmaz                            |
|[](#sprite1-p160) Beşiktaş JK            |Ali, Gökhan (7)             |Özkan (3)                  |Ali-Gökhan Özkan                          |
|[](#sprite1-p42) Galatasaray SK          |Emre (9)                    |Erdem (4)                  |Emre Erdem                                |

##### [Full List & Discussion on /r/Superlig]()

# [](#sprite6-p223) Scotland

|Club                                  |First Name |Last Name        |Name             |
|:-------------------------------------|:---------------|:---------------------|:---------------------|
|[](#sprite1-p18) Celtic               |John (53)       |Miller (7)            |John Miller           |
|[](#sprite1-p40) Rangers              |John (45)       |Ferguson (10)         |John Ferguson         |

##### [Full List & Discussion on /r/ScottishFootball]()

# [](#sprite6-p184) United States + [](#sprite6-p31) Canada

|Club                                    |First Name           |Last Name                |Name                          |
|:---------------------------------------|:-------------------------|:-----------------------------|:----------------------------------|
|[](#sprite5-p48) Los Angeles FC         |Carlos, Diego (2)         |Pérez (3)                     |Carlos-Diego Pérez                 |
|[](#sprite1-p32) Philadelphia Union     |Chris, Brian (5)          |Jones (3)                     |Chris-Brian Jones                  |
|[](#sprite1-p499) New York City         |X                         |Mendoza (2)                   |X Mendoza                          |
|[](#sprite5-p34) Atlanta United         |George, Andrew, Chris (2) |Martínez (2)                  |George-Andrew-Chris Martínez       |
|[](#sprite1-p14) Seattle Sounders       |Michael (3)               |X                             |Michael X                          |
|[](#sprite1-p89) Minnesota United       |Thomas, Sam, Kevin (2)    |Ibarra (2)                    |Thomas-Sam-Kevin Ibarra            |
|[](#sprite1-p54) San Jose Earthquakes   |Chris (7)                 |X                             |Chris X                            |
|[](#sprite1-p77) Real Salt Lake         |Chris (8)                 |Johnson, Martínez (3)         |Chris Johnson-Martínez             |
|[](#sprite1-p69) FC Dallas              |X                         |Rodríguez (5)                 |X Rodríguez                        |
|[](#sprite1-p28) LA Galaxy              |David, Brian (7)          |González (4)                  |David-Brian González               |
|[](#sprite1-p41) DC United              |Chris (8)                 |Carroll (3)                   |Chris Carroll                      |
|[](#sprite1-p34) New York Red Bulls     |Chris, Mike (9)           |Álvarez, Hernández, Lewis (3) |Chris-Mike Álvarez-Hernández-Lewis |
|[](#sprite1-p20) Portland Timbers       |X                         |Johnson (3)                   |X Johnson                          |
|[](#sprite1-p55) New England Revolution |José (7)                  |Brown, Smith (3)              |José Brown-Smith                   |
|[](#sprite1-p53) Toronto                |Nick (5)                  |X                             |Nick X                             |
|[](#sprite1-p96) Montreal Impact        |Eric (3)                  |Choinière, González (2)       |Eric Choinière-González            |
|[](#sprite1-p31) Sporting Kansas City   |Matt, Chris, Kevin (6)    |X                             |Matt-Chris-Kevin X                 |
|[](#sprite1-p94) Orlando City SC        |X                         |García, Sané (2)              |X García-Sané                      |
|[](#sprite1-p50) Chicago Fire           |David (9)                 |Johnson (5)                   |David Johnson                      |
|[](#sprite1-p45) Houston Dynamo         |Eric, Chris (4)           |Brown (3)                     |Eric-Chris Brown                   |
|[](#sprite1-p48) Columbus Crew SC       |Chris, Brian, Matt (7)    |Williams (5)                  |Chris-Brian-Matt Williams          |
|[](#sprite1-p93) Colorado Rapids        |Chris, Matt (8)           |Brown (4)                     |Chris-Matt Brown                   |
|[](#sprite1-p56) Vancouver Whitecaps    |Michael, David (3)        |Davies (2)                    |Michael-David Davies               |
|[](#sprite5-p126) FC Cincinnati         |X                         |Walker (2)                    |X Walker                           |

##### [Discussion on /r/MLS]()

# [](#sprite6-p24) Brazil

|Club                                   |First Name   |Last Name        |Name              |
|:--------------------------------------|:-----------------|:---------------------|:----------------------|
|[](#sprite1-p100) Flamengo             |Rodrigo (12)      |da Silva (21)         |Rodrigo da Silva       |
|[](#sprite1-p187) Santos               |Paulo (12)        |Santos (21)           |Paulo Santos           |
|[](#sprite1-p90) Corinthians           |Fabio (10)        |Santos (17)           |Fabio Santos           |
|[](#sprite1-p101) São Paulo            |José (14)         |da Silva (17)         |José da Silva          |
|[](#sprite1-p142) Palmeiras            |José (15)         |da Silva (23)         |José da Silva          |
|[](#sprite1-p190) Internacional        |Marcelo (12)      |da Silva (24)         |Marcelo da Silva       |
|[](#sprite1-p130) Grêmio               |Paulo (14)        |da Silva, Santos (18) |Paulo da Silva-Santos  |
|[](#sprite1-p265) CR Vasco da Gama     |Paulo (14)        |da Silva (19)         |Paulo da Silva         |
|[](#sprite1-p196) Cruzeiro             |Rafael, José (10) |Santos (17)           |Rafael-José Santos     |
|[](#sprite1-p228) Fluminense           |Carlos (10)       |Santos (17)           |Carlos Santos          |

##### [Full List & Discussion on /r/Futebol]()

# [](#sprite6-p17) Belgium

|Club                                   |First Name                 |Last Name               |Name                                       |
|:--------------------------------------|:-------------------------------|:----------------------------|:-----------------------------------------------|
|[](#sprite1-p351) Standard Liège       |Jonathan (7)                    |Santos (3)                   |Jonathan Santos                                 |
|[](#sprite1-p217) Club Brugge          |Ivan (5)                        |X                            |Ivan X                                          |
|[](#sprite2-p37) KAA Gent              |Thomas (5)                      |NDiaye (3)                   |Thomas NDiaye                                   |
|[](#sprite1-p316) KRC Genk             |Marco, Kevin, Igor (3)          |Gudjonsson, Peeters (3)      |Marco-Kevin-Igor Gudjonsson-Peeters             |
|[](#sprite2-p45) Royal Antwerp         |Kevin (5)                       |X                            |Kevin X                                         |
|[](#sprite1-p157) RSC Anderlecht       |Jan (7)                         |Martens (3)                  |Jan Martens                                     |
|[](#sprite2-p216) Cercle Brugge        |Kevin, Olivier (4)              |X                            |Kevin-Olivier X                                 |

# [](#sprite6-p167) Switzerland

|Club                                  |First Name                |Last Name               |Name                           |
|:-------------------------------------|:------------------------------|:----------------------------|:-----------------------------------|
|[](#sprite1-p258) BSC Young Boys      |Alain, Marco, Martin (4)       |Burki, Sutter (3)            |Alain-Marco-Martin Burki-Sutter     |
|[](#sprite1-p192) FC Basel            |Marco, Walter (8)              |Ajeti, Boumelaha, Rahmen (3) |Marco-Walter Ajeti-Boumelaha-Rahmen |

# [](#sprite6-p66) Greece

|Club                                |First Name               |Last Name    |Name                            |
|:-----------------------------------|:-----------------------------|:-----------------|:------------------------------------|
|[](#sprite1-p413) PAOK              |Dimitris (15)                 |X                 |Dimitris X                           |
|[](#sprite1-p139) Olympiacos        |Giorgos (12)                  |Papadopoulos (5)  |Giorgos Papadopoulos                 |
|[](#sprite1-p284) AEK Athens        |Christos (12)                 |Vlachos (4)       |Christos Vlachos                     |
|[](#sprite1-p183) Panathinaikos     |Nikos (17)                    |X                 |Nikos X                              |


# [](#sprite6-p7) Argentina

|Club                                        |First Name    |Last Name          |Name                 |
|:-------------------------------------------|:------------------|:-----------------------|:-------------------------|
|[](#sprite1-p446) San Lorenzo               |José (20)          |González (6)            |José González             |
|[](#sprite1-p95) Boca Juniors               |Juan (26)          |González (7)            |Juan González             |
|[](#sprite1-p441) Newell's Old Boys         |Juan (19)          |Rodríguez (6)           |Juan Rodríguez            |
|[](#sprite2-p467) Rosario Central           |José (19)          |González (10)           |José González             |
|[](#sprite1-p110) River Plate               |Juan (33)          |Fernández, Martínez (8) |Juan Fernández-Martínez   |
|[](#sprite2-p154) Estudiantes de La Plata   |Juan (26)          |Fernández, González (7) |Juan Fernández-González   |
|[](#sprite1-p425) Atlético Independiente    |Carlos (19)        |Martínez, Rodríguez (6) |Carlos Martínez-Rodríguez |
|[](#sprite1-p402) Racing Club de Avellaneda |Juan (23)          |González (6)            |Juan González             |

# [](#sprite6-p112) Mexico

|Club                                        |First Name    |Last Name          |Name                 |
|:-------------------------------------------|:------------------|:-----------------------|:-------------------------|
|[](#sprite1-p61) América           |Carlos, Luis (13)   |Sánchez (9)                |Carlos-Luis Sánchez            |
|[](#sprite1-p173) Tigres UANL      |Carlos (10)         |Hernández (6)              |Carlos Hernández               |
|[](#sprite1-p161) Monterrey        |Juan (11)           |X                          |Juan X                         |
|[](#sprite1-p111) Cruz Azul        |Carlos (15)         |Gutiérrez (6)              |Carlos Gutiérrez               |
|[](#sprite1-p47) Guadalajara       |José (16)           |X                          |José X                         |
|[](#sprite1-p137) Pumas UNAM       |José, Luis (8)      |López, Castro, Ramírez (5) |José-Luis López-Castro-Ramírez |

##### [Full List & Discussion on /r/LigaMX]()

---

# Insights

* With 60 Johns, **Sunderland** are officially the club with the most Johns in the world, beating Stoke City (58), Liverpool (54), and Manchester United and Port Vale (53) to claim the title.
* With 33 Juans, **River Plate** are officially the club with the most Juans in the world.
* **Port Vale** are officially the Smithiest club in the world, with 23 men of that name having played for the club. The Jonesiest club in the world are **Crewe Alexandra**, with 20 Joneses.
* **Huddersfield Town** are the only Paul club in the top two English divisions.
* It's only fitting that the most common name in **Bayern Munich**'s history is (Hans-)Thomas Müller. However, the club with the most Müllers in the top two German divisions is actually **Dynamo Dresden** (7) - and their most common name is also Thomas Müller!
* Most of the most common French surnames are of African origin - particularly Traoré, Touré, and Camara. A more surprising one is Santos, which is the most common surname of **Bordeaux** and **Strasbourg**.
* Though [their fans probably winced at the name](https://www.theguardian.com/football/blog/2013/oct/21/serie-a-fiorentina-juventus-giuseppe-rossi), Giuseppe Rossi turns out to be the most common name in **Juventus**'s history.
* Italian and German clubs seem to be (perhaps surprisingly) quite heterogeneous in terms of footballing names, with numbers of last name duplicates not exceeding 5 - an extremely low number compared to those of England and even Spain.
* Brazil is filled with Santoses and da Silvas. All 21 Brazilian clubs analysed had one of those two surnames as their most common surnames.

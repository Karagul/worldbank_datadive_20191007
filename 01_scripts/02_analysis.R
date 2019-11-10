  library(stats)
  library(stargazer)
  
  proj_path <- "C:/Users/Anna/Desktop/wb_datadive/"
  countries <- read.csv(paste0(proj_path, "/03_clean_data/wb_datadive_group4_data.csv"), header = TRUE, stringsAsFactors = FALSE)
  #names(countries)
  
  gdplm2006 <- lm(gdp_2006 ~ net_use_2006 + pop_2006 + popw_2006 + urban_2006 + educ_spend2006, data = countries)  
  gdplm2006
  
  gdplm2007 <- lm(gdp_2007 ~ net_use_2007 + pop_2007 + popw_2007 + urban_2007 + educ_spend2007, data = countries)  
  gdplm2007  
  
  gdplm2016 <- lm(gdp_2016 ~ net_use_2016 + pop_2016 + popw_2016 + urban_2016 + educ_spend2016, data = countries)  
  gdplm2016
  
  gdplm2017 <- lm(gdp_2017 ~ net_use_2017 + pop_2017 + popw_2017 + urban_2017 + educ_spend2017, data = countries)  
  gdplm2017  
  
  #
  
  life_exp_lm2006 <- lm(life_exp_2006 ~ net_use_2006 + pop_2006 + popw_2006 + urban_2006 + educ_spend2006, data = countries)
  life_exp_lm2006
  
  life_exp_lm2007 <- lm(life_exp_2007 ~ net_use_2007 + pop_2007 + popw_2007 + urban_2007 + educ_spend2007, data = countries)
  life_exp_lm2007  
  
  life_exp_lm2016 <- lm(life_exp_2016 ~ net_use_2016 + pop_2016 + popw_2016 + urban_2016 + educ_spend2016, data = countries)
  life_exp_lm2016
  
  life_exp_lm2017 <- lm(life_exp_2017 ~ net_use_2017 + pop_2017 + popw_2017 + urban_2017 + educ_spend2017, data = countries)
  life_exp_lm2017  
  
  
  stargazer::stargazer(gdplm2006, life_exp_lm2006, type = "text" )
  stargazer::stargazer(gdplm2007, life_exp_lm2007, type = "text" )
  stargazer::stargazer(gdplm2016, life_exp_lm2016, type = "text" )
  stargazer::stargazer(gdplm2017, life_exp_lm2017, type = "text" )
  
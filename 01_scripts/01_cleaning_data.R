  proj_path <- "C:/Users/Anna/Desktop/wb_datadive/"
  
  raw_list <- list.files(path = paste0(proj_path, "/02_raw_data"), pattern = "^API", 
                         recursive = TRUE, full.names = TRUE)

    
  educ_spend <- read.csv(raw_list[1], header = TRUE, stringsAsFactors = FALSE)
  names(educ_spend)[1] <- "Country_Name"
  educ_spend <- educ_spend[ , c("Country_Name", "Country.Code", "X2006", "X2007","X2016","X2017" )]
  names(educ_spend) <- gsub("X", "educ_spend", names(educ_spend))
  
  gdp <- read.csv(raw_list[2], header = TRUE, stringsAsFactors = FALSE)
  names(gdp)[1] <- "Country_Name"
  gdp <- gdp[ , c("Country_Name", "Country.Code", "X2006", "X2007","X2016","X2017" )]
  names(gdp) <- gsub("X", "gdp_", names(gdp))

  life_exp <- read.csv(raw_list[3], header = TRUE, stringsAsFactors = FALSE)
  names(life_exp)[1] <- "Country_Name"
  life_exp <- life_exp[ , c("Country_Name", "Country.Code", "X2006", "X2007","X2016","X2017" )] 
  names(life_exp) <- gsub("X", "life_exp_", names(life_exp))

  net_use <- read.csv(raw_list[4], header = TRUE, stringsAsFactors = FALSE)
  names(net_use)[1] <- "Country_Name"
  net_use <- net_use[ , c("Country_Name", "Country.Code", "X2006", "X2007","X2016","X2017" )] 
  names(net_use) <- gsub("X", "net_use_", names(net_use))

  pop <- read.csv(raw_list[5], header = TRUE, stringsAsFactors = FALSE)
  names(pop)[1] <- "Country_Name"
  pop <- pop[ , c("Country_Name", "Country.Code", "X2006", "X2007","X2016","X2017" )] 
  names(pop) <- gsub("X", "pop_", names(pop))
  
  popw <- read.csv(raw_list[6], header = TRUE, stringsAsFactors = FALSE)
  names(popw)[1] <- "Country_Name"
  popw <- popw[ , c("Country_Name", "Country.Code", "X2006", "X2007","X2016","X2017" )] 
  names(popw) <- gsub("X", "popw_", names(popw))   

  urban <- read.csv(raw_list[7], header = TRUE, stringsAsFactors = FALSE)
  names(urban)[1] <- "Country_Name"
  urban <- urban[ , c("Country_Name", "Country.Code", "X2006", "X2007","X2016","X2017" )] 
  names(urban) <- gsub("X", "urban_", names(urban)) 
  
  merged <- merge(gdp, life_exp, by = c("Country_Name", "Country.Code"), all = TRUE)
  merged <- merge(merged, pop, by = c("Country_Name", "Country.Code"), all = TRUE)    
  merged <- merge(merged, popw, by = c("Country_Name", "Country.Code"), all = TRUE)  
  merged <- merge(merged, urban, by = c("Country_Name", "Country.Code"), all = TRUE)  
  merged <- merge(merged, educ_spend, by = c("Country_Name", "Country.Code"), all = TRUE)  
  merged <- merge(merged, net_use, by = c("Country_Name", "Country.Code"), all = TRUE)  

  not_countries <- c("CEB", "EAR", "EAP", "TEA", "EAS", "FCS","ECA", "TEC", "ECS", "EUU", "HPC", "HIC", "IBD", "IBT", "IDB", "IDX", "IDA", "LTE", "LAC", "LCN", "TLA", "LDC", "LMY", "LIC", "LMC", "MNA", "TMN", "MEA", "MIC", "NAC", "INX", "OED", "OSS", "PSS", "PST", "PRE", "SST", "TSA", "SAS", "SSA", "TSS", "SSF", "UMC", "WLD", "CSS", "EMU")
  
  countries <- merged[ ! merged$Country.Code %in% not_countries, ]  
  
  write.csv(countries, paste0(proj_path, "/03_clean_data/wb_datadive_group4_data.csv"), row.names = FALSE)
  
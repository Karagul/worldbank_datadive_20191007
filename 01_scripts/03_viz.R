  library(rgdal)
  library(ggplot2)
  library(plyr)
  
  proj_path <- "C:/Users/Anna/Desktop/wb_datadive/"
  
  world <- readOGR(paste0(proj_path, "/02_raw_data/world_shp/TM_WORLD_BORDERS_SIMPL-0.3.shp"))
  #plot(world)
  
  countries <- read.csv(paste0(proj_path, "/03_clean_data/wb_datadive_group4_data.csv"), 
                        header = TRUE, stringsAsFactors = FALSE)
  names(countries)[2] <- "id"
  countries$net_use_change0717 <- countries$net_use_2017-countries$net_use_2007

  world_data <- merge(world, countries, by.x = "ISO3", by.y = "id")  
  world_data_df <- fortify(world_data, region = "ISO3")
  world_data_df <- join(world_data_df, countries, by = "id")
  
  #internet usage in 2017
  ggplot(data = world_data_df, aes(x = long, y = lat, group = group)) + 
    geom_path() +
    theme_bw() +
    geom_polygon(aes(fill = net_use_2017), color = 'gray', size = 0.1) +
    coord_fixed(1.3) +
    scale_fill_gradient(high = "#e34a33", low = "#fee8c8", guide = "colorbar") + 
    guides(fill=guide_colorbar(title="Percent of Pop.")) + 
    ggtitle("Internet Usage - Proportion of Population 2017") + 
    theme(legend.justification=c(0,-0.1), legend.position=c(0.01,0))
  
  # change in decade
  ggplot(data = world_data_df, aes(x = long, y = lat, group = group)) + 
    geom_path() +
    theme_bw() +
    geom_polygon(aes(fill = net_use_change0717), color = 'gray', size = 0.1) +
    coord_fixed(1.3) +
    scale_fill_gradient(high = "#e34a33", low = "#fee8c8", guide = "colorbar") + 
    guides(fill=guide_colorbar(title="Percent of Pop.")) + 
    ggtitle("Internet Usage - Change from 2007 to 2017") + 
    theme(legend.justification=c(0,-0.1), legend.position=c(0.01,0))
  
  # LOG GDP
  ggplot(data = world_data_df, aes(x = long, y = lat, group = group)) + 
    geom_path() +
    theme_bw() +
    geom_polygon(aes(fill = log(gdp_2017)), color = 'gray', size = 0.1) +
    coord_fixed(1.3) +
    scale_fill_gradient(high = "#132B43", low = "#56B1F7", guide = "colorbar") + 
    guides(fill=guide_colorbar(title="Log GDP per capita")) + 
    ggtitle("Log of GDP per Capita 2017 (constant 2010 US$)") + 
    theme(legend.justification=c(0,-0.1), legend.position=c(0.01,0))
  
  # life expectancy
  ggplot(data = world_data_df, aes(x = long, y = lat, group = group)) + 
    geom_path() +
    theme_bw() +
    geom_polygon(aes(fill = life_exp_2007), color = 'gray', size = 0.1) +
    coord_fixed(1.3) +
    scale_fill_gradient(high = "#CA0020", low = "#FDB863", guide = "colorbar") + 
    guides(fill=guide_colorbar(title="Life Exp.")) + 
    ggtitle("Life Expectancy 2007") + 
    theme(legend.justification=c(0,-0.1), legend.position=c(0.01,0))
    
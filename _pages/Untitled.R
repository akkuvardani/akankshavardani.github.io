library(readxl)
pune_dist_N9_Data_2023_24_1 <- read_excel("~/Downloads/pune dist N9 Data 2023_24.xlsx", 
                                        sheet = "2023 - 2024 PART 1 ")

pune_dist_N9_Data_2023_24_2 <- read_excel("~/Downloads/pune dist N9 Data 2023_24.xlsx", 
                                          sheet = "2023 - 2024 PART 2")

pune_dist_N9_Data_2023_24_2$`...29`<-NULL

pune_dist_N9_Data_2023_24 <- rbind(pune_dist_N9_Data_2023_24_1,pune_dist_N9_Data_2023_24_2)

pune_n9_23_24 <- setDT(pune_dist_N9_Data_2023_24)[,c(1:6)]

pune_n9_23_24<- unique(pune_n9_23_24)

rm(pune_dist_N9_Data_2023_24_1,pune_dist_N9_Data_2023_24_2,pune_dist_N9_Data_2023_24)

sampled_gplgdcode <- pune_n9_23_24 %>%
  filter(TALNAME!="Mulshi") %>% 
  select(TALNAME, GPLGDCODE) %>%
  distinct() %>%  # Get unique TALNAME and GPLGDCODE combinations
  group_by(TALNAME) %>%
  sample_n(size = 8, replace = FALSE) %>%  # Randomly sample 12 GPLGDCODE per TALNAME
  ungroup()

# Filter the original data to keep only the sampled GPLGDCODE observations
sampled_data <- pune_n9_23_24 %>%
  semi_join(sampled_gplgdcode, by = c("TALNAME", "GPLGDCODE"))

## Mulshi is the only one not in here 

write_xlsx(sampled_data,paste0("/Users/akankshavardani/Dropbox/Arsin_gender_names/n9_23_24_pune.xlsx"))

rm(pune_dist_N9_Data_2023_24,pune_dist_N9_Data_2023_24_2,pune_dist_N9_Data_2023_24_1,pune_n9_23_24,sampled_data,sampled_gplgdcode)

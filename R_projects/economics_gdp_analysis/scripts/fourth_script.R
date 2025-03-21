library(dplyr)
library(tidyverse)

gni <- read_excel("C:/Users/hardk/OneDrive/Рабочий стол/учёба/10 семестр/экономика/1 задание/data/API_NY.GNP.PCAP.PP.KD_DS2_en_excel_v2_1074.xls",
                  skip=3, sheet="Data")
gni <- gni %>%
  filter(`Country Code` == "CZE") %>%
  select(where(~ all(!is.na(.)))) %>%
  select(-`Country Name`, -`Country Code`, -`Indicator Name`, -`Indicator Code`) %>%
  pivot_longer(cols = everything(), names_to = "Year", values_to = "Value")

gni$Year <- as.numeric(gni$Year) 


theme_set(theme_minimal(base_family = "Roboto Mono"))

theme_update(plot.background = element_rect(fill = "white", color = "white"), ##fffaf0
             panel.background = element_rect(fill = NA, color = NA),
             panel.border = element_rect(fill = NA, color = NA),
             axis.text.y = element_text(size = 10),
             panel.grid.minor = element_blank(),
             axis.title.y = element_text(size = 13,
                                         margin = margin(r = 10)),
             legend.title = element_text(size = 9),
             plot.caption = element_text(family = "Special Elite",
                                         size = 10,
                                         color = "grey70",
                                         face = "bold",
                                         hjust = .5,
                                         margin = margin(5, 0, 20, 0)),
             plot.margin = margin(10, 20, 10, 20))




ggplot(gni, aes(Year, Value)) +
  geom_line(colour = "#B22222", linewidth = 1) +
  labs(title = "ВРД на душу населения в реальном выражении в долларах \nпо ППС (постоянный международный показатель на 2021 год)",
       x = "Годы",
       y = "ВРД, в долларах")+
  scale_x_continuous(breaks = c(1995, 2000, 2005, 2008, 2010, 2015, 2020, 2022)) +
  theme(plot.title = element_text(hjust = 0.5))
  
  
  
  
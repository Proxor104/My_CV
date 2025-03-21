library(dplyr)
library(tidyverse)
library(readxl)
library(ggrepel)
library(viridis)
library(ggsci)

gdp_production <- read_excel("C:/Users/hardk/OneDrive/Рабочий стол/учёба/10 семестр/экономика/1 задание/data/B000101_EN.xlsx")
colnames(gdp_production) <- c("Name",  "Gross value added")
gdp_production <- gdp_production %>%
  filter((!is.na(`Gross value added`)) & (`Gross value added` != ":"))

gdp_production$`Gross value added` <- as.numeric(gsub("[^0-9.]", "", gdp_production$`Gross value added`))

total <- gdp_production[1,]
gdp_production <- gdp_production[2:nrow(gdp_production),]

print(sum(gdp_production["Gross value added"]) == total["Gross value added"])

gdp_production <- gdp_production %>%
  group_by(`Name`) %>%
  summarise(`Gross value added` = sum(`Gross value added`)) %>%
  ungroup()

total_value <- total$`Gross value added`[1]

gdp_production["Percent"] <- gdp_production["Gross value added"] * 100 / total_value

gdp_production <- gdp_production %>%
  arrange(desc(`Gross value added`))

other_value <- sum(gdp_production[11:nrow(gdp_production),]$`Gross value added`)

gdp_production[11:nrow(gdp_production),] <- list("Other", other_value, other_value * 100 / total_value)
gdp_production <- gdp_production[1:11,]

gdp_production <- gdp_production %>%
  arrange(desc(Percent))

theme_set(theme_minimal(base_family = "Roboto Mono"))

theme_update(plot.background = element_rect(fill = "white", color = "white"), ##fffaf0
             panel.background = element_rect(fill = NA, color = NA),
             panel.border = element_rect(fill = NA, color = NA),
             panel.grid.minor = element_blank(),
             axis.text.y = element_blank(),
             axis.title.y = element_blank(),
             axis.text.x = element_blank(),
             axis.title.x = element_blank(),
             legend.title = element_text(size = 9),
             plot.caption = element_text(family = "Special Elite",
                                         size = 10,
                                         color = "grey70",
                                         face = "bold",
                                         hjust = .5,
                                         margin = margin(5, 0, 20, 0)),
             plot.margin = margin(10, 20, 10, 20))

gdp_production$Name <- factor(gdp_production$Name, levels = gdp_production$Name[order(gdp_production$Percent)])

# Подготовка данных
gdp_production2 <- gdp_production %>%
  mutate(
    total = sum(Percent),
    pos = cumsum(Percent) - Percent / 2,
    prop = paste0(round(Percent, 1), "%"),
    theta_deg = 360 * (pos / total),
    text_angle = ifelse(theta_deg > 90 & theta_deg < 270, (theta_deg + 180) %% 360, theta_deg)
  )

my_palette <- colorRampPalette(pal_npg("nrc", alpha = 1)(10))(12)

ggplot(gdp_production2, aes(x = 1, y = Percent, fill = `Name`)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  geom_text(aes(x = 1.3, y = pos, label = prop), size = 4.2)+
  coord_polar(theta = "y", direction = 1, clip = "off", start = -pi/2)+
  labs(title = "Валовая добавленная стоимость по отраслям экономики за 2023 г. (цены в трлн czk)",
       fill = "Секторы")+
  scale_fill_manual(values = my_palette)














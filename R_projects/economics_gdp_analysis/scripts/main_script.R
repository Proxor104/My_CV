library(dplyr)
library(tidyverse)

gdp_expenditure <- read.csv("C:/Users/hardk/OneDrive/Рабочий стол/учёба/10 семестр/экономика/1 задание/data/M000111a_2013_2023.csv")
gdp_expenditure_2023 <- gdp_expenditure %>%
  filter(period == "2023")

households <- gdp_expenditure_2023 %>%
  filter((isector == "S14" | isector == "S15") & (transaction == "P3"))
households <- sum(households$value)

goverment <- gdp_expenditure_2023 %>%
  filter((isector == "S13") & (transaction == "P3"))
goverment <- goverment$value

investments <- gdp_expenditure_2023 %>%
  filter(transaction == "P51G+P52+P53")
investments <- investments$value

clear_export <- gdp_expenditure_2023 %>%
  filter(transaction == "B11")
clear_export <- clear_export$value

total <- gdp_expenditure_2023 %>%
  filter(transaction == "B1GQ")
total <- total$value

names <- c("Расходы домашних хозяйств", "Государственные расходы", "Инвестиции", "Чистый экспорт")
values <- c(households, goverment, investments, clear_export)
percents <- values * 100 /total

values_bill <- values / 1000

data <- data.frame(names = names, values = values, percents = percents)

print(total == sum(data$values))


theme_set(theme_minimal(base_family = "Roboto Mono"))

theme_update(plot.background = element_rect(fill = "white", color = "white"), ##fffaf0
             panel.background = element_rect(fill = NA, color = NA),
             panel.border = element_rect(fill = NA, color = NA),
             panel.grid.minor = element_blank(),
             axis.text.y = element_text(size = 10),
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




ggplot(data = data, aes(x = "GDP", y = percents, fill =names)) +
  geom_bar(stat = "identity") +
  labs(title = "ВВП Чехии по использованию, 2023 г.",
       subtitle = "Данные взяты в текущих ценах, а доли отображены в процентах от ВВП.",
       x = "",
       y = "",
       fill = "Категории") +
  scale_fill_manual(values = c("Расходы домашних хозяйств" = "#6461ed", 
                               "Государственные расходы" = "#f75c73", 
                               "Инвестиции" = "#66f75c", 
                               "Чистый экспорт" = "#e05cf7")) +  # Цвета, как на вашем графике
  theme(axis.text.x = element_blank(),  # Убираем подписи оси X
        # axis.text.y = element_blank(),  # Убираем подписи оси Y
        plot.title = element_text(hjust = 0.5)) +  # Центрируем заголовок
  geom_text(aes(label = paste0(round(percents, 2), "%")), 
            position = position_stack(vjust = 0.5),  # Текст внутри сегментов
            size = 5) # Размер и цвет текста











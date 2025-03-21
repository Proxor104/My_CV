library(dplyr)
library(ggplot2)

data <- data.frame(
  x=c("Оплата труда работников", 
      "Чистые налоги на производство \nи импорт", 
      "Валовой операционный профицит \nи смешанный доход",
      "Gross domestic product"),
  y=c(3265699, 579028, 3773801, 7618528))

data <- data %>%
  arrange(desc(y))

total <- data[1,]$y[1]
data <- data[2:nrow(data),]

data <- data %>%
  arrange(y) %>%
  mutate(percent = y * 100 / total)

print(total == sum(data$y))

data$x <- as.character(data$x)

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




ggplot(data = data, aes(x = "GDP", y = percent, fill = x)) +
  geom_bar(stat = "identity", width=1) +
  labs(title = " Структура ВВП по источникам доходов, 2023 г.",
       subtitle = "Цены взяты в чешских кронах, а доли отображены в процентах от ВВП.",
       x = "",
       y = "",
       fill = "") +
  scale_fill_manual(values = c("Чистые налоги на производство \nи импорт" = "#e05cf7",
                               "Оплата труда работников" = "#6461ed",
                               "Валовой операционный профицит \nи смешанный доход" = "#66f75c"))+
  theme(axis.text.x = element_blank(),  # Убираем подписи оси X
        plot.title = element_text(hjust = 0.5)) +  # Центрируем заголовок
  geom_text(aes(label = paste0(round(percent, 2), "%")),
            position = position_stack(vjust = 0.5),  # Текст внутри сегментов
            size = 5) # Размер и цвет текста

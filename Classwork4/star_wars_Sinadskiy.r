#Устанвоить пакеты
install.packages("tidyverse")
#install.packages("dplyr")
library(dplyr)

#Загрузим тестовый набор данных
data(starwars)

#Прочитайте описание массива данных
?starwars

#узнайте количество строк и колонок в наборе с помощью функций nrow и summary
starwars %>% nrow
colnames(starwars)
starwars %>% summary

#С помощью функции distinct выберите уникальные цвета волос
starwars %>% distinct(hair_color)

#Сгруппируйте по цвету волос и посчитайте сколько всего строк каждого цвета
tally(group_by(starwars, hair_color))

#Отсортируйте по убыванию то что получили выше
tally(group_by(starwars, hair_color), sort = TRUE)

#Посчитайте среднюю массу всех представителей
mean(starwars$mass, na.rm=TRUE)  # удаляем пропуски

#Теперь найдите самого высокого, самого низкого
slice_max(starwars, height, n=1)
slice_min(starwars, height, n=1)

#Отфильтруйте их и снова посчитайте среднюю масса
mean(starwars[!(
  starwars$height==slice_max(starwars, height, n=1)$height | 
  starwars$height==slice_min(starwars, height, n=1)$height 
              ),]$mass, na.rm=TRUE)

#Найдите средний рост жителя каждой из планет
summarise_at(
  group_by(starwars, homeworld),
  vars(height), 
  list(mean_height = mean)
            )
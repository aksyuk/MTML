
## Справочник для **winequality-white_for_lab.csv**   

Данные по качеству 4898 белых вин. Задача: спрогнозировать высокое / низкое качество вина. Источник данных: статья *P. Cortez, A. Cerdeira, F. Almeida, T. Matos and J. Reis* [Modeling wine preferences by data mining from physicochemical properties.
In Decision Support Systems, Elsevier, 47(4):547-553, 2009.](http://www3.dsi.uminho.pt/pcortez/wine5.pdf). Набор данных был загружен из репозитория UCI (<https://archive.ics.uci.edu/ml/datasets/wine+quality>) 12.10.2021.    

## Список столбцов файла:   

* `fixed_acidity` – постоянная кислотность;  
* `volatile_acidity` – переменная кислотность;  
* `citric_acid` – содержание лимонной кислоты;  
* `residual_sugar` – остаточный сахар;  
* `chlorides` – содержание хлоридов;  
* `free_sulfur_dioxide` – содержание диоксида серы в свободном виде;  
* `total_sulfur_dioxide` – общее содержание диоксида серы;  
* `density` – плотность;  
* `pH` – кислотность; 
* `sulphates` – содержание сульфатов;  
* `alcohol` – содержание алкоголя;  
* `quality` – балльная оценка качества вина, от 0 до 10;  
* `Y` – целевая переменная: 1 = высокое качество (`quality` > 5), 0 = низкое (`quality` <= 5).   

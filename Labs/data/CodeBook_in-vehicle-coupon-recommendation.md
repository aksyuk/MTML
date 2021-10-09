
## Справочник для **in-vehicle-coupon-recommendation.csv**

Данные по исследованию поведения 12684 водителей. Задача: зная маршрут поездки и некоторые дополнительные сведения, предсказать, возьмёт ли водитель купон в кофейню, предложенный мобильным приложением. Источник данных: статья *Tong Wang*, *Cynthia Rudin*, *Finale Doshi-Velez*, *Yimin Liu*, *Erica Klampfl*, *Perry MacNeille* [A Bayesian Framework for Learning Rule Sets for Interpretable Classification](https://jmlr.org/papers/volume18/16-003/16-003.pdf). Набор данных был загружен из репозитория UCI (<https://archive.ics.uci.edu/ml/datasets/in-vehicle+coupon+recommendation#>) 05.10.2021.    

## Список столбцов файла:   

* `destination` - место назначения, категории: `No Urgent Place` – не срочная поездка, `Home` – дом, `Work` – работа;  
* `passanger` – пассажир(ы), категории: `Alone` – один водитель, `Friend(s)` – с друзьями, `Kid(s)` – с детьми, `Partner` – с партнёром;   
* `weather` – погода, категории: `Sunny` – солнечно, `Rainy` – дождливо, `Snowy` – снегопад;   
* `temperature` – температура по Фаренгейту: 55, 80, 30;  
* `time` – время: `2PM` – 14:00, `10AM` – 10:00, `6PM` – 18:00, `7AM` – 7:00, `10PM` – 22:00;   
* `coupon` – купон: `Restaurant(<$20)` – в ресторан, не более 20 долларов, `Coffee House` – в кофейню, `Carry out & Take away` – еда навынос, `Bar` – в бар, `Restaurant($20-$50)` – в ресторан, от 20 до 50 долларов;   
* `expiration` – срок действия купона: `1d` – один день, `2h` – 2 часа;   
* `gender` – пол (`Female` / `Male`);   
* `age` – возраст: 21, 46, 26, 31, 41, старше 50 (`50plus`), 36, моложе 21 (`below21`);   
* `maritalStatus` – семейное положение: `Unmarried partner` – есть партнёр, неженаты; `Single` – одинок; `Married partner` – есть партнёр, женаты; `Divorced` – в разводе; `Widowed` – вдова/вдовец;   
* `has_Children` – наличие детей: 1 – да, 0 – нет;   
* `education` – образование, 6 категорий: Some college - no degree, Bachelors degree, Associates degree, High School Graduate, Graduate degree (Masters or Doctorate), Some High School;   
* `occupation` – род деятельности, 24 категории: Unemployed, Architecture & Engineering, Student, Education&Training&Library, Healthcare Support, Healthcare Practitioners & Technical, Sales & Related, Management, Arts Design Entertainment Sports & Media, Computer & Mathematical, Life Physical Social Science, Personal Care & Service, Community & Social Services, Office & Administrative Support, Construction & Extraction, Legal, Retired, Installation Maintenance & Repair, Transportation & Material Moving, Business & Financial, Protective Service, Food Preparation & Serving Related, Production Occupations, Building & Grounds Cleaning & Maintenance, Farming Fishing & Forestry;   
* `income` – уровень дохода, долларов: 37500-49999, 62500-74999, 12500-24999, 75000-87499, 50000-62499, 25000-37499, 100000 и выше, 87500-99999, меньше чем 12500;   
* `Bar` – сколько раз в месяц ходит в бар: `never` – никогда, `less1` – менее 1, `1~3` – от 1 до 3 раз, `gt8` – более 8 раз, `nan4~8` – от 4 до 8 раз включительно;  
* `CoffeeHouse` – сколько раз в месяц ходит в кофейню: `never` – никогда, `less1` – менее 1, `1~3` – от 1 до 3 раз, `gt8` – более 8 раз, `nan4~8` – от 4 до 8 раз включительно;  
* `CarryAway` – сколько раз в месяц берёт еду навынос: `never` – никогда, `less1` – менее 1, `1~3` – от 1 до 3 раз, `gt8` – более 8 раз, `nan4~8` – от 4 до 8 раз включительно;  
* `RestaurantLessThan20` – сколько раз в месяц посещает рестораны с чеком до 20 долларов: `never` – никогда, `less1` – менее 1, `1~3` – от 1 до 3 раз, `gt8` – более 8 раз, `nan4~8` – от 4 до 8 раз включительно;  
* `Restaurant20To50` – сколько раз в месяц посещает рестораны с чеком от 20 до 50 долларов: `never` – никогда, `less1` – менее 1, `1~3` – от 1 до 3 раз, `gt8` – более 8 раз, `nan4~8` – от 4 до 8 раз включительно;  
* `toCoupon_GEQ15min` – до ресторана/бара, в который предложен купон, более 15 минут езды (1 – да, 0 – нет);   
* `toCoupon_GEQ25min` – до ресторана/бара, в который предложен купон, более 25 минут езды (1 – да, 0 – нет);   
* `direction_same` – ресторана/бара, в который предложен купон, находится по направлению движения (1 – да, 0 – нет);  
* `direction_opp` – ресторана/бара, в который предложен купон, находится не по направлению движения (1 – да, 0 – нет);  
* `Y` – целевая переменная: купон принят (1 – да, 0 – нет).   
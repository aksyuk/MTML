
# Лекция №1
# Практический пример №1
# Графики для слайдов



# Данные примера 1 -------------------------------------------------------------

# ядро
my.seed <- 1486372882
# write(my.seed, file = 'log.txt', append = T)

# наблюдений всего
n.all <- 60
# доля обучающей выборки
train.percent <- 0.85
# стандартное отклонение случайного шума
res.sd <- 1
# границы изменения X
x.min <- 5
x.max <- 105
# верхняя граница цикла по степеням свободы сплайна
max.df <- 40
# степени свободы моделей 2 и 3
spline.1.df <- 6
spline.2.df <- max.df - 2

# фактические значения x
set.seed(my.seed)
x <- runif(x.min, x.max, n = n.all)

# случайный шум
set.seed(my.seed)
res <- rnorm(mean = 0, sd = res.sd, n = n.all)

# отбираем наблюдения в обучающую выборку
set.seed(my.seed)
inTrain <- sample(seq_along(x), size = train.percent*n.all)

# истинная функция взаимосвязи
# y.func <- function(x) {8 + 3.5*sin((x - 30)/18)}
y.func <- function(x) {4 - 2e-02*x + 5.5e-03*x^2 - 4.9e-05*x^3}

# для графика истинной взаимосвязи
x.line <- seq(x.min, x.max, length = n.all)
y.line <- y.func(x.line)

# фактические значения y (с шумом)
y <- y.func(x) + res

# обучающая выборка
df.train <-  data.frame(x = x[inTrain], y = y[inTrain])



# График данных ----------------------------------------------------------------

drawDataPlot(x.train = x[inTrain], y.train = y[inTrain],
             x.test = x[-inTrain], y.test = y[-inTrain],
             x.line = x.line, y.line = y.line,
             x.lim = c(x.min, x.max), y.lim = c(min(y), max(y)),
             filename.prefix = './plots/lection-01_plot-03')



# Модели -----------------------------------------------------------------------

# модель 1
mod.1 <- lm(y ~ x, data = df.train)

# для расчёта ошибок
y.model.train <- predict(mod.1, data.frame(x = x[inTrain]))
y.model.test <- predict(mod.1, data.frame(x = x[-inTrain]))

# для гладких графиков модели
x.model.plot <- seq(x.min, x.max, length = 250)
y.model.plot <- predict(mod.1, data.frame(x = x.model.plot))

MSE.1 <- drawThreeModelPlots(x.train = x[inTrain], y.train = y[inTrain], 
                             x.test = x[-inTrain], y.test = y[-inTrain],
                             x.model.plot = x.model.plot, y.model.plot = y.model.plot,
                             x.line = x.line, y.line = y.line,
                             y.model.train = y.model.train, y.model.test = y.model.test,
                             legend.model = 'линейный тренд', color.model = 'orange',
                             x.lim = c(x.min, x.max), y.lim = c(min(y), max(y)),
                             filename.prefix = './plots/lection-01_plot-04')

# модель 2
mod.2 <- smooth.spline(df.train$x, df.train$y, df = spline.1.df)

# для расчёта ошибок
y.model.train <- predict(mod.2, data.frame(x = x[inTrain]))$y[, 1]
y.model.test <- predict(mod.2, data.frame(x = x[-inTrain]))$y[, 1]

# для гладких графиков модели
x.model.plot <- seq(x.min, x.max, length = 250)
y.model.plot <- predict(mod.2, data.frame(x = x.model.plot))$y[, 1]

MSE.2 <- drawThreeModelPlots(x.train = x[inTrain], y.train = y[inTrain], 
                             x.test = x[-inTrain], y.test = y[-inTrain],
                             x.model.plot = x.model.plot, y.model.plot = y.model.plot,
                             x.line = x.line, y.line = y.line,
                             y.model.train = y.model.train, y.model.test = y.model.test,
                             legend.model = paste0('сплайн с df=', spline.1.df), color.model = 'cornflowerblue',
                             x.lim = c(x.min, x.max), y.lim = c(min(y), max(y)),
                             filename.prefix = './plots/lection-01_plot-05')

# модель 3
mod.3 <- smooth.spline(df.train$x, df.train$y, df = spline.2.df)

# для расчёта ошибок
y.model.train <- predict(mod.3, data.frame(x = x[inTrain]))$y[, 1]
y.model.test <- predict(mod.3, data.frame(x = x[-inTrain]))$y[, 1]

# для гладких графиков модели
x.model.plot <- seq(x.min, x.max, length = 250)
y.model.plot <- predict(mod.3, data.frame(x = x.model.plot))$y[, 1]

MSE.3 <- drawThreeModelPlots(x.train = x[inTrain], y.train = y[inTrain], 
                             x.test = x[-inTrain], y.test = y[-inTrain],
                             x.model.plot = x.model.plot, y.model.plot = y.model.plot,
                             x.line = x.line, y.line = y.line,
                             y.model.train = y.model.train, y.model.test = y.model.test,
                             legend.model = paste0('сплайн с df=', spline.2.df), color.model = 'forestgreen',
                             x.lim = c(x.min, x.max), y.lim = c(min(y), max(y)),
                             filename.prefix = './plots/lection-01_plot-06')



# Сравнение точности моделей ---------------------------------------------------

png(file = './plots/lection-01_plot-07.png', height = 700, width = 700)

# наблюдения с шумом (обучающая)
plot(df.train$x, df.train$y, col = grey(0.2), pch = 21, bg = grey(0.2),
     xlab = 'X', ylab = 'Y', ylim = c(min(y), max(y)),
     cex = 1.2, cex.lab = 1.5, cex.axis = 1.5)
# наблюдения тестовой выборки
points(x[-inTrain], y[-inTrain], col = 'red', pch = 21, bg = 'red')
# истинная функция
x.line <- seq(x.min, x.max, length = 250)
y.line <- y.func(x.line)
lines(x.line, y.line, lwd = 2, lty = 2)
# модель 1
y.line <- predict(mod.1, data.frame(x = x.line))
lines(x.line, y.line, col = 'orange', lwd = 2)
# модель 2
y.line <- predict(mod.2, data.frame(x = x.line))$y[, 1]
lines(x.line, y.line, col = 'cornflowerblue', lwd = 3)
# модель 3
y.line <- predict(mod.3, data.frame(x = x.line))$y[, 1]
lines(x.line, y.line, col = 'forestgreen', lwd = 2)
# легенда
legend('bottomright', legend = c('линейный тренд', paste0('сплайн с df=', spline.1.df),
                                 paste0('сплайн с df=', spline.2.df)),
       col = c('orange', 'cornflowerblue', 'forestgreen'), 
       lwd = rep(2, 3), lty = rep(1, 3), pch = rep(15, 3),
       cex = 2)

dev.off()

tbl.1 <- calcTableForModel(x.train = x[inTrain], y.train = y[inTrain], 
                           x.test = x[-inTrain], y.test = y[-inTrain], max.df, res.sd)

png(file = './plots/lection-01_plot-08.png', height = 700, width = 700)

plot(x = tbl.1$df, y = tbl.1$err.test, type = 'l', col = 'red', lwd = 2,
     xlab = 'Степени свободы сплайна', ylab = 'MSE',
     ylim = c(min(tbl.1$err.train), max(tbl.1$err.test)),
     cex = 1.2, cex.lab = 1.5, cex.axis = 1.5)
lines(x = tbl.1$df, y = tbl.1$err.train, col = grey(0.3), lwd = 2)
# неустранимая ошибка
abline(h = res.sd, lty = 2, col = grey(0.4), lwd = 2)
# линейная модель
points(x = c(2, 2), y = MSE.1,
       pch = 22, col = 'orange', bg = 'orange', lwd = 2, cex = 2)
# сплайн 1
points(x = rep(spline.1.df, 2), y = MSE.2,
       pch = 22, col = 'cornflowerblue', bg = 'cornflowerblue', lwd = 2, cex = 2)
# сплайн 2
points(x = rep(spline.2.df, 2), y = MSE.3,
       pch = 22, col = 'forestgreen', bg = 'forestgreen', lwd = 2, cex = 2)
# легенда
legend('topright', legend = c('MSE: обучение', 'MSE: тест',
                              expression(paste('Var(', epsilon, ')=1'))),
       col = c(grey(0.2), 'red', grey(0.4)), lwd = rep(2, 3), lty = c(1, 1, 2),
       cex = 2)

dev.off()


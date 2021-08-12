
require('data.table')

drawDataPlot <- function(x.train, y.train, x.test, y.test,
                         x.line, y.line,
                         x.lim = c(min(c(x.train, x.test)), max(c(x.train, x.test))),
                         y.lim = c(min(c(y.train, y.test)), max(c(y.train, y.test))),
                         filename.prefix, pic.height = 700, pic.width = 700){

    # График 0 ---------------------------------------------------------------------
    # точки + истинная функция
    png(file = paste0(filename.prefix, '.png'), height = pic.height, width = pic.width)
    par(mar = c(4, 4, 1, 1))
    
    # наблюдения с шумом (обучающая)
    plot(x.train, y.train, col = grey(0.2), bg = grey(0.2), pch = 21,
         xlab = 'X', ylab = 'Y', 
         xlim = x.lim, ylim = y.lim, 
         cex = 1.2, cex.lab = 1.5, cex.axis = 1.5)
    
    # наблюдения тестовой выборки
    points(x.test, y.test, col = 'red', bg = 'red', pch = 21)
    
    # истинная функция
    lines(x.line, y.line, lwd = 2, lty = 2)
    
    # легенда
    legend('topleft', legend = c('обучение', 'тест', 'f(X)'),
           pch = c(16, 16, NA), 
           col = c(grey(0.2), 'red', 'black'),  
           lty = c(0, 0, 2), lwd = c(1, 1, 2), cex = 1.6)
    
    dev.off()
}

drawThreeModelPlots <- function(x.train, y.train, x.test, y.test, x.line, y.line,
                                x.model.plot, y.model.plot, legend.model, color.model,
                                y.model.train, y.model.test, 
                                x.lim = c(min(c(x.train, x.test)), max(c(x.train, x.test))),
                                y.lim = c(min(c(y.train, y.test)), max(c(y.train, y.test))),
                                filename.prefix, pic.height = 700, pic.width = 700){
    
    # График 1 ---------------------------------------------------------------------
    # первый график: точки + истинная функция + модель
    png(filename = paste0(filename.prefix, '-1.png'), 
        height = pic.height, width = pic.width)
    par(mar = c(4, 4, 1, 1))
    
    # наблюдения с шумом (обучающая)
    plot(x.train, y.train, col = grey(0.2), bg = grey(0.2), pch = 21,
         xlab = 'X', ylab = 'Y', 
         xlim = x.lim, ylim = y.lim, 
         cex = 1.2, cex.lab = 1.5, cex.axis = 1.5)
    
    # наблюдения тестовой выборки
    points(x.test, y.test, col = 'red', bg = 'red', pch = 21)
    
    # истинная функция
    lines(x.line, y.line, lwd = 2, lty = 2)

    # модель
    lines(x.model.plot, y.model.plot, col = color.model, lwd = 4)
    
    # легенда
    legend('topleft', legend = c('обучение', 'тест', 'f(X)', legend.model),
           pch = c(16, 16, NA, NA), 
           col = c(grey(0.2), 'red', 'black', color.model),  
           lty = c(0, 0, 2, 1), lwd = c(1, 1, 2, 4), cex = 1.6)
    
    dev.off()    
    
    # График 2 -----------------------------------------------------------------
    # второй график: MSE на обучающей, наглядно
    png(filename = paste0(filename.prefix, '-2.png'), 
        height = pic.height, width = pic.width)
    par(mar = c(4, 4, 1, 1))
    
    # наблюдения с шумом (обучающая)
    plot(x.train, y.train, col = grey(0.2), bg = grey(0.2), pch = 21,
         xlab = 'X', ylab = 'Y', 
         xlim = x.lim, ylim = y.lim, 
         cex = 1.2, cex.lab = 1.5, cex.axis = 1.5)
    
    # наблюдения тестовой выборки
    points(x.test, y.test, col = 'red', bg = 'red', pch = 21)
    
    # истинная функция
    lines(x.line, y.line, lwd = 2, lty = 2)
    
    # модель
    lines(x.model.plot, y.model.plot, col = color.model, lwd = 4)
    
    # расстояния от фактических значений до модели: обучающая выборка
    segments(x0 = x.train, y0 = y.train,
             x1 = x.train, y1 = y.model.train, col = grey(0.2))
    
    # легенда
    legend('topleft', legend = c('обучение', 'тест', 'f(X)', legend.model),
           pch = c(16, 16, NA, NA), 
           col = c(grey(0.2), 'red', 'black', color.model),  
           lty = c(0, 0, 2, 1), lwd = c(1, 1, 2, 4), cex = 1.6)
    
    dev.off()
    
    # График 3 -----------------------------------------------------------------
    # второй график: MSE на тестовой, наглядно
    png(filename = paste0(filename.prefix, '-3.png'), 
        height = pic.height, width = pic.width)
    par(mar = c(4, 4, 1, 1))
    
    # наблюдения с шумом (обучающая)
    plot(x.train, y.train, col = grey(0.2), bg = grey(0.2), pch = 21,
         xlab = 'X', ylab = 'Y', 
         xlim = x.lim, ylim = y.lim, 
         cex = 1.2, cex.lab = 1.5, cex.axis = 1.5)
    
    # наблюдения тестовой выборки
    points(x.test, y.test, col = 'red', bg = 'red', pch = 21)
    
    # истинная функция
    lines(x.line, y.line, lwd = 2, lty = 2)
    
    # модель
    lines(x.model.plot, y.model.plot, col = color.model, lwd = 4)
    
    # расстояния от фактических значений до модели: тестовая выборка
    segments(x0 = x.test, y0 = y.test,
             x1 = x.test, y1 = y.model.test, col = 'red')
    
    # легенда
    legend('topleft', legend = c('обучение', 'тест', 'f(X)', legend.model),
           pch = c(16, 16, NA, NA), 
           col = c(grey(0.2), 'red', 'black', color.model),  
           lty = c(0, 0, 2, 1), lwd = c(1, 1, 2, 4), cex = 1.6)
    
    dev.off()

    # Считаем ошибки -----------------------------------------------------------
    MSE <- c(sum((y.train - y.model.train)^2) / length(x.train),
             sum((y.test - y.model.test)^2) / length(x.test))
    names(MSE) <- c('train', 'test')
    return(MSE)
}

calcTableForModel <- function(x.train, y.train, x.test, y.test, max.df, res.sd){
    
    tbl <- data.table(df = 2:max.df)
    tbl[, err.train := rep(0, nrow(tbl))]
    tbl[, err.test := rep(0, nrow(tbl))]
    tbl[, bias := rep(0, nrow(tbl))]
    tbl[, var.f := rep(0, nrow(tbl))]
    
    for (i in 2:max.df) {
        mod.i <- smooth.spline(x = x.train, y = y.train, df = i)
        y.hat.train <- predict(mod.i, data.frame(x = x.train))$y[, 1]
        y.hat.test <- predict(mod.i, data.frame(x = x.test))$y[, 1]
        
        tbl[df == i, err.train := sum((y.train - y.hat.train)^2) / length(y.train)]
        tbl[df == i, err.test := sum((y.test - y.hat.test)^2) / length(y.test)]
        
        df.test.est <- data.frame(matrix(rep(0, length(x.test) * length(2:max.df)), 
                                         length(2:max.df), length(x.test)))
        
        for (j in 1:length(x.train)) {
            mod.i.j <- smooth.spline(x = x.train[-j], y = y.train[-j], df = i)
            df.test.est[j, ] <- predict(mod.i.j, data.frame(x = x.test))$y[, 1]
        }
        
        tbl[df == i, var.f := sum(apply(df.test.est, 2, var))]
        tbl[df == i, bias := err.test - var.f - res.sd^2]
    }
    return(tbl)
}

# source: https://stats.stackexchange.com/questions/111421/reproduce-linear-discriminant-analysis-projection-plot

library('ISLR')
library('DiscriMiner')
library('MASS')

my.seed <- 12345
train.percent <- 0.85

set.seed(my.seed)
inTrain <- sample(seq_along(Default$default),
                  nrow(Default)*train.percent)
model.lda <- lda(default ~ balance + income, 
                 data = Default[inTrain, ])

model.lda <- lda(default ~ balance + income, 
                 data = Default[inTrain, ])

x.m <- (model.lda$means[1, ] + model.lda$means[2, ]) / 2

X <- Default[, c('balance', 'income')]
y <- Default$default

# Scatter matrices
B <- betweenCov(variables = X, group = y)
W <- withinCov(variables = X, group = y)

# Center data
Z <- scale(X, scale = FALSE)

# логит для сравнения
model.logit <- glm(y ~ balance + income,
                   data = as.data.frame(cbind(Default$default, Z)), 
                   family = 'binomial')

# граница по логиту при P(X) = 0.5
x.logit <- seq(min(Z[, 1]), max(Z[, 1]), length = 1000)
y.logit <- (-coef(model.logit)[1] - coef(model.logit)['balance'] * x.logit) / coef(model.logit)['income']


# Eigenvectors
ev <- eigen(solve(W) %*% B)$vectors
slope <- -ev[1,1] / ev[2,1]
intercept <- ev[2,1]

# Create projections on 1st discriminant
P <- Z %*% ev[,1] %*% t(ev[,1])

png('./plots/lection-02_plot-07.png', width = 600, height = 600)
plot(Z[y == 'No', 1], 
     Z[y == 'No', 2], 
     col = rgb(0, 0, 0, alpha = 0.5), pch = '·',
     xlim = c(-1000, 2000),
     xlab = 'cent_balance', ylab = 'cent_income')
points(Z[y == 'Yes', 1], 
       Z[y == 'Yes', 2], 
       col = rgb(1, 0, 0, alpha = 0.9), pch = '·', cex = 1.3)

points(P[, 1], P[, 1], col = 'green', pch = '·')

abline(a = intercept, b = slope,
       lwd = 2, col = 'blue')

lines(x.logit, y.logit)

dev.off()

# legend(x = 1500, y = 1.75, pch = c(1, 1, NA), lwd = c(NA, NA, 2), 
#        col = c('black', 'red', 'blue'),
#        legend = c('default = No', 'default = Yes', 'разделяющая прямая'))

# plot(model.lda, type = 'density')


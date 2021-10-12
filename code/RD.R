library(mosaic)

## load the data and subset them into two parties
MPs <- read.csv("../data/MPs.csv")
MPs.labour <- subset(MPs, subset = (party == "labour"))
MPs.tory <- subset(MPs, subset = (party == "tory"))

## two regressions for Labour: negative and positive margin
labour.fit1 <- lm(ln.net ~ margin,
                  data = MPs.labour[MPs.labour$margin < 0, ])
labour.fit2 <- lm(ln.net ~ margin,
                  data = MPs.labour[MPs.labour$margin > 0, ])

## two regressions for Tory: negative and positive margin
tory.fit1 <- lm(ln.net ~ margin, data = MPs.tory[MPs.tory$margin < 0, ])
tory.fit2 <- lm(ln.net ~ margin, data = MPs.tory[MPs.tory$margin > 0, ])

## Labour: range of predictions
y1l.range <- c(min(MPs.labour$margin), 0) # min to 0
y2l.range <- c(0, max(MPs.labour$margin)) # 0 to max

## prediction
y1.labour <- predict(labour.fit1, newdata = data.frame(margin = y1l.range))
y2.labour <- predict(labour.fit2, newdata = data.frame(margin = y2l.range))

## Tory: range of predictions
y1t.range <- c(min(MPs.tory$margin), 0) # min to 0
y2t.range <- c(0, max(MPs.tory$margin)) # 0 to max

## predict outcome
y1.tory <- predict(tory.fit1, newdata = data.frame(margin = y1t.range))
y2.tory <- predict(tory.fit2, newdata = data.frame(margin = y2t.range))

## scatterplot with regression lines for labour
plot(MPs.labour$margin, MPs.labour$ln.net, main = "Labour",
     xlim = c(-0.5, 0.5), ylim = c(6, 18), xlab = "Margin of victory",
     ylab = "log net wealth at death")
abline(v = 0, lty = "dashed")

## add regression lines
lines(y1l.range, y1.labour, col = "blue")
lines(y2l.range, y2.labour, col = "blue")

## scatterplot with regression lines for tory
plot(MPs.tory$margin, MPs.tory$ln.net, main = "Tory", xlim = c(-0.5, 0.5),
     ylim = c(6, 18), xlab = "Margin of victory",
     ylab = "log net wealth at death")
abline(v = 0, lty = "dashed")

## add regression lines
lines(y1t.range, y1.tory, col = "blue")
lines(y2t.range, y2.tory, col = "blue")

## average net wealth for Tory MP
tory.MP <- exp(y2.tory[1])
tory.MP

## average net wealth for Tory non-MP
tory.nonMP <- exp(y1.tory[2])
tory.nonMP

## causal effect in pounds (what is the conclusion here?)
tory.MP - tory.nonMP

## How do we quantify uncertainty in this causal effect? (bootstrap!!)
boot_RD <- function(){
  boot_data <- resample(MPs.tory)
  tory.fit1 <- lm(ln.net ~ margin, data = boot_data[boot_data$margin < 0, ])
  tory.fit2 <- lm(ln.net ~ margin, data = boot_data[boot_data$margin > 0, ])
  networth_diff <- exp(coef(tory.fit2)[1]) - exp(coef(tory.fit1)[1]) 
  networth_diff
}

tory_samp = replicate(1000,boot_RD())
hist(tory_samp)
abline(v=0,col=2,lwd=3)
confint(tory_samp,level=0.95)

## what about a quadratic fit?






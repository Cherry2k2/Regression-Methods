gre_total <- c(140,120,125,130,110,100,95,115,105,90,105)
ugpa <- c(3.2,3.7,3.6,2.9,3.5,3.3,3.0,2.7,3.1,2.8,2.4)
ggpa <- c(4.0,3.9,3.8,3.7,3.6,3.5,3.4,3.3,3.2,3.1,3.0)

data <- data.frame(gre_total=gre_total,ugpa=ugpa)
model <- lm(ggpa ~ gre_total + ugpa, data = data)
summary(model)
p_values = summary(model)$coefficients[, "Pr(>|t|)"]

print("p value of gre_total is")
print(p_values[c("gre_total")])

cat("\n")

print("p value of ugpa is")
print(p_values[c("ugpa")])


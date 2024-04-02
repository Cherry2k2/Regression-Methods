# data
x <- c(23,35,2,28,5,32,23,10,4,26,1,8,13,9,5)
y <- c(486,747,81,581,117,728,445,128,61,476,35,121,266,126,141)
# finding the correlation 
correlation = cor(x,y)
print("Correlation between the dependent variable (songs) and independent variable (months) =")
print(correlation)
# defining model obtained in Excel
model <- function(x) {
  return(-12.88728849 + 21.12638*x )
}

# Plotting the scatter plot of the data
plot(x, y, main = "Scatter Plot",
     xlab = "X", ylab = "Y", pch = 19, col = "blue")

#Fitting the model obtained in Excel to the scatter plot
lines(x, model(x), col = "red")

legend("topleft", legend = c("Data", "Regression Line"),
       col = c("blue", "red"), pch = c(19, NA), lty = c(NA, 1))


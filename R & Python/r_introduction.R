height <- 1.87
mass <- 89
 
imc <- mass/height^2
imc
 
 # list content
ls()
 
 # remove variables
rm(imc)
 
iris
 
find("iris")
 
 # Vector creation --------------------------------------------------------------
fibo <- c(1, 1, 2, 3, 5, 8, 13, 21)
fibo
 
length(fibo)
typeof(fibo)
class(fibo)
 
 
# Vector selection --------------------------------------------------------------
fibo[1]
fibo[6]
fibo[-6]
fibo[6:8]
fibo[c(4:7)]
 
# vector math operations ---------------------------------------------------------
heights <- c(1.84, 1.77, 1.92, 1.80)
mass <- 85
mass/heights^2

# reclycling rule (operating vector with different sizes)
# (repeat the smaller vector concatenating new of its samples for operating)
heights <- c(1.84, 1.77, 1.92, 1.80)
mass <- c(85, -95, 70)
mass/heights^2

# logic operators
set.seed(123)
heights <- rnorm(20, mean = 1.8, sd = 0.1)
mass <- rnorm(20, mean = 80, sd = 10)
cbind(heights, mass)

# binary vector
mass > 82

mass[mass > 82 | heights < 78]

mass > 82 | heights < 78
mass < 82 | heights > 78
!mass > 82 | heights < 78

# True values of vector
mass[mass > 82]

# False values of vector
!mass[mass > 82]


TRUE & TRUE
TRUE & FALSE
FALSE & TRUE
FALSE & FALSE

TRUE | TRUE
TRUE | FALSE
FALSE | TRUE
FALSE | FALSE

as.logical(c(0,0,2,3,4,-5))
as.numeric(c(TRUE, TRUE, FALSE))

# dealing with NA
c('1', '10', -5)
mean(as.numeric(c('1', '10', '-5', '?'))
mean(as.numeric(c('1', '10', '-5', '?')), na.rm = TRUE)

# convert to char
as.character(c(1,2,3))

sd(heights)
var(height)
cor(heights, mass)
sum(heights)
sum(heights^2)
prod(heights)
summary(heights)

plot(mass ~ heights)
hist(mass)
hist(heights)
plot(ecdf(heights))
boxplot(heights)

gender <- sample(c('F', 'M'), size = 20, replace = TRUE)
boxplot(mass ~ gender)

plot(mass ~ heights,
     col = ifelse(gender == 'M', 'red', 'blue'),
     pch = ifelse(gender == 'M', 19, 4))

# get working directory
getwd()

setwd("C:/Users/USER/Desktop/Estudos")

save(heights, mass, imc, file="C:/Users/USER/Desktop/Estudos/r_aula_2.RData")

load('C:/Users/USER/Desktop/Estudos/r_aula_2.RData')

# Install only once
install.packages('tidyverse')

# Every use
library(tidyverse)

# Choose the package in case of ambiguous function name
# In case of no specification the first installed will be the used
# dplyr:: filter()
# stats:: filter()

# Search path installation 
search(tidyverse)

# search name or part name in installed functions
apropos(tidyverse)

# Conditional if structures
type <- 'tour'
gasoline_price <- 5.80
alcohol_price <- 4.30

if (type == 'freight'){
  fuel <- 'diesel'
} else if (type == 'tour'){
  if (alcohol_price/gasoline_price < 0.7){
    fuel <- 'alcohol'
  }
  else {
    fuel <- 'gasoline'
  }
} else {
  print('Invalid type!')
}
  print(fuel)
  
# Fuel selection with user interaction  
 cat('Wich is your vehicle type? [freight/tour]')
 type = readline()
 cat('How much is it the gasoline liter price?')
 gasoline_price = as.double(readline())
 cat('How much is it the alcohol liter price?')
 alcohol_price = as.double(readline())
  
  if (type == 'freight'){
    fuel <- 'diesel'
  } else if (type == 'tour'){
    if (alcohol_price/gasoline_price < 0.7){
      fuel <- 'alcohol'
    }
    else {
      fuel <- 'gasoline'
    }
  } else {
    print('Invalid type!')
  }
  print(fuel)

# Using switch case
  fuel <- 'alcohol'
  distance = 100
  switch(fuel, 
       'diesel' = {
         km_per_liter <- 10
         km_per_liter
       },
       'gasoline' = {
         km_per_liter <- 13
         km_per_liter
       },
       'alcohol' = {
         km_per_liter <- 15
         km_per_liter
       }, {
         NA_real_
       }
       )
distance/km_per_liter

       

# Golden ratio approximation by Fibonacci Sequence
phi_real <- (1 + sqrt(5))/2
x_left <- 1
x_right <- 1
phi_approx <- 1

i <- 1
while(abs(phi_real - phi_approx) > 0.0000001) {
  x_next <- x_left + x_right
  phi_approx <- x_right/x_left
  x_left <- x_right
  x_right <- x_next
  
  i <- i + 1
}

print(i)
phi_approx

abs(phi_real - phi_approx) > 0.0001



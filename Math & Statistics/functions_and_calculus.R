# Square function
square_function <- function(x) {
  y <- x^2
  return(y)
}

# Combine arguments
x_vec <- c(-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5)

# Return from x_vec argument
square_function(x = x_vec)

# Associate to a variable
y <- minha_funcao(x = x_vec)

# Show return in variable y
y

# Function's graph
plot(y ~ x_vec, xlab = 'x', type = 'l')
    ylab = expression(y = f(x))
points(x_vec, y)

# Function's graph
plot(y ~ x_vec, xlab = 'x', type = 'p')
ylab = expression(y = f(x))
points(x_vec, y)

# Function's graph
plot(y ~ x_vec, xlab = 'x', type = 'b')
ylab = expression(y = f(x))
points(x_vec, y)

# Show resultant warnings
warnings()

# Square functions with different theta parameter
fx = function(x, theta) {
  out <- (x - theta)^2
  return(out)
}

# Function with a single non existing continuous value
fx <- function(x) {
  out <- (x^2 - 1)/(x - 1)
  return(out)
}
fx(x = 1)

# Function b
fx <- function(x) {
  out <- - x^2
  return(out)
}

# Function b
f_prime <- function(x) {
  out <- -2*x
  return(out)
}

# Intersection of a and b functions
intercept = (fx(x = 2) - f_prime(x = 2)*2)
slope <- f_prime(x = 2)
c(intercept, slope)

## Data reduction

# y values
y <- c(8,9,14,10,10,15,11,5,4,13)

# Square distance function
fmu <- function(mu, y) {
  out <- sum((y - mu)^2)
  return(out)
}

# Vector of mu
fmu <- Vectorize(fmu, 'mu')
fmu(mu = c(10, 12), y = y)

# 
f_prime <- function(mu, y) {
  out <- -2*sum(y-mu)
  return(out)
}
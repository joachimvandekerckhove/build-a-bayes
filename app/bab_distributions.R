### Likelihoods and marginal likelihoods

## Likelihoods
dpulse <- function(x, v = 0, h = 10.0) {
  h * (x == v)
}

dinterval <- function(x, m, e) {
  if (e <= 0)
    dpulse (x, m)
  else
    dunif (x, m - e/2, m + e/2)
}

dcrud <- function(x, t) {
  if (t > 0)
    dnorm (x, 0, t)
  else
    dpulse (x, 0)
}

dnotch <- function(x, lo, up) {
  0.5 * dunif(x, 0.0, lo) + 0.5 * dunif(x, up, 1.0)
}

dhnorm <- function(x, left = T) {
  if (left)
    dnorm (x, 0, 1) * 2 * (x <= 0)
  else
    dnorm (x, 0, 1) * 2 * (x >= 0)
}


## Marginal likelihoods
dunifnorm <- function(x, lo, hi, si) {
  y = x
  for (i in 1:length(x)) {
    if (lo < hi) {
      y[i] = integrate(function(mu) dunif(mu, lo, hi) * dnorm(x[i], mu, si),
                       lo, hi, subdivisions = 100L,
                       rel.tol = 1e-4,  
                       abs.tol = 1e-4,
                       stop.on.error = TRUE, 
                       keep.xy = FALSE, 
                       aux = NULL)$value
    }
    else
      y[i] = dnorm(x[i], 0, si)
  }
  y
}

dunifbinom <- function(x, N, lo, hi) {
  y = x
  for (i in 1:length(x)) {
    y[i] = integrate(function(theta) dunif(theta, lo, hi) * dbinom(x[i], N, theta),
                     0, 1, subdivisions = 10000L,
                     rel.tol = 1e-4, 
                     abs.tol = 1e-4,
                     stop.on.error = TRUE,
                     keep.xy = FALSE, 
                     aux = NULL)$value
  }
  y
}

dinterbinom <- function(x, N, m, e) {
  dunifbinom(x, N, m - e/2, m + e/2)
}

dinternorm <- function(x, m, e, si) {
  dunifnorm(x, m - e/2, m + e/2, si)
}

dnotchbinom <- function(x, N, lo, up) {
  0.5 * dunifbinom (x, N, 0.0, lo) + 0.5 * dunifbinom (x, N, up, 1.0)
}

dnormnorm <- function(x, mu0, si0, si) {
  si1 = sqrt(si^2 + si0^2)
  dnorm(x, mu0, si1)
}

dtnormnorm <- function(x, mu0, si0, si, left=TRUE) {
  si1 = sqrt(si^2 + si0^2)
  lo  = mu0 - 5.5 * si1
  hi  = mu0 + 5.5 * si1

  y = x
  for (i in 1:length(x)) {
    if (left)
      integrand = function(mu) dnorm(mu, mu0, si0) * 2 * (mu <= 0) * dnorm(x[i], mu, si)
    else
      integrand = function(mu) dnorm(mu, mu0, si0) * 2 * (mu >= 0) * dnorm(x[i], mu, si)
 
    y[i] = integrate(integrand,
                     lo, hi, subdivisions = 100L,
                     rel.tol = 1e-4,          
                     abs.tol = 1e-4,
                     stop.on.error = TRUE, 
                     keep.xy = FALSE, 
                     aux = NULL)$value
  }
  y
}


# Robust Marginal Integration
Alejandra Martinez 2018-04-16

## A marginal integration procedure

This repository contains a <code>R</code> package with the classical and robust marginal integration procedure for estimating the additive components in an additive model, implementing the proposal by Graciela Boente and Alejandra Martinez in

> Boente G. and Martínez A. (2017). Marginal integration M−estimators for additive models. TEST, 26,
231-260.

The package can be install from <code>R</code> by using

<code> install_github("alemermartinez/RMI")
  </code>
  <b> Me gustaria que esto funcione. Yo también necesito el devtools? </b>

The following example corresponds to one of the 4-dimensional simulated samples considered in Boente and Martínez (2017).

Let begin by defining the additive functions and then generating the simulated sample. 

```{r}
library(RMI)

function.g1 <- function(x1) 1/12*x1^3 
function.g2 <- function(x2) sin(-1*x2) 
function.g3 <- function(x3) 1/2*x3^2-3/2
function.g4 <- function(x4) 1/4*exp(x4)-1/24*(exp(3)-exp(-3))

set.seed(140)
n <- 500
x1 <- runif(n,-3,3)
x2 <- runif(n,-3,3)
x3 <- runif(n,-3,3)
x4 <- runif(n,-3,3)
eps <- rnorm(n,0,sd=0.15)
regresion <- function.g1(x1) + function.g2(x2) + function.g3(x3) + function.g4(x4)
yp <- regresion + eps
```

Since this example is a 4-dimensional example, we considered a kernel of order 4 to estimate each additive function. As it is explained in the paper, the bandwidth used for the direction of interest and for the nuisance direction might be different.

In order to obtain these bandwidths, for computing the classical and robust marginal integration estimators, classical K-fold cross-validation procedure and a robust version of the K-fold cross-validation were performed (described in the paper). The following matrix contains the bandwidths obtained for estimating each additive component.

```{r}
htilde <- 2
halpha <- 1.2165
bandw <- matrix(htilde,4,4)
diag(bandw) <- rep(halpha,4)
```

Besides, we need bandwidths to compute a preliminary estimator of the residual scale. By choosing this vector of bandwidths it is expected an average of 5 points in each 4-dimensional neighbourhood.

```{r}
win.sigma <- c(0.93, 0.93, 0.93, 0.93)
```









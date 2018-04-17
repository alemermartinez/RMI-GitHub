# Robust Marginal Integration
Alejandra Martinez 2018-04-16

## A marginal integration procedure

This repository contains an <code>R</code> package with the classical and robust marginal integration procedures for estimating the additive components in an additive model, implementing the proposal of Graciela Boente and Alejandra Martinez in

> Boente G. and Martínez A. (2017). Marginal integration M−estimators for additive models. TEST, 26, 231-260.

The package can be install from <code>R</code> by using

<code> install_github("alemermartinez/RMI")
  </code>
  <b> Me gustaria que esto funcione. Yo también necesito el devtools? </b>

The following example corresponds to one of the 4-dimensional simulated samples considered in the paper.

Let begin by defining the additive functions and then generating the simulated sample. 

```{r}
library(RMI)

function.g1 <- function(x1) 1/12*x1^3 
function.g2 <- function(x2) sin(-1*x2) 
function.g3 <- function(x3) 1/2*x3^2-3/2
function.g4 <- function(x4) 1/4*exp(x4)-1/24*(exp(3)-exp(-3))

set.seed(140)
n <- 500
x1 <- runif(n, -3, 3)
x2 <- runif(n, -3, 3)
x3 <- runif(n, -3, 3)
x4 <- runif(n, -3, 3)
X <- cbind(x1, x2, x3, x4)
eps <- rnorm(n,0,sd=0.15)
regresion <- function.g1(x1) + function.g2(x2) + function.g3(x3) + function.g4(x4)
y <- regresion + eps
```

Since this is a 4-dimensional example, a kernel of order 4 is considered to estimate each additive function. As it is explained in the paper, the bandwidths used for the direction of interest and for the nuisance direction might be different.

In order to obtain these bandwidths, for computing both the classical and robust marginal integration estimators, classical K-fold cross-validation procedure and a robust version of the K-fold cross-validation were performed (described in the paper). The following matrix contains the bandwidths obtained for the robust estimator.

```{r}
htilde <- 2
halpha <- 1.2165
bandw <- matrix(htilde,4,4)
diag(bandw) <- rep(halpha,4)
```

Besides, to compute a preliminary estimator of the residual scale, other bandwidths are needed. By choosing the following vector of bandwidths, an average of 5 points is expected in each 4-dimensional neighbourhood.

```{r}
win.sigma <- c(0.93, 0.93, 0.93, 0.93)
```

Now we use the robust marginal integration procedure to fit an additive model using the Huber loss function (with default tuning constant c=1.345), a linear fit (degree=1) for the estimation procedure at each additive component, a kernel of order 4 (orderkernel=4) and the type of estimation procedure which, in this case, focus the attention on each alpha additive component and not on all of them at a time (type='alpha'):

```{r}
robust.fit <- margint.rob(Xp=X, yp=y, windows=bandw, win.sigma=win.sigma, epsilon=1e-10, 
                         degree=1, type='alpha', orderkernel=4, typePhi='Huber')
```

Finally, we plot the residuals for each additive component, the estimation of the univariate functions and the true curves.









% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RMI-fn.R
\name{kernel4}
\alias{kernel4}
\title{Order 4 kernel}
\usage{
kernel4(x)
}
\arguments{
\item{x}{A real number.}
}
\value{
0 if abs(x) > 1 and ( 15/32 ) * ( 1 - x^2 ) * ( 3 - 7 * x^2 ) otherwise.
}
\description{
A kernel of order 4.
}
\details{
A kernel L is a kernel of order 4 if it integrates 1, the integrals of u^j L(u) are 0 for 1 <= j < 4 (j integer) and the integral of u^4 L(u) is different from 0.
}
\author{
Alejandra Martinez, Matias Salibian-Barrera
}

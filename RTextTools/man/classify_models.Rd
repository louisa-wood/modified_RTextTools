\name{classify_models}
\alias{classify_models}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
makes predictions from a train_models() object.
}
\description{
Uses a trained model from the \code{\link{train_models}} function to classify new data.
}
\usage{
classify_models(container, models, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{container}{
Class of type \code{\link{matrix_container-class}} generated by the \code{\link{create_container}} function.
}
  \item{models}{
List of models to be used for classification generated by \code{\link{train_models}}.
}
  \item{\dots}{
Other parameters to be passed on to \code{\link{classify_model}}.
}
}
\details{
Use the list returned by \code{\link{train_models}} to use multiple models for classification.
}
\author{
Wouter Van Atteveldt <wouter@vanatteveldt.com>, Timothy P. Jurka <tpjurka@ucdavis.edu>
}
\examples{
library(RTextTools)
data(NYTimes)
data <- NYTimes[sample(1:3100,size=100,replace=FALSE),]
matrix <- create_matrix(cbind(data["Title"],data["Subject"]), language="english", 
removeNumbers=TRUE, stemWords=FALSE, weighting=weightTfIdf)
container <- create_container(matrix,data$Topic.Code,trainSize=1:75, testSize=76:100, 
virgin=FALSE)
models <- train_models(container, algorithms=c("SVM"))
results <- classify_models(container, models)
}
\keyword{method}

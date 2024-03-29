\name{summary.analytics_virgin}
\alias{summary.analytics_virgin}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
summarizes the \code{\link{analytics_virgin-class}} class
}
\description{
Returns a summary of the contents within an object of class \code{\link{analytics_virgin-class}}.
}
\usage{
\method{summary}{analytics_virgin}(object, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{
An object of class \code{\link{analytics_virgin-class}} containing the output of the \code{\link{create_analytics}} function.
}
  \item{\dots}{
Additional parameters to be passed onto the summary function.
}
}

\author{
Timothy P. Jurka <tpjurka@ucdavis.edu>
}

\examples{
library(RTextTools)
data(NYTimes)
data <- NYTimes[sample(1:3100,size=100,replace=FALSE),]
matrix <- create_matrix(cbind(data["Title"],data["Subject"]), language="english", 
removeNumbers=TRUE, stemWords=FALSE, weighting=weightTfIdf)
container <- create_container(matrix,data$Topic.Code,trainSize=1:75, testSize=76:100, 
virgin=TRUE)
models <- train_models(container, algorithms=c("SVM"))
results <- classify_models(container, models)
analytics <- create_analytics(container, results)

summary(analytics)
}
\keyword{method}

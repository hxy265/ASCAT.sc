\name{getRefGenome}
\alias{getRefGenome}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
 Load reference genome from FASTA file into memory for GC content calculation
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
getRefGenome(fasta = FASTA, CHRS = paste0("", c(1:22, "X", "Y", "MT")))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{fasta}{
%%     ~~Describe \code{fasta} here~~
}
  \item{CHRS}{
%%     ~~Describe \code{CHRS} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (fasta = FASTA, CHRS = paste0("", c(1:22, "X", "Y",
    "MT")))
{
    dna <- readDNAStringSet(fasta, format = "fasta")
    dna <- lapply(1:length(CHRS), function(x) dna[[x]])
    names(dna) <- CHRS
    return(dna)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

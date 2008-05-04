\name{readPDF}
\alias{readPDF}
\title{Read In a PDF Document}
\description{
  Returns a function which reads in a portable document format (PDF)
  document extracting both its text and its meta data.
}
\usage{
readPDF(PdfinfoOptions = "", PdftotextOptions = "", ...)
}
\arguments{
  \item{PdfinfoOptions}{options passed over to \code{pdfinfo}.}
  \item{PdftotextOptions}{options passed over to \code{pdftotext}.}
  \item{\dots}{arguments for the generator function.}
}
\details{
  Formally this function is a function generator, i.e., it returns a
  function (which reads in a text document) with a well-defined
  signature, but can access passed over arguments (e.g., options to
  \code{pdfinfo} or \code{pdftotext}) via lexical scoping.

  Note that this PDF reader needs both the tools \code{pdftotext} and
  \code{pdfinfo} installed and accessable on your system.
}
\value{
  A \code{function} with the signature \code{elem, language, load, id}:

  \item{elem}{A \code{list} with the two named elements \code{content}
    and \code{uri}. The first element must hold the document to
    be read in, the second element must hold a call to extract this
    document. The call is evaluated upon a request for load on demand.}
  \item{language}{A \code{character} vector giving the text's language.}
  \item{load}{A \code{logical} value indicating whether the document
    corpus should be immediately loaded into memory.}
  \item{id}{A \code{character} vector representing a unique identification
    string for the returned text document.}

  The function returns a \code{PlainTextDocument} representing the text
  and meta data in \code{content}.
}
\seealso{
  Use \code{\link{getReaders}} to list available reader functions.
}
\examples{
f <- system.file("texts", "pdf", "pdfarchiving.pdf", package = "tm")
pdf <- readPDF(PdftotextOptions = "-layout")(elem = list(uri = substitute(file(f))), load = TRUE, language = "en_US", id = "id1")
meta(pdf)
}
\author{Ingo Feinerer}
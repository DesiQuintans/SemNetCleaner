% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/word.check.wrapper.R
\name{word.check.wrapper}
\alias{word.check.wrapper}
\title{A Spell-checking wrapper}
\usage{
word.check.wrapper(
  word,
  dictionary,
  context = NULL,
  part.resp,
  tolerance = 1,
  rem.resp
)
}
\arguments{
\item{word}{Character.
A word to get spell-checked}

\item{dictionary}{A dictionary to look for word in (see examples).
See \code{\link{SemNetDictionaries}}}

\item{context}{Vector.
Defaults to \code{NULL}.
When a word is inside of a vector of words, then the vector
can be input to provide context for whether this word is spelled
correctly with other words. For example, "guinea" is spelled correctly
but will not be in \code{\link[SemNetDictionaries]{animals.dictionary}}. The vector
can be input to determine if "guinea pig" or "guinea fowl" is meant by the
participant. The word that is being checked will appear with "<<" and ">>" around
it in the context of other words (e.g., \code{bat dog fish <<guinea>> pig rat horse})}

\item{part.resp}{Matrix or data frame.
Uncleaned participant response matrix}

\item{tolerance}{Numeric.
The distance tolerance set for automatic spell-correction purposes.
This function uses the function \code{\link[stringdist]{stringdist}}
to compute the \href{https://en.wikipedia.org/wiki/Damerau-Levenshtein_distance}{Damerau-Levenshtein}
(DL) distance, which is used to determine potential best guesses.

Unique words (i.e., \emph{n} = 1) that are within the (distance) tolerance are
automatically output as \code{\link[SemNetCleaner]{best.guess}} responses, which are then passed through
\code{\link[SemNetCleaner]{word.check.wrapper}}. If there is more than one word
that is within or below the distance tolerance, then these will be provided as potential
options.

The recommended and default distance tolerance is \code{tolerance = 1},
which only spell corrects a word if there is only one word with a DL distance of 1.}

\item{rem.resp}{Matrix.
Keeps track of decisions made in the cleaning process}
}
\value{
A list containing:

\item{word}{The spelling corrected word}

\item{dictionary}{The updated dictionary}

\item{check}{A check for whether a word has been added to the dictionary}

\item{rem.resp}{A matrix to remember previous responses for spelling corrections}
}
\description{
A wrapper function to spell-check with menu options
}
\details{
A menu will appear with several options. Here is what is returned with each option:

\itemize{

\item{POTENTIAL RESPONSE}
{If a potential response is selected,
then the input word is replaced with the potential response}

\item{ADD TO DICTIONARY}
{When selected, the input word will be
added to the appendix dictionary (see \code{\link[SemNetDictionaries]{append.dictionary}}).
The input word will be returned}

\item{TYPE MY OWN}
{User will type their own response to replace the input
word. If word is not in dictionary, then user will be prompted for whether
they would like to add the word to their appendix dictionary
(see \code{\link[SemNetDictionaries]{append.dictionary}}).
In all cases, the typed word will be returned}

\item{CONTEXT}
{Provides the response in context of the participant's
other responses. Prints the all participants responses that were given
with the target response}

\item{GOOGLE IT}
{"Googles" the response in question.
A browser will open with the Google search terms: define "RESPONSE"}

\item{BAD RESPONSE}
{When selected, \code{NA} will be returned}

\item{SKIP}
{When selected, input word will be returned}

\item{BAD STRING}
{Unique to continuous strings.
When selected, a vector of \code{NA} the length of the
\code{context} vector will be returned}

\item{CONTEXT}
{Unique to single responses.
Provides the response in context of the participant's
other responses. Prints the all participants responses that were given
with the target response}

}
}
\examples{
if(interactive())
{
    # Response needs to be checked
    word.check.wrapper("gost", SemNetDictionaries::animals.dictionary)
}

}
\author{
Alexander Christensen <alexpaulchristensen@gmail.com>
}

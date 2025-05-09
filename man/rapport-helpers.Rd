% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rapport.R
\name{rapport-helpers}
\alias{rapport-helpers}
\title{\emph{rapport helpers}}
\description{
\code{rapport} package comes with bunch of helper functions that make your template writing and report creation easier, although most of these helpers were migrated to the \code{rapportools} package.
}
\details{
\emph{Export helpers}

\itemize{
    \item \code{\link{rapport.docx}}
    \item \code{\link{rapport.html}}
    \item \code{\link{rapport.odt}}
    \item \code{\link{rapport.pdf}}
    \item \code{\link{rapport.export}}
}

Please load the \code{rapportools} package if you would use any of the below functions in the \code{.GlobalEnv}, or simply add \code{rapportools} to the required packages section in your template file. That latter is a lot cleaner solution.

\emph{General purpose helpers}

\itemize{
    \item \code{\link[rapportools]{adj.rle}}
    \item \code{\link[rapportools]{alike.integer}}
    \item \code{\link[rapportools]{capitalise}}
    \item \code{\link[rapportools]{catn}}
    \item \code{\link[rapportools]{fml}}
    \item \code{\link[rapportools]{is.boolean}}
    \item \code{\link[rapportools]{is.empty}}
    \item \code{\link[rapportools]{is.number}}
    \item \code{\link[rapportools]{is.string}}
    \item \code{\link[rapportools]{is.tabular}}
    \item \code{\link[rapportools]{is.variable}}
    \item \code{\link[rapportools]{messagef}}
    \item \code{\link[rapportools]{pct}}
    \item \code{\link[rapportools]{stopf}}
    \item \code{\link[rapportools]{tocamel}}
    \item \code{\link[rapportools]{trim.space}}
    \item \code{\link[rapportools]{vgsub}}
    \item \code{\link[rapportools]{warningf}}
}

\emph{Summary statistics}

\itemize{
    \item \code{\link[rapportools]{rp.desc}}
    \item \code{\link[rapportools]{rp.freq}}
}

\emph{Univariate descriptive statistics}

\itemize{
    \item \code{\link[rapportools]{rp.iqr}}
    \item \code{\link[rapportools]{rp.max}}
    \item \code{\link[rapportools]{rp.mean}}
    \item \code{\link[rapportools]{rp.median}}
    \item \code{\link[rapportools]{rp.min}}
    \item \code{\link[rapportools]{rp.missing}}
    \item \code{\link[rapportools]{rp.percent}}
    \item \code{\link[rapportools]{rp.range}}
    \item \code{\link[rapportools]{rp.sd}}
    \item \code{\link[rapportools]{rp.se.mean}}
    \item \code{\link[rapportools]{rp.sum}}
    \item \code{\link[rapportools]{rp.valid}}
    \item \code{\link[rapportools]{rp.var}}
}

\emph{Miscelaneous stats helpers}

\itemize{
    \item \code{\link[rapportools]{htest}}
    \item \code{\link[rapportools]{htest.short}}
    \item \code{\link[rapportools]{kurtosis}}
    \item \code{\link[rapportools]{skewness}}
    \item \code{\link[rapportools]{lambda.test}}
    \item \code{\link[rapportools]{rp.outlier}}
}
}

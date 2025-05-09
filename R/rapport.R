#' \emph{rapport}: an R engine for reproducible template generation
#'
#' \emph{rapport} is an R package that facilitates creation of reproducible statistical report templates. Once created, \emph{rapport} templates can be exported to various external formats: \emph{HTML}, \emph{LaTeX}, \emph{PDF}, \emph{ODT}, etc.
#'
#' For detailed introductions please check out our homepage: \url{https://rapporter.github.io/rapport/}.
#'
#' You may use the package-bundled templates with a minimal R knowledge - a quick tutorial is shown in the package demo: \code{demo(rapport, ask = FALSE)}.
#'
#' Apart from R, all you need to know to start writing your own templates is \emph{Pandoc}'s markup syntax, and several \emph{rapport}-specific conventions that allow the reproducible of the template. \emph{rapport} uses \emph{brew}-like tags to support dynamic inline and/or block evaluation of R code. Unlike many other report-writing conventions in R (\emph{Sweave}, \emph{brew}, \emph{knitr}), \emph{rapport} converts generated output to a convenient form via \emph{pander} package and \code{pandoc} as the document converting backend. \emph{rapport} also comes with support for plots: images are automatically saved to temporary file, and image path is returned or redrawn on demand.
#'
#' The output of \code{rapport} command depends on various package-specific options. Please skim through the summary of following options:
#'
#' \itemize{
#'     \item \code{rapport.user}: a (user)name to show in exported report (defaults to \code{"Anonymous"})
#'     \item \code{rapport.file.name}: a general filename of generated images and exported documents without extension. Some helper pseudo-code would be replaced with handy strings while running \code{\link{rapport}} and \code{\link{rapport.export}}:
#'      \itemize{
#'          \item \code{\%t}: unique random character strings based on \code{\link{tempfile}},
#'          \item \code{\%T}: template name in action,
#'          \item \code{\%n}: an auto-increment integer based on similar (plot) file names (see: \code{?evalsOptions}),
#'          \item \code{\%N}: an auto-increment integer based on similar exported document's file name
#'      }
#'     \item \code{rapport.file.path}: a directory where generated images and exported documents would take place.
#'     \item By default \code{\link{rapport}} function saves plots to image files (see the settings in \code{evalsOptions()}) and \code{print} method just shows the path(s) of the generated image(s). If you would like to see the plot(s) when calling \code{\link{rapport}} function from an interactive R console, please set \code{evalsOptions('graph.recordplot')} and the global \code{rapport.graph.replay} option to \code{TRUE} beforehand. In that case all generated plots will be displayed after printing the \code{rapport} object. These options are set to \code{FALSE} by default although we find these settings really handy, as you can resize the images on the fly and export resized images to HTML/ODT/DOCX/PDF etc. If you would even like to save the actual environment of each generated plot (variables, data sets etc.) as an \code{RData} file, please set \code{evalsOptions('graph.env')} to \code{TRUE}.
#'     \item \code{\link{rapport}} also has some options to set formatting style of numbers, characters and dates specified in \code{panderOptions()}
#'     \item the exported graphs can be customised via further \code{panderOptions}
#'}
#' @importFrom rapportools is.variable is.tabular is.string is.boolean is.number pct fml alike.integer trim.space adj.rle catn vgsub tocamel capitalise stopf warningf messagef is.empty name rp.name label rp.label rp.label<- label<-
#' @importFrom yaml as.yaml yaml.load
#' @importFrom stringr str_extract_all
#' @importFrom pander Pandoc.brew evalsOptions panderOptions pander_return Pandoc pandoc.header.return pandoc.image.return pandoc.header p redraw.recordedplot
#' @importFrom grDevices dev.copy dev.list dev.off dev.size
#' @importFrom utils download.file packageDescription tail
#' @seealso \code{pander} package: \url{https://rapporter.github.io/pander/}
"_PACKAGE"


#' \emph{rapport helpers}
#'
#' \code{rapport} package comes with bunch of helper functions that make your template writing and report creation easier, although most of these helpers were migrated to the \code{rapportools} package.
#'
#' \emph{Export helpers}
#'
#' \itemize{
#'     \item \code{\link{rapport.docx}}
#'     \item \code{\link{rapport.html}}
#'     \item \code{\link{rapport.odt}}
#'     \item \code{\link{rapport.pdf}}
#'     \item \code{\link{rapport.export}}
#' }
#'
#' Please load the \code{rapportools} package if you would use any of the below functions in the \code{.GlobalEnv}, or simply add \code{rapportools} to the required packages section in your template file. That latter is a lot cleaner solution.
#'
#' \emph{General purpose helpers}
#'
#' \itemize{
#'     \item \code{\link[rapportools]{adj.rle}}
#'     \item \code{\link[rapportools]{alike.integer}}
#'     \item \code{\link[rapportools]{capitalise}}
#'     \item \code{\link[rapportools]{catn}}
#'     \item \code{\link[rapportools]{fml}}
#'     \item \code{\link[rapportools]{is.boolean}}
#'     \item \code{\link[rapportools]{is.empty}}
#'     \item \code{\link[rapportools]{is.number}}
#'     \item \code{\link[rapportools]{is.string}}
#'     \item \code{\link[rapportools]{is.tabular}}
#'     \item \code{\link[rapportools]{is.variable}}
#'     \item \code{\link[rapportools]{messagef}}
#'     \item \code{\link[rapportools]{pct}}
#'     \item \code{\link[rapportools]{stopf}}
#'     \item \code{\link[rapportools]{tocamel}}
#'     \item \code{\link[rapportools]{trim.space}}
#'     \item \code{\link[rapportools]{vgsub}}
#'     \item \code{\link[rapportools]{warningf}}
#' }
#'
#' \emph{Summary statistics}
#'
#' \itemize{
#'     \item \code{\link[rapportools]{rp.desc}}
#'     \item \code{\link[rapportools]{rp.freq}}
#' }
#'
#' \emph{Univariate descriptive statistics}
#'
#' \itemize{
#'     \item \code{\link[rapportools]{rp.iqr}}
#'     \item \code{\link[rapportools]{rp.max}}
#'     \item \code{\link[rapportools]{rp.mean}}
#'     \item \code{\link[rapportools]{rp.median}}
#'     \item \code{\link[rapportools]{rp.min}}
#'     \item \code{\link[rapportools]{rp.missing}}
#'     \item \code{\link[rapportools]{rp.percent}}
#'     \item \code{\link[rapportools]{rp.range}}
#'     \item \code{\link[rapportools]{rp.sd}}
#'     \item \code{\link[rapportools]{rp.se.mean}}
#'     \item \code{\link[rapportools]{rp.sum}}
#'     \item \code{\link[rapportools]{rp.valid}}
#'     \item \code{\link[rapportools]{rp.var}}
#' }
#'
#' \emph{Miscelaneous stats helpers}
#'
#' \itemize{
#'     \item \code{\link[rapportools]{htest}}
#'     \item \code{\link[rapportools]{htest.short}}
#'     \item \code{\link[rapportools]{kurtosis}}
#'     \item \code{\link[rapportools]{skewness}}
#'     \item \code{\link[rapportools]{lambda.test}}
#'     \item \code{\link[rapportools]{rp.outlier}}
#' }
#' @name rapport-helpers
NULL

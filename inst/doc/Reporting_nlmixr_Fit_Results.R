## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  message   = FALSE,
  echo      = FALSE,
  warning   = FALSE,
  eval      = FALSE,
  collapse  = TRUE,
  comment = "#>"
)




## ---- eval=TRUE, echo=TRUE----------------------------------------------------
library(nlmixr2rpt)
library(onbrand)  

# This will create an example fit object to use in the examples below
fit = fetch_fit_example()

## ---- eval=TRUE, echo=TRUE----------------------------------------------------
obnd_pptx = read_template(
  template = system.file(package="nlmixr2rpt", "templates","nlmixr_obnd_template.pptx"),
  mapping  = system.file(package="nlmixr2rpt", "templates","nlmixr_obnd_template.yaml"))

obnd_docx = read_template(
  template = system.file(package="nlmixr2rpt", "templates","nlmixr_obnd_template.docx"),
  mapping  = system.file(package="nlmixr2rpt", "templates","nlmixr_obnd_template.yaml"))

## ---- eval=FALSE, echo=TRUE---------------------------------------------------
#  
#  obnd_pptx = report_fit(
#    fit     = fit,
#    obnd    = obnd_pptx)
#  
#  obnd_docx = report_fit(
#    fit     = fit,
#    obnd    = obnd_docx)

## ---- eval=FALSE, echo=TRUE---------------------------------------------------
#  save_report(obnd_pptx, "report.pptx")
#  save_report(obnd_docx, "report.docx")

## ---- eval=FALSE, echo=TRUE---------------------------------------------------
#  file.copy(system.file(package="nlmixr2rpt", "templates", "report_fit.yaml"),
#            "my_report.yaml")

## ---- eval=TRUE, message=FALSE------------------------------------------------
fr = template_details(obnd_pptx)
fr$ft

## ---- eval=TRUE, message=FALSE------------------------------------------------
fr = template_details(obnd_docx)
fr$ft

## ----echo=FALSE, comment='', message=TRUE, eval=TRUE--------------------------
fc = readLines(file.path(system.file(package="nlmixr2rpt"), "templates", "report_fit.yaml"))
# Stripping out comments:
fc = fc[!stringr::str_detect(fc, pattern="^\\s*#")]
cat(fc, sep="\n")


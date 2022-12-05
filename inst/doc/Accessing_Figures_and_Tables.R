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

obnd = read_template(
  template = system.file(package="nlmixr2rpt", "templates","nlmixr_obnd_template.docx"),
  mapping  = system.file(package="nlmixr2rpt", "templates","nlmixr_obnd_template.yaml"))

## ---- eval=TRUE, echo=TRUE----------------------------------------------------
fit = fetch_fit_example()

## ---- eval=TRUE, echo=TRUE----------------------------------------------------
rptdetails = yaml_read_fit(
  obnd    = obnd,
  rptyaml = system.file(package="nlmixr2rpt", "examples", "report_fit_test.yaml"),
  fit     = fit)$rptdetails

## ---- eval=TRUE, echo=TRUE, results=FALSE, warning=FALSE, message=FALSE-------

bfres = build_figures(obnd       = obnd,
                      fit        = fit, 
                      rptdetails = rptdetails)

btres = build_tables(obnd        = obnd,
                      fit        = fit, 
                      rptdetails = rptdetails)

## ---- eval=TRUE, echo=TRUE, results=FALSE, warning=FALSE----------------------
fig_path  = bfres$rptfigs$dv_vs_pred$figure[[1]]
fig_title = bfres$rptfigs$dv_vs_pred$title_proc

## ---- eval=FALSE, echo=TRUE, results=FALSE, warning=FALSE---------------------
#  ![`r fig_title`](`r fig_path`){width=80%}

## ---- eval=TRUE, echo=TRUE, results=TRUE,  warning=FALSE----------------------
tab_ft    = btres$rpttabs$pest_table$table$ft[[1]]
tab_title = btres$rpttabs$pest_table$title_proc
tab_ft_knit = flextable::set_caption(tab_ft, caption = tab_title)

tab_ft_knit


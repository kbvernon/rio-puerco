# rio-puerco

<!-- badges: start -->
[![Static Badge](https://img.shields.io/badge/Quarto-Paper-74AADB?style=social&logo=Quarto)](https://quarto.org)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
<!-- badges: end -->

This repository contains code and figures for our paper:

> Kenneth B. Vernon
> [![](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0000-0003-0098-5092),
> Donald A. Shiffler
> [![](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0000-0001-9428-8815),
> and Scott Ortman
> [![](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0000-0003-0709-5287)
> (2025). Migration and Environmental Learning in Interstitial Areas: 
> An Example from the Northern Rio Puerco Valley, New  Mexico. 
> *Open Archaeology*.

**Preprint**: [manuscript.pdf](/manuscript/manuscript.pdf)

**Supplement**:
[exploratory-data-analysis.html](https://kbvernon.github.io/rio-puerco/R/exploratory-data-analysis.html)

## Contents

📂 [\_extensions](/_extensions) has Quarto extension for compiling manuscript\
📂 [data](/data) contains site attribute data\
  ⊢ 💾 [rp-ceramics.csv](/data/rp-sites.csv)\
  ⊢ 💾 [rp-lithics.csv](/data/rp-sites.csv)\
  ⊢ 💾 [rp-sites.csv](/data/rp-sites.csv)\
  ⊢ 💾 [tables.Rdata](/data/tables.Rdata) used in manuscript\
📂 [figures](/figures) contains all figures included in the paper\
📂 [manuscript](/manuscript) contains the pre-print\
  ⊢ 📄 [bibliography.bib](/manuscript/bibliography.bib)\
  ⊢ 📄 [manuscript.qmd](/manuscript/manuscript.qmd)\
  ⊢ 📄 [manuscript.pdf](/manuscript/manuscript.pdf)\
📂 [R](/R) code for preparing data and conducting analysis, including\
  ⊢ 📄 [exploratory-data-analysis.qmd](/R/exploratory-data-analysis.qmd) is the primary
analysis and\
  ⊢ 📄 [get-elevation.R](/R/get-elevation.R) downloads DEMs.\
  ⊢ 📄 [get-places.R](/R/get-places.R) downloads polygons for nearby places.\

## 💾 Data availability

The locations of archaeological sites are sensitive data in the US, so we cannot 
simply share that information here. We do, however, include non-sensitive 
attribute data in the [data](/data) folder. If you would like to get access to 
the spatial data, you will need to get permission from the State Historic 
Preservation Office in New Mexico.

## 📈 Replicate analysis

Assuming you had access to the data in `rio-puerco.gpkg`, you could
re-run all of the data preparation and analysis like this:

``` r
library(here)
library(quarto)

# needs to be run in this order
here("R", "get-elevation.R") |> source()
here("R", "get-places.R") |> source()
here("R", "exploratory-data-analysis.qmd") |> quarto_render()

# if you have a hankerin' to compile the manuscript
# you can do that like so:
here("manuscript", "manuscript.qmd") |> quarto_render()
```

The last bit will open the manuscript in your browser, which you can then print 
to PDF.

## License

**Text and figures:** [CC-BY-4.0](http://creativecommons.org/licenses/by/4.0/)

**Code:** [MIT](LICENSE.md)

**Data:** [CC-BY-4.0](http://creativecommons.org/licenses/by/4.0/).
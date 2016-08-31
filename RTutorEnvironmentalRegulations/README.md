This package constitutes an interactive R problem set based on the RTutor package (https://github.com/skranz/RTutor). 

--- Add **brief** description of content and link to original paper ---

## 1. Installation

RTutor and this package is hosted on Github. To install everything, run the following code in your R console.
```s
if (!require(devtools))
  install.packages("devtools")
source_gist("gist.github.com/skranz/fad6062e5462c9d0efe4")
install.rtutor(update.github=TRUE)

devtools::install_github("msporer/RTutorEnvironmentalRegulations", upgrade_dependencies=FALSE)
```

## 2. Show and work on the problem set
To start the problem set first create a working directory in which files like the data sets and your solution will be stored. Then adapt and run the following code.
```s
library(RTutorEnvironmentalRegulations)

# Adapt your working directory to an existing folder
setwd("C:/problemsets/RTutorEnvironmentalRegulations")
# Adapt your user name
run.ps(user.name="Jon Doe", package="RTutorEnvironmentalRegulations",
       load.sav=TRUE, sample.solution=FALSE)
```
If everything works fine, a browser window should open, in which you can start exploring the problem set.

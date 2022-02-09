# AstroStats
Repository for Angus H Wright's Introduction to Statistics for Astronomers and Physicists Lecture Materials

# Viewing the Lecture Notes 
The lecture notes are provided in viewable-on-github format by clicking on the various "markdown" (.md) files in the main directory (i.e. directly above this description). Note, however, that much of the long-form LaTeX equations are not well-compiled in the github format. For this reason you may prefer to compile the lecture notes on your own machine (see below). 

# Compiling the Lectures 
Additionally, the lectures can be downloaded and compiled into a range of formats using the knit.sh script in the Rmd
folder. The use of the knit.sh script assumes that you have a functional **R** installation with both the rmarkdown and
rmdformats packages installed. **R** can be easily installed via conda. The process for installing packages in **R** is
described in the Lecture 0 section "Installing and Loading Libraries" 
[here](https://github.com/AngusWright/AstroStats/blob/master/IntroductionToStatistics_Section0.md#installing-and-loading-libraries-). 

Available formats are: 

- HTML: produces html notes in the rmdformats::downcute style 
- PDF: produces PDF lecture notes 
- Slidy: produces slides for live-lecturing 
- github: produces the viewable-on-github markdown documents above


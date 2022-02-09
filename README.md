# AstroStats
Repository for Angus H Wright's Introduction to Statistics for Astronomers and Physicists Lecture Materials

# Viewing the Lecture Notes 
The lecture notes are provided in viewable-on-github format by clicking on the various "markdown" (.md) files in the "Md" directory directly above this description. Note, however, that much of the long-form LaTeX equations are not well-compiled in the github format. For this reason you may prefer to compile the lecture notes on your own machine (see below). For convenience, direct links to the Lectures are provided here: 

- [Lecture 0: Course Outline and a Crash Course in R and Python](https://github.com/AngusWright/AstroStats/blob/master/Md/IntroductionToStatistics_Section0.md)
- [Lecture 1a: Data Description and Summarisation](https://github.com/AngusWright/AstroStats/blob/master/Md/IntroductionToStatistics_Section1a.md)
- [Lecture 1b: Data Description, Analysis, and Modelling](https://github.com/AngusWright/AstroStats/blob/master/Md/IntroductionToStatistics_Section1b.md)
- [Lecture 1c: Data Mining Exercise](https://github.com/AngusWright/AstroStats/blob/master/Md/IntroductionToStatistics_Section1c.md)
- [Lecture 2a: Fundamentals of Probability I](https://github.com/AngusWright/AstroStats/blob/master/Md/IntroductionToStatistics_Section2a.md)
- [Lecture 2b: Fundamentals of Probability II](https://github.com/AngusWright/AstroStats/blob/master/Md/IntroductionToStatistics_Section2b.md)
- [Lecture 2c: Probability Distributions](https://github.com/AngusWright/AstroStats/blob/master/Md/IntroductionToStatistics_Section2c.md)
- [Lecture 2d: Random Numbers, Simulation, and Sampling](https://github.com/AngusWright/AstroStats/blob/master/Md/IntroductionToStatistics_Section2d.md)
- [Lecture 3a: Bayesian Statistics](https://github.com/AngusWright/AstroStats/blob/master/Md/IntroductionToStatistics_Section3a.md)
- [Lecture 3b: Priors and Introduction to Posterior Analysis](https://github.com/AngusWright/AstroStats/blob/master/Md/IntroductionToStatistics_Section3b.md)
- [Lecture 3c: Posterior Analysis II](https://github.com/AngusWright/AstroStats/blob/master/Md/IntroductionToStatistics_Section3c.md)
- [Lecture 4a: Significance of Evidence](https://github.com/AngusWright/AstroStats/blob/master/Md/IntroductionToStatistics_Section4a.md)
- [Lecture 4b: Optimisation and Complex Modelling I](https://github.com/AngusWright/AstroStats/blob/master/Md/IntroductionToStatistics_Section4b.md)
- [Lecture 4c: Complex Modelling II and Machine Learning](https://github.com/AngusWright/AstroStats/blob/master/Md/IntroductionToStatistics_Section4c.md)

# Compiling the Lectures 
Additionally, the lectures can be downloaded and compiled into a range of formats using the knit.sh script in the Rmd
folder. The use of the knit.sh script assumes that you have a functional **R** installation with both the rmarkdown and
rmdformats packages installed. **R** can be easily installed via conda. The process for installing packages in **R** is
described in the Lecture 0 section "Installing and Loading Libraries" 
[here](https://github.com/AngusWright/AstroStats/blob/master/Md/IntroductionToStatistics_Section0.md#installing-and-loading-libraries-). 

Available formats are: 

- HTML: produces html notes in the rmdformats::downcute style 
- PDF: produces PDF lecture notes 
- Slidy: produces slides for live-lecturing 
- github: produces the viewable-on-github markdown documents above


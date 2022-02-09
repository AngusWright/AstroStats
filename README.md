# AstroStats
Repository for Angus H Wright's Introduction to Statistics for Astronomers and Physicists Lecture Materials

# Viewing the Lecture Notes 
The lecture notes are provided in viewable-on-github markdown format using the links below or by directly clicking on the
various "markdown" (.md) files in [the Md directory](https://github.com/AngusWright/AstroStats/blob/master/Md) directly
above this description. Note, however, that much of the long-form LaTeX equations are not well-compiled in the github
format. For this reason you may prefer to: 
- view/download the PDF lecture notes on github (see the "View PDFs" subsection below); 
- compile the lecture notes on your own machine (see the "Compiling the lectures" subsection below). 

## Lecture 2d 
Lecture 2d is an interactive data-mining exercise that can really only be used in the **slidy** format. It is designed as a 
choose-your-own-adventure, where choices (in the form of hyperlinks to different slides) take you through different outcomes. 
However, I have not included the Slidy and HTML-Page versions of the lecture notes in the github repository, because
they are large and otherwise just duplicate the information contained in the other formats. For Lecture 2d especially,
though, I have provided the Slidy slides for you to download directly [at this
link](https://ruhr-uni-bochum.sciebo.de/s/hsXiuJ5iaoovyWo). Simply open the html in your browser, and click on the links
to choose your path. Enjoy! 

## View-on-GitHub Markdown Notes 
For convenience, direct links to the view-on-github Lectures are provided here: 

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

## View-on-GitHub PDF Notes 
For cases where the LaTeX has failed to show nicely on GitHub markdown, you may prefer to refer to the PDF versions of the Lectures: 

- [Lecture 0: Course Outline and a Crash Course in R and Python](https://github.com/AngusWright/AstroStats/blob/master/PDF/IntroductionToStatistics_Section0.pdf)
- [Lecture 1a: Data Description and Summarisation](https://github.com/AngusWright/AstroStats/blob/master/PDF/IntroductionToStatistics_Section1a.pdf)
- [Lecture 1b: Data Description, Analysis, and Modelling](https://github.com/AngusWright/AstroStats/blob/master/PDF/IntroductionToStatistics_Section1b.pdf)
- [Lecture 1c: Data Mining Exercise](https://github.com/AngusWright/AstroStats/blob/master/PDF/IntroductionToStatistics_Section1c.pdf)
- [Lecture 2a: Fundamentals of Probability I](https://github.com/AngusWright/AstroStats/blob/master/PDF/IntroductionToStatistics_Section2a.pdf)
- [Lecture 2b: Fundamentals of Probability II](https://github.com/AngusWright/AstroStats/blob/master/PDF/IntroductionToStatistics_Section2b.pdf)
- [Lecture 2c: Probability Distributions](https://github.com/AngusWright/AstroStats/blob/master/PDF/IntroductionToStatistics_Section2c.pdf)
- [Lecture 2d: Random Numbers, Simulation, and Sampling](https://github.com/AngusWright/AstroStats/blob/master/PDF/IntroductionToStatistics_Section2d.pdf)
- [Lecture 3a: Bayesian Statistics](https://github.com/AngusWright/AstroStats/blob/master/PDF/IntroductionToStatistics_Section3a.pdf)
- [Lecture 3b: Priors and Introduction to Posterior Analysis](https://github.com/AngusWright/AstroStats/blob/master/PDF/IntroductionToStatistics_Section3b.pdf)
- [Lecture 3c: Posterior Analysis II](https://github.com/AngusWright/AstroStats/blob/master/PDF/IntroductionToStatistics_Section3c.pdf)
- [Lecture 4a: Significance of Evidence](https://github.com/AngusWright/AstroStats/blob/master/PDF/IntroductionToStatistics_Section4a.pdf)
- [Lecture 4b: Optimisation and Complex Modelling I](https://github.com/AngusWright/AstroStats/blob/master/PDF/IntroductionToStatistics_Section4b.pdf)
- [Lecture 4c: Complex Modelling II and Machine Learning](https://github.com/AngusWright/AstroStats/blob/master/PDF/IntroductionToStatistics_Section4c.pdf)

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


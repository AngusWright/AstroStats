#
# Shell scrip to knit lectures 
#

export PATH=${PATH}:/Applications/RStudio.app/Contents/MacOS/pandoc/

if [ $# -lt 1 ] 
then 
  echo "Error: calling syntax is ./knit_LearningObjectives.sh [fmt]" 
  echo "       Possible choices:"
  echo "       -> fmt:     {html,slidy,pdf,github,all}"
  exit 1 
fi 

#Read the format lists 
fmt_list=$1
style=$2
if [ "$style" == "" ]
then 
  style="downcute"
fi 

if [ "$fmt_list" == "all" ] 
then 
  fmt_list="html pdf slidy github"
fi 

for fmt in $fmt_list
do 

  #Check that the output format is valid {{{
  case $fmt in 
    html)
      echo "Output Format is ${fmt}. Using ${style}!"
      longfmt=rmdformats::${style}
      ;;
    github)
      echo "Output Format is ${fmt}"
      longfmt=rmarkdown::github_document
      args=", output_options = list(html_preview = FALSE, pandoc_args = '--mathjax')"
      ;;
    pdf)
      echo "Output Format is ${fmt}"
      longfmt=${fmt}_document 
      ;;
    slidy)
      echo "Output Format is ${fmt}"
      longfmt=${fmt}_presentation
      ;;
    *) 
      echo "Bad Output Format: ${fmt}"
      exit 1
      ;;
  esac
  #}}}
  
  #Knit the LearningObjectives into the requested Format {{{
  echo "Knitting LearningObjectives to ${longfmt}" 
  R --slave --no-save > render_ring_${fmt}.log 2>&1 <<- END
		library(rmarkdown); 
		rmarkdown::render("LearningObjectives.Rmd","${longfmt}" $args) 
	END
  #}}}

  #Move the output to the relevant place {{{
  case $fmt in 
    html)
      mv LearningObjectives.html ../HTML_page/LearningObjectives_${fmt}.html
      ;;
    github)
      mv LearningObjectives.md ../Md/LearningObjectives.md
      rm -fr ../Md/LearningObjectives_files
      mv LearningObjectives_files ../Md/
      sed -i.bak 's@Images/@../Rmd/Images/@g' ../Md/LearningObjectives.md
      ;;
    pdf)
      mv LearningObjectives.pdf ../PDF/LearningObjectives.pdf
      ;;
    slidy)
      mv LearningObjectives.html ../HTML_slides/LearningObjectives_${fmt}.html
      ;;
    *) 
      echo "Bad Output Format: ${fmt}"
      exit 1
      ;;
  esac
  #}}}

done


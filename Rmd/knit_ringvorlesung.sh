#
# Shell scrip to knit lectures 
#

export PATH=${PATH}:/Applications/RStudio.app/Contents/MacOS/pandoc/

if [ $# -lt 1 ] 
then 
  echo "Error: calling syntax is ./knit_ringvorlesung.sh [fmt]" 
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
  
  #Knit the ringvorlesung into the requested Format {{{
  echo "Knitting Ringvorlesung to ${longfmt}" 
  R --slave --no-save > render_ring_${fmt}.log 2>&1 <<- END
		library(rmarkdown); 
		rmarkdown::render("Ringvorlesung.Rmd","${longfmt}" $args) 
	END
  #}}}

  #Move the output to the relevant place {{{
  case $fmt in 
    html)
      mv Ringvorlesung.html ../HTML_page/Ringvorlesung_${fmt}.html
      ;;
    github)
      mv Ringvorlesung.md ../Md/Ringvorlesung.md
      rm -fr ../Md/Ringvorlesung_files
      mv Ringvorlesung_files ../Md/
      sed -i.bak 's@Images/@../Rmd/Images/@g' ../Md/Ringvorlesung.md
      ;;
    pdf)
      mv Ringvorlesung.pdf ../PDF/Ringvorlesung.pdf
      ;;
    slidy)
      mv Ringvorlesung.html ../HTML_slides/Ringvorlesung_${fmt}.html
      ;;
    *) 
      echo "Bad Output Format: ${fmt}"
      exit 1
      ;;
  esac
  #}}}

done


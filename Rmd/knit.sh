#
# Shell scrip to knit lectures 
#

export PATH=${PATH}:/Applications/RStudio.app/Contents/MacOS/pandoc/

if [ $# -lt 2 ] 
then 
  echo "Error: calling syntax is ./knit.sh [section] [fmt]" 
  echo "       Possible choices:"
  echo "       -> section: {0,1a,1b,...,4c,4d}, [0..4], all"
  echo "       -> fmt:     {html,slidy,pdf,github,all}"
  exit 1 
fi 

#Read the section and format lists 
section_list=$1
fmt_list=$2 
style=$3
if [ "$style" == "" ]
then 
  style="downcute"
fi 

if [ "$section_list" == "all" ] 
then 
  section_list=`echo 0 1{a..c} 2{a..d} 3{a..c} 4{a..c}`
fi 

if [ "$fmt_list" == "all" ] 
then 
  fmt_list="html pdf slidy github"
fi 

for section in $section_list
do 
  for fmt in $fmt_list
  do 

    #Stip out the section and chapter IDs {{{
    section_num=`echo ${section} | sed "s/[[:lower:]]//g"`
    chapter=`echo ${section} | sed "s/[[:digit:]]//g"`
    #}}}

    #Check the Section number is valid {{{ 
    case ${section_num} in 
      [01234])  
        echo "Section is ${section_num}"
        ;;
      *) 
        echo "Bad Section: ${section_num}"
        exit 1
        ;;
    esac
    #}}}
    
    #Check that the chapter number is valid {{{
    if [ ${section_num} == 0 ]
    then 
      case $chapter in 
        "")
          echo "Section 0 correctly specified without chapter"
          ;;
        *) 
          echo "Section 0 has no chapters! Bad Chapter: ${chapter}"
          exit 1
          ;;
      esac
    elif [ ${section_num} == 2 ]
    then 
      case $chapter in 
        [abcd])
          echo "Chapter is $chapter"
          ;;
        *) 
          echo "Bad Chapter: ${chapter}"
          exit 1
          ;;
      esac
    else [ ${section_num} -ne 2 ] 
      case $chapter in 
        [abc])
          echo "Chapter is $chapter"
          ;;
        *) 
          echo "Bad Chapter: ${chapter}"
          exit 1
          ;;
      esac
    fi 
    
    #}}}
    
    #Check that the output format is valid {{{
    case $fmt in 
      html)
        echo "Output Format is ${fmt}. Using ${style}!"
        longfmt=rmdformats::${style}
        ;;
      github)
        echo "Output Format is ${fmt}"
        longfmt=rmarkdown::github_document
        args=", output_options = list(pandoc_args = '--mathjax')"
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
    
    #Knit the requests Section+Chapter into the requested Format {{{
    echo "Knitting Section ${section} to ${longfmt}" 
    R --slave --no-save > render_${section}_${fmt}.log 2>&1 <<- END
			library(rmarkdown); 
			rmarkdown::render("IntroductionToStatistics_Section${section}.Rmd","${longfmt}" $args) 
		END
    #}}}

    #Move the output to the relevant place {{{
    case $fmt in 
      html)
        mv IntroductionToStatistics_Section${section}.html ../HTML_page/IntroductionToStatistics_Section${section}_${fmt}.html
        ;;
      github)
        mv IntroductionToStatistics_Section${section}.md ../Md/IntroductionToStatistics_Section${section}.md
        rm -fr ../Md/IntroductionToStatistics_Section${section}_files
        mv IntroductionToStatistics_Section${section}_files ../Md/
        sed -i.bak 's@Images/@../Rmd/Images/@g' ../Md/IntroductionToStatistics_Section${section}.md
        ;;
      pdf)
        mv IntroductionToStatistics_Section${section}.pdf ../PDF/IntroductionToStatistics_Section${section}.pdf
        ;;
      slidy)
        mv IntroductionToStatistics_Section${section}.html ../HTML_slides/IntroductionToStatistics_Section${section}_${fmt}.html
        ;;
      *) 
        echo "Bad Output Format: ${fmt}"
        exit 1
        ;;
    esac
    #}}}

  done
done


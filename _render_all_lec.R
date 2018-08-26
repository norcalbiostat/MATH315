x <- list.files("lecture", pattern='*.Rmd|*.md', full.names=TRUE)
for(i in 1:length(x)){
  rmarkdown::render(x[i], output_format=c('html_document', 'pdf_document'))
}


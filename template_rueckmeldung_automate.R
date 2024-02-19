library(rmarkdown)
load("processed_data/final_data.RData")

# check which subjects wanted a report
report <- final_data[final_data$mc_rueckmeldung == 1,]
report$done <- ""

# render all markdowns
for (i in 1:length(report$pseudonym)){
  if (report$done[report$pseudonym == report$pseudonym[i]] == "") {
    render("template_rueckmeldung.rmd",output_file = paste0('report.', str_replace_all(report$pseudonym[i], "[^[:alnum:]]", ""), '.html'), encoding = "UTF-8")
    report$done[report$pseudonym == report$pseudonym[i]] <- "x"
  }
}

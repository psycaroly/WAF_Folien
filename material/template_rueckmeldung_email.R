library(mailR)

load(file = "report.RData")

for (i in 1:nrow(report)){
  if (is.na(report$report_mail[i]) == TRUE) {
    report.file <- paste0("report.", report$pseudonym[i], ".html")
  report.recipients <- report$email[i]
send.mail(from = "INSERT EMAILADDRESS, e.g. email@gmail.com",
          to = report.recipients,
          subject = "XXX Studie: Rückmeldung",
          attach.files = report.file,
          body = paste0("<html><p style='font-family:Segoe UI;font-size:10.5pt'>
                        Lieber Studienteilnehmer,
                        <br><br>
                        im Anhang erhalten Sie eine Rückmeldedatei für Ihre Teilnahme an der xxx sTUDIE: Wir haben mit dieser Studie XXX untersucht. Das wäre ohne Ihren Beitrag nicht möglich gewesen, daher an dieser Stelle nochmal ein großes Dankeschön!
                        <br><br>
                        Sollten Sie Fragen haben, melden Sie sich gerne.
                        <br><br>
                        Beste Grüße,
                        <br>
                        Die Studienleitung
                        </p></html>"),
          html = TRUE,
          smtp = list(host.name = "INSERT HOST, e.g. smtp.gmail.com", port = 587,
                      user.name = "INSERT EMAILADDRESS, e.g. email@gmail.com",
                      passwd = "INSERT PASSWORD", ssl = TRUE),
          authenticate = TRUE,
          encoding = "utf-8",
          send = TRUE
          )
writeLines(paste0("Rückmeldungs-Email am ", Sys.time()," gesendet an ", report$email[i]))
report$report_mail[i] <- as.character(Sys.time())
Sys.sleep(2)
}
}

save(report, file = "report.RData")

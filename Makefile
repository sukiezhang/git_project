
final-report.pdf: deps ...
	rm -f current-commit.Rmd && touch current-commit.Rmd
	R -r "rmarkdown::render(\"report.Rmd\", output_format=\"pdf_document\", output_file=\"\final-report.pdf")"
	mkdir -p versioned_reports/
	cp final-report.pdf versioned_reports/`git log -1 | head -n1 | cut -d' ' -f2`.pdf

# Makefile for reproducible analysis
.PHONY: clean
.PHONY: Init

Init: 
	mkdir -p derived_data	
	mkdir -p figure	
	mkdir -p versioned_reports

clean:
	rm -rf derived_data	
	rm -rf figure	
	rm -rf versioned_reports	
	mkdir -p derived_data	
	mkdir -p figure	
	mkdir -p versioned_reports	

final-report.pdf: deps ...
	rm -f current-commit.Rmd && touch current-commit.Rmd
	R -r "rmarkdown::render(\"report.Rmd\", output_format=\"pdf_document\", output_file=\"\final-report.pdf")"
	cp final-report.pdf versioned_reports/`git log -1 | head -n1 | cut -d' ' -f2`.pdf


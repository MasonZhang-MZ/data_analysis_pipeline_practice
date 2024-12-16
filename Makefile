TEXT_FILES=data/isles.txt data/abyss.txt data/last.txt data/sierra.txt
DAT_FILES=results/isles.dat results/abyss.dat results/last.dat results/sierra.dat
FIGURES=results/figure/isles.png results/figure/abyss.png results/figure/last.png results/figure/sierra.png
REPORT=report/count_report.html

all: $(REPORT)

results/%.dat: data/%.txt scripts/wordcount.py
	python scripts/wordcount.py --input_file=$< --output_file=$@

results/figure/%.png: results/%.dat scripts/plotcount.py
	python scripts/plotcount.py --input_file=$< --output_file=$@

$(REPORT): $(FIGURES) report/count_report.qmd
	quarto render report/count_report.qmd

clean:
	rm -f $(DAT_FILES) $(FIGURES) $(REPORT)

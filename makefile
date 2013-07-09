pdf   = Data_S1.pdf
tab   = Data_S1.txt
parse = ./parse.pl

all: $(tab)

$(tab): $(pdf) $(parse)
	pdftotext $< - | sed -e 's/hh code/hh_code/' | $(parse) > $@

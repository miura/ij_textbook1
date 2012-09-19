NAME=CMCIBasicCourse201102Bib

all: $(NAME).pdf

$(NAME).pdf: $(NAME).tex Makefile
	./compile-tex.sh $^

view: $(NAME).pdf
	evince $<

mview: $(NAME).pdf
	open $<

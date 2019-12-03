test-all:
	prove -l t/*/*.t

test-single:
	PERL5LIB=PERL5LIB:lib TEST=1 prove -l t/${YEAR}/${DAY}.t

run: test-single run-oneoff

run-oneoff:
	PERL5LIB=PERL5LIB:lib bin/advent-of-code --input-file input/${YEAR}/${DAY}.txt --year ${YEAR} --day ${DAY} -v

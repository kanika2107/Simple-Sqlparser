sqlparser.tab.c sqlparser.tab.h: sqlparser.y
	bison -d sqlparser.y

lex.yy.c: sqlparser.l sqlparser.tab.h
	flex sqlparser.l

sqlparser: lex.yy.c sqlparser.tab.c sqlparser.tab.h
	g++ sqlparser.tab.c lex.yy.c -lfl -o sqlparser

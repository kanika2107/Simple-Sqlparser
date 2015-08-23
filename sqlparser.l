%{
#include <cstdio>
#include <iostream>
using namespace std;
#define YY_DECL extern "C" int yylex()

#include "sqlparser.tab.h"  // to get the token types that we return
int line_num = 1;
%}
%%
[ \t]           ;
\n             {++line_num;return ENDL;}
SELECT        { return SELECT; }
FROM           { return FROM;}
;              { return END;}
[a-zA-Z0-9]+      {
	// we have to copy because we can't rely on yytext not changing underneath us:
	yylval.sval = strdup(yytext);
	return STRING;
}
.                ;
%%

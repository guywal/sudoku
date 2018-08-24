all: sudoku-console
EXEC = sudoku-console
COMP_FLAG = -ansi -Wall -Wextra -Werror -pedantic-errors
GUROBI_COMP = -I/usr/local/lib/gurobi563/include
GUROBI_LIB = -L/usr/local/lib/gurobi563/lib -lgurobi56


$(EXEC): main.o Parser.o Game.o GameAux.o List.o Stack.o gurobi.o
	gcc main.o Parser.o Game.o GameAux.o List.o Stack.o gurobi.o $(GUROBI_LIB) -o $@

main.o: Parser.c Game.c Parser.h Game.h GameAux.c GameAux.h
	gcc $(COMP_FLAG) -c $*.c

Game.o: List.c List.h GameAux.c GameAux.h 
	gcc $(COMP_FLAG) -c $*.c

GameAux.o: Game.c Game.h List.c List.h Stack.c Stack.h gurobi.c gurobi.h
	gcc $(COMP_FLAG) -c $*.c

Parser.o: Game.c Game.h
	gcc $(COMP_FLAG) -c $*.c

List.o: Game.c Game.h GameAux.c GameAux.h
	gcc $(COMP_FLAG) -c $*.c

Stack.o: Game.c Game.h GameAux.c GameAux.h
	gcc $(COMP_FLAG) -c $*.c

gurobi.o: Game.c Game.h GameAux.c GameAux.h
	gcc $(COMP_FLAG) $(GUROBI_COMP) -c $*.c

clean:
	rm -f main.o Parser.o Game.o GameAux.o List.o Stack.o gurobi.o sudoku-console
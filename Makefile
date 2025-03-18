all:
	as -o mini_interpreteur.o mini_interpreteur.s
	ld -o mini_interpreteur mini_interpreteur.o

run:
	./mini_interpreteur

clean:
	rm -f mini_interpreteur mini_interpreteur.o

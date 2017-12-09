CC=gcc
CFLAGS=-I.

kilo: kilo.c
	$(CC) -o kilo kilo.o -I
CC=gcc
CFLAGS=-Wall -Werror -Wextra -std=c11

all: s21_grep

s21_grep:
	$(CC) $(CFLAGS) s21_grep.c -o s21_grep

clean:
	rm -rf s21_grep
	
rebuild: clean all

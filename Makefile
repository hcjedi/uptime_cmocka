.POSIX:
.SUFFIXES:
CC      = gcc
CFLAGS  = -Wall -Iinclude
LDFLAGS =
LDLIBS  = -lcmocka

symbol_wrap = -Wl,--wrap=uptime

all:
	@echo Please choose a target: main test clean

main: obj/main.o obj/uptime.o obj/proc_uptime.o
	$(CC) $(LDFLAGS) -o main obj/main.o obj/uptime.o obj/proc_uptime.o

test: obj/test_uptime.o obj/uptime.o
	$(CC) $(LDFLAGS) -o test \
		obj/test_uptime.o obj/uptime.o $(symbol_wrap) $(LDLIBS)

clean:
	rm -f obj/* main test

obj/main.o: src/main.c include/uptime.h
	$(CC) -c $(CFLAGS) -o $@ src/main.c

obj/uptime.o: src/uptime.c include/proc_uptime.h include/uptime.h
	$(CC) -c $(CFLAGS) -o $@ src/uptime.c

obj/proc_uptime.o: src/proc_uptime.c include/proc_uptime.h
	$(CC) -c $(CFLAGS) -o $@ src/proc_uptime.c

obj/test_uptime.o: src/test_uptime.c include/uptime.h
	$(CC) -c $(CFLAGS) -o $@ src/test_uptime.c
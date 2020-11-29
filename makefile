F_FLAG := 

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	F_FLAG = elf64
endif
ifeq ($(UNAME_S),Darwin)
	F_FLAG = macho64
endif


## force compilation with -B
exe: objects
				./exe
objects: count_freq.o count_words.o str_length.o
			 gcc -no-pie -m64 count_freq.o count_words.o str_length.o main.c -o exe
count_freq.o: count_freq.asm
			 nasm -f $(F_FLAG) count_freq.asm -o count_freq.o
count_words.o: count_words.asm
			 nasm -f $(F_FLAG) count_words.asm -o count_words.o
str_length.o: str_length.asm
			 nasm -f $(F_FLAG) str_length.asm -o str_length.o

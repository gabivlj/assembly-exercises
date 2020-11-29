## force compilation with -B
exe: objects
				./exe
objects: count_freq.o count_words.o str_length.o
			 gcc -no-pie -m64 count_freq.o count_words.o str_length.o main.c -o exe
count_freq.o: count_freq.asm
			 nasm -felf64 count_freq.asm -o count_freq.o
count_words.o: count_words.asm
			 nasm -felf64 count_words.asm -o count_words.o
str_length.o: str_length.asm
			 nasm -felf64 str_length.asm -o str_length.o

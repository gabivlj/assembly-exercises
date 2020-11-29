## force compilation with -B
exe: objects
				./exe
objects: count_freq.o count_words.o
			 gcc -no-pie -m64 count_freq.o count_words.o main.c -o exe
count_freq.o: count_freq.asm
			 nasm -f macho64 count_freq.asm -o count_freq.o
count_words.o: count_words.asm
			 nasm -f macho64 count_words.asm -o count_words.o

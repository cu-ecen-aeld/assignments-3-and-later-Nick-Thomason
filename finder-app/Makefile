# writter.c file

#CC=${CROSS_COMPILE}gcc
#clean= rm -rf
#all:writer
#	${CC} -g writer.c -o writer

#clean:
#	${clean} *.o writer

all:
	$(CROSS_COMPILE)gcc -g -Wall -c -o writer.o writer.c
	$(CROSS_COMPILE)gcc -g -Wall -I/ writer.o -o writer

clean:
	rm -f *.o writer *.elf *.map

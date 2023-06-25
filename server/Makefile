CC = gcc
CFLAGS = -Wall
LDFLAGS = #-lssl -lcrypto
all: aesdsocket

aesdsocket: aesdsocket.c
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)

clean:
	rm -f aesdsocket
CC := aarch64-none-linux-gnu-gcc
CFLAGS := -Wall -Werror

SRCS := writer.c
OBJS := $(SRCS:.c=.o)
TARGET := writer

.PHONY: all clean

all: $(TARGET)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJS)
	$(CC) -o $@ $^

clean:
	rm -f $(OBJS) $(TARGET)
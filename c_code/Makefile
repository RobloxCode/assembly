CC = gcc
CFLAGS = -Wall -Wextra -O2

TARGET = num_bytes

all: $(TARGET)

$(TARGET): $(TARGET).o
	$(CC) $(TARGET).o -o $(TARGET)

$(TARGET).o: $(TARGET).c
	$(CC) -c $(CFLAGS) $(TARGET).c -o $(TARGET).o

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(TARGET) $(TARGET).o


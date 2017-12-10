CC = gcc
CFLAGS = -Wall -Wextra -pedantic
LDFLAGS = 
OBJFILES = 

kilo: $(TARGET)

$(TARGET): $(OBJFILES)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJFILES) $(LDFLAGS)

clean:
	rm -f $(OBJFILES) $(TARGET) *~

#kilo: kilo.c
#	$(CC) kilo.c -o kilo -Wall -Wextra -pedantic -std=c99
  # compiler flags:
  #  -g    adds debugging information to the executable file
  #  -Wall turns on most, but not all, compiler warnings
 # CFLAGS  = -g -Wall
 # CC = gcc
  # the build target executable:
 # TARGET = kilo

#  all: $(TARGET)

  #$(TARGET): $(TARGET).c
  #	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).c

 # clean:
 # 	$(RM) $(TARGET)

main: kilo.c
gcc -o main kilo.c -I.
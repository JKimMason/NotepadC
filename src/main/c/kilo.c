#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <termios.h>
#include "macrologger.h"

void enableRawMode();
void disableRawMode();

int main() {
	printf("\n");
	printf("Starting: \n");
	LOG_INFO("Starts here\n");
	enableRawMode();

	char c;
	while (read(STDIN_FILENO, &c, 1) == 1 && c != 'q');
	return 0;
}

void enableRawMode(){
	tcgetattr(STDIN_FILENO, &orig_termios);
	atexit(disableRawMode);

	struct termios raw = orig_termios;
	raw.c_lflag &= ~(ECHO);

	tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw);
}

void disableRawMode(){
	tcsetattr(STDIN_FILENO, TCSAFLUSH, &orig_termios);
}
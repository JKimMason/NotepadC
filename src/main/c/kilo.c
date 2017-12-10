#include <unistd.h>
#include <stdio.h>
#include <termios.h>
#include "macrologger.h"

void enableRawMode();

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
	struct termios raw;
	tcgetattr(STDIN_FILENO, &raw);

	raw.c_lflag &= ~(ECHO);

	tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw);
}

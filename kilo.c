#include <unistd.h>
#include <stdio.h>
#include <termios.h>
#include "macrologger.h"

void enableRawMode();

int main() {
	LOG_INFO("Main: no error");
	enableRawMode();

	char c;
	while (read(STDIN_FILENO, &c, 1) == 1);
	return 0;
}

void enableRawMode(){
	LOG_DEBUG("Test");
	struct termios raw;
	tcgetattr(STDIN_FILENO, &raw);

	raw.c_lflag &= ~(ECHO);

	tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw);
}

#include <unistd.h>
#include <termios.h>

void enableRawMode();

int main() {
	enableRawMode();

	char c;
	while (read(STDIN_FILENO, &c, 1) == 1);
	return 0;
}

void enableRawMode(){
	struct terminos raw;
	tcgetattr(STDIN_FILENO, &raw);

	raw.c_lflag &= ~(ECHO);

	tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw);
}

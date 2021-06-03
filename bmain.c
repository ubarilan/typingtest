#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <termios.h>

#define GREEN "\033[32m"
#define RED "\033[31m"
#define RESET "\033[0m"
#define YELLOW "\033[33m" 

int string_length(char *s) {
  if (*s == '\0') // Base condition
    return 0;

  return (1 + string_length(++s));
}

void set_mode(int want_key)
{
	static struct termios old, new;
	if (!want_key) {
		tcsetattr(STDIN_FILENO, TCSANOW, &old);
		return;
	}
 
	tcgetattr(STDIN_FILENO, &old);
	new = old;
	new.c_lflag &= ~(ICANON | ECHO);
	tcsetattr(STDIN_FILENO, TCSANOW, &new);
}

int get_key()
{
	int c = 0;
	struct timeval tv;
	fd_set fs;
	tv.tv_usec = tv.tv_sec = 0;
 
	FD_ZERO(&fs);
	FD_SET(STDIN_FILENO, &fs);
	select(STDIN_FILENO + 1, &fs, 0, 0, &tv);
 
	if (FD_ISSET(STDIN_FILENO, &fs)) {
		c = getchar();
		set_mode(0);
	}
	return c;
}

void printTextToType(char *content) {
	system("clear");
	printf("Text to type: %s\n", content);
	setbuf(stdout, NULL);
}

void printCharArr(char *arr) {
	printf("[ ");
	for(int i = 0; i < string_length(arr); i++) {
		printf("%c ", arr[i]);
	}
	printf("]\n");
}

int cmpCharArrs(char *first, char *second) {
	int firstLen = string_length(first);
	int secondLen = string_length(second);
	if(firstLen + 1 != secondLen) {
        return 0;
	}

	for(int i = 0; i < firstLen; i++) {
		if(first[i] != second[i]) {
            printf("Incorrect: %c, %c", first[i], second[i]);
			return 0;
		}
	}
	
	return 1;
}

void printCharsWithErrors(char *typedChars, char *textToType, int charsTyped) {
	for(int i = 0; i < charsTyped; i++) {
		if(typedChars[i] == textToType[i]) {
			printf(GREEN "%c" RESET, (char)typedChars[i]);
		} else {
			printf(RED "%c" RESET, (char)typedChars[i]);
		}
	}
}

int getYesOrNo() {
	char ans;
    ans = getchar();
    if(ans == 'y' || (int)ans == 10) {
        return 1;
    } else {
        printf("Thank you for playing the game.. See you soon!\n");
        exit(0);
        return 0;
    }
}

void getInp(char *content) {
	int typos = 0;
	printTextToType(content);
	setbuf(stdout, NULL);
	int c;
	char chars_received[255];
	int i = 0;
	for(i = 0; i < 255; i++) {
		set_mode(1);
		while (!(c = get_key())) usleep(10000);
		if(c == 10) {
			break;
		}
		else if(c == 127 && i > 0) {
			printTextToType(content);
			chars_received[i - 1] = '\0';
			i = i - 2;
			
			printCharsWithErrors(chars_received, content, i + 1);
		} else {
			if((char)c == content[i]) {
				printf(GREEN "%c" RESET, (char)c);
			} else {
				printf(RED "%c" RESET, (char)c);
				typos++;
			}
			chars_received[i] = (char)c;
		}
	}

	chars_received[i] = '\0';
	if(i == 0) {
		getInp(content);
	    exit(0);
    }

	printf(RED "\nTypos: " RESET);
	printf(YELLOW "%d\n" RESET, typos);
    int areMatching = cmpCharArrs(chars_received, content);
	if(areMatching == 1) {
		printf(YELLOW "[*] Congragulations! You successfully typed the desired text.\n" RESET);
	} else {
		printf("You were not able to type the desired text, would you like to try again? [y/n]: ");
		int answer;
		answer = getYesOrNo();
        getInp(content);
	}
}

int main() {
	char filename[] = "words.txt";

	FILE *text_file = fopen(filename, "r");
	if (text_file == NULL)
	{
		printf("Could not open text file %s...\n", filename);
		exit(0);
	}
	char ch, filecontent[255];
	int line_number = 0;
	ch = fgetc(text_file);
	while(ch != EOF) {
		filecontent[line_number] = ch;
		ch = fgetc(text_file);
		line_number++;
	}
	filecontent[line_number] = '\0';
	int textl;
	textl = string_length(filecontent);
	if(textl == 0) {
		printf("File %s was empty, please fill it with text to use the program...\n", filename);
		exit(-1);
	}
	printf("Text length: %d\n", textl);
    fclose(text_file);
	printf("Text: %s\n", filecontent);
	sleep(0);
	getInp(filecontent);
}

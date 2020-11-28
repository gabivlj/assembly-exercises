#include <stdio.h>
#include <string.h>
extern int count_max_freq(char *array, char *c);
extern int count_words(char *array);

#define MAX_CHARS 1000

int main()
{
  char str[MAX_CHARS];
  fgets(str, MAX_CHARS, stdin);
  // Delete \n
  str[strlen(str) - 1] = 0;
  char letter = 0;

  // Get max frequent character
  int times = count_max_freq(str, &letter);
  printf("Most frequent character: `%c`. Frequency: %d times\n", letter, times);

  // TODO: More exercises
  printf("Number of words: `%d`\n", count_words(str));
}
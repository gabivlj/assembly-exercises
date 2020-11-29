#include <stdio.h>
#include <string.h>
extern int _count_max_freq(char *array, char *c);
extern int _count_words(char *array);
extern int _str_length(char *array);

#define MAX_CHARS 1000

int main()
{
  char str[MAX_CHARS];
  fgets(str, MAX_CHARS, stdin);
  // Delete \n
  str[strlen(str) - 1] = 0;
  char letter = 0;

  // Get max frequent character
  int times = _count_max_freq(str, &letter);
  printf("Most frequent character: `%c`. Frequency: %d times\n", letter, times);

  // TODO: More exercises
  printf("Number of words: `%d`\n", _count_words(str));

  printf("Number of characters: `%d`\n ", _str_length(str));

}
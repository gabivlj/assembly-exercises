#include <stdio.h>
#include <string.h>

#if __APPLE__
extern int count_max_freq(char *array, char *c);
extern int count_words(char *array);
extern int str_length(char *array);
#endif
#if __linux__
extern int _count_max_freq(char *array, char *c);
extern int _count_words(char *array);
extern int _str_length(char *array);

int count_max_freq(char *array, char *c)
{
  return _count_max_freq(array, c);
}

int count_words(char *array)
{
  return _count_words(array);
}

int str_length(char *array)
{
  return _str_length(array);
}
#endif

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

  printf("Number of words: `%d`\n", _count_words(str));

  printf("Number of characters: `%d`\n ", _str_length(str));
}
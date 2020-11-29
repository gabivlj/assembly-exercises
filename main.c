#include <stdio.h>
#include <string.h>

#if __APPLE__
extern int count_max_freq(char *array, char *c);
extern int count_words(char *array);
#endif
#if __linux__
extern int _count_max_freq(char *array, char *c);
extern int _count_words(char *array);

int count_max_freq(char *array, char *c)
{
  return _count_max_freq(array, c);
}

int count_words(char *array)
{
  return _count_words(array);
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
  int times = count_max_freq(str, &letter);
  printf("Most frequent character: `%c`. Frequency: %d times\n", letter, times);

  // TODO: More exercises
  printf("Number of words: `%d`\n", count_words(str));
}
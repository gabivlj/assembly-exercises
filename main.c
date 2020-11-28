#include <stdio.h>
#include <string.h>
extern int count_max_freq(char *array, char *c);

int main()
{
  char *str = "fdsaldslvcx,vxcmakspoqweoqwpriqewfkdlsmsdvvscmnkvsnmdnvsbaaaaaeeqqqqqqqqqaaaaaaaksdkcm,zx,mczxm ..,z.z.qpqpww1939201-1=sap'```Z.Z..Z.,X]['?";
  char letter = 0;
  printf("result: %d on %c\n", count_max_freq(str, &letter), letter);
}
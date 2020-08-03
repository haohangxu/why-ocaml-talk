#include <stdio.h>
#include <stdlib.h>

int main() {
  FILE* fp;
  char data[100];

  fp = fopen("some_file.txt", "r");

  fread(&data, 1, 100, fp);
  printf("%s\n", data);
}

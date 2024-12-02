`#include <stdio.h>'
`#include <stdlib.h>'

int main(int argc, char** argv){
  int doo[2];
  doo[0] = atoi(argv[1]);
  doo[1] = atoi(argv[2]);
  int res;
dnl
divert(-1)

define(`do', `doo[$1]')

define(`int', `  res = $1;
  printf("%d\n", res);')

divert(1)dnl
  return 0;
}
divert(0)dnl

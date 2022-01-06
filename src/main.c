#include <stdio.h>
#include <stdlib.h>

#include "uptime.h"

int main(void)
{
  char *uptime_str = NULL;

  uptime_str = calc_uptime();
  if (uptime_str == NULL) {
    fprintf(stderr, "Failed to read uptime\n");
    return 1;
  }

  printf("%s\n", uptime_str);
  free(uptime_str);
  return 0;
}
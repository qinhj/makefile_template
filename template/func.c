/* std includes */
#include <stdio.h>
#include <stdlib.h> // need for: system
/* user includes */

int func(int argc, char *argv[], void *data) {
    return system("echo \"hello world\"");
}

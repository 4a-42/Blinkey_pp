// TODO fix vscode include errors
// TODO add cmakelists.txt
// TODO check if I can run clang-tidy as static analysis
#include <msp430.h>

int
main()
{
  WDTCTL = WDTPW | WDTHOLD; // stop watchdog timer

  return 0;
}
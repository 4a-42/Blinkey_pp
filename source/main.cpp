// TODO add cmakelists.txt
// TODO check if I can run clang-tidy as static analysis

#include <msp430.h>

int
main()
{
  WDTCTL = WDTPW | WDTHOLD; // stop watchdog timer
  PM5CTL0 &= ~LOCKLPM5; // Disable the GPIO power-on default high-impedance mode
                        // to activate previously configured port settings
  P1DIR |= 0x01;        // Set P1.0 to output direction

  for (;;) {
    volatile unsigned int i; // volatile to prevent optimization

    P1OUT ^= 0x01; // Toggle P1.0 using exclusive-OR

    i = 10000; // SW Delay
    do
      i--;
    while (i != 0);
  }
}
#include <svdpi.h>


unsigned int alu_dpi_model (unsigned int opa, unsigned int opb, unsigned int op)
{
  switch (op) {
    case 0: return opa + opb;
    case 1: return opa - opb;
    case 2: return opa * opb;
    case 3: return opa / opb;
  default: return 0;
  }
  return 0;
}
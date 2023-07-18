/* Implementation of a 32-bit adder in C.
 *
 * Author: Cooper Harris
 */


#include "sim1.h"



void execute_add(Sim1Data *obj)
{
	int i;
	int carry = 0;
	obj->overflow = 0;
	// the most significant bits from the inputs
	int aMostSig = ((obj->a>>31) & 0x1);
	int bMostSig = ((obj->b>>31) & 0x1);
	// if the msb is 1 the number is negative
	if (aMostSig == 1){
		obj->aNonNeg = 0;
	} else{
		obj->aNonNeg = 1;
	}

	if (bMostSig == 1){
		obj->bNonNeg = 0;
	} else{
		obj->bNonNeg = 1;
	}
	// carryIn is one if its subtraction
	if (obj->isSubtraction == 1){
		carry = 1;
	}
	

	for (i=0; i < 32; i++) {
			// shift right by i and mask with 1
			int a = (obj->a >> i) & 0x1;
			int b = (obj->b >> i) & 0x1;
			// if subtraction negate the current bit
			// if b is 0 it will become 1 but if b is 1
			// it will flip to 0 because of the exclusive or
			if (obj->isSubtraction == 1){
				b = b ^ 1;
			}
			// if a and b are the same the result is 0 and if there is no
			// carry it stays zero. If there is a carry it will show through
			// as long as a ^ b != 1
			int result = (a ^ b) ^ carry;
			// set the new carry to 1 if a & b are 1 or if the
			// old carry and either a or b are 1
			carry = ((a & b) | (carry & a) ^ (carry & b));
			// put the result back in to the sum value if it was 1
			if (result == 1) {
				obj->sum = (0x1 << i) | obj->sum;
			}
		}
	int sumMostSig = ((obj->sum>>31) & 0x1);
	if (sumMostSig == 1){
		obj->sumNonNeg = 0;
	} else{
		obj->sumNonNeg = 1;
	}

	int same = aMostSig & bMostSig;
	if ((same & sumMostSig) != same){
		obj->overflow = 1;
	}
	obj->carryOut = carry;

}


/* Simulates a physical device that performs (signed) addition on
 * a 32-bit input.
 *
 * Author: Cooper Harris
 * 
 * CSc 252 Fall Semester
 */

public class Sim1_ADD
{
	public void execute()
	{	
		sum[0].set(a[0].get() != b[0].get());
		boolean carry = a[0].get() && b[0].get();
		
		for (int i = 1; i < 32; i++) {	
			sum[i].set((a[i].get() != b[i].get()) != carry); //Set the sum value at i to true if a is not equal 
															 //to b and the carry isn't the same value as this result
			
			carry = (a[i].get() && b[i].get() || (carry && a[i].get()) != (carry && b[i].get())); //if a column has two 1's then there is a carry 
		}
		
		carryOut.set(carry); //if there is still a 1 to be carried, carryOut has occurred
		
		boolean same = a[31].get() && b[31].get(); //checking if the final bit of a and b are the same sign
		
		// if first and second are the same sign but the the output is a different sign, overflow occurred
		overflow.set(same && (sum[31].get() != same));
	} 

	// ------ 
	// It should not be necessary to change anything below this line,
	// although I'm not making a formal requirement that you cannot.
	// ------ 

	// inputs
	public RussWire[] a,b;

	// outputs
	public RussWire[] sum;
	public RussWire   carryOut, overflow;

	public Sim1_ADD()
	{
		/* Instructor's Note:
		 *
		 * In Java, to allocate an array of objects, you need two
		 * steps: you first allocate the array (which is full of null
		 * references), and then a loop which allocates a whole bunch
		 * of individual objects (one at a time), and stores those
		 * objects into the slots of the array.
		 */

		a   = new RussWire[32];
		b   = new RussWire[32];
		sum = new RussWire[32];

		for (int i=0; i<32; i++)
		{
			a  [i] = new RussWire();
			b  [i] = new RussWire();
			sum[i] = new RussWire();
		}

		carryOut = new RussWire();
		overflow = new RussWire();
	}
}


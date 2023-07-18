/* Simulates a multi-bit adder
 *
 * Author: Cooper Harris
 * 
 * CSc 252 Fall Semester
 */
public class Sim2_AdderX {
	public void execute() {
		// initial carry in is always 0 
		adders[0].carryIn.set(false);
		adders[0].a.set(a[0].get());
		adders[0].b.set(b[0].get());

		adders[0].execute();

		sum[0].set(adders[0].sum.get());
		
		for (int i = 1; i < adders.length; i++) {
			// set the value in the current adder to the current a and b val
			adders[i].a.set(a[i].get());
			adders[i].b.set(b[i].get());
			adders[i].carryIn.set(adders[i - 1].carryOut.get());
			
			adders[i].execute();
			
			// set the current bit in sum to the result of the adder
			sum[i].set(adders[i].sum.get());
			// set the carry in for the next bit to the carrOut from the current one
			
		}
		carryOut.set(adders[adders.length - 1].carryOut.get());
		
		// checking that the a and b bits are not equal
		xor.a.set(adders[adders.length - 1].a.get());
		xor.b.set(adders[adders.length - 1].b.get());
		
		xor.execute();
		
		// negate the output because we want true if a = b
		not.in.set(xor.out.get());
		not.execute();
		
		
		// produces true when the sum bit is not  equal to a
		xor2.a.set(adders[adders.length - 1].sum.get());
		xor2.b.set(adders[adders.length - 1].a.get());
		
		xor2.execute();
		
		// true when a = b and sum is not equal to a
		and.a.set(not.out.get());
		and.b.set(xor2.out.get());
		
		and.execute();
		// when a and b are not the same overflow is impossible
		// when they are the same overflow occurred if the sum
		// bit has a different sign than a && b
		overflow.set(and.out.get());
	}
	
	// inputs
	public RussWire[] a, b;
	public Sim2_FullAdder[] adders;
	private AND and;
	private XOR xor, xor2;
	private NOT not;
	// outputs
	public RussWire[] sum;
	public RussWire carryOut, overflow;
	
	public Sim2_AdderX(int x) {
		
		a 		= new RussWire[x];
		b 		= new RussWire[x];
		sum 	= new RussWire[x];
		adders 	= new Sim2_FullAdder[x];
		and 	= new AND();
		xor 	= new XOR();
		xor2 	= new XOR();
		not 	= new NOT();
		
		for (int i = 0; i < x; i++) {
			a	[i]   = new RussWire();
			b	[i]   = new RussWire();
			sum	[i]   = new RussWire();
			adders[i] = new Sim2_FullAdder();
		}
		
		carryOut = new RussWire();
		overflow = new RussWire();
		
	}
}

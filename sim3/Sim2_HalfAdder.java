/* Simulates a single bit half adder
 *
 * Author: Cooper Harris
 * 
 * CSc 252 Fall Semester
 */

public class Sim2_HalfAdder {
	public void execute() {
		// when either a or b is 1 the sum is 1. But when neither or both are, the sum is 0
		xor.a.set(a.get());
		xor.b.set(b.get());
		
		xor.execute();
		
		sum.set(xor.out.get());
		
		
		and.a.set(a.get());
		and.b.set(b.get());
		
		and.execute();
		// carry is 1 only if a = b = 1
		carry.set(and.out.get());
		
	}
	
	// inputs
	public RussWire a, b;
	public XOR xor;
	public AND and;
	// outputs
	public RussWire sum, carry;
	
	public Sim2_HalfAdder() {
		a = new RussWire();
		b = new RussWire();
		xor = new XOR();
		and = new AND();
		
		sum = new RussWire();
		carry = new RussWire();
	}
}

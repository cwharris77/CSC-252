/* Simulates a single bit full adder
 *
 * Author: Cooper Harris
 * 
 * CSc 252 Fall Semester
 */

public class Sim2_FullAdder {
public void execute() {
		
		// set the first half adder to the input values from the full adder
		first.a.set(a.get());
		first.b.set(b.get());
		
		first.execute();
		
		// set the second half adder to the carryIn value and the sum
		// of the first half adder
		second.a.set(carryIn.get());
		second.b.set(first.sum.get());
		
		second.execute();
		
		sum.set(second.sum.get());
		
		or.a.set(first.carry.get());
		or.b.set(second.carry.get());
		
		or.execute();
		// the carryOut value is one when a = b = 1 or when the carryIn is one and either a or b is 1
		carryOut.set(or.out.get());

	}
	
	// inputs
	public RussWire a, b, carryIn;
	public OR or;
	// outputs
	public RussWire sum, carryOut;
	
	public Sim2_HalfAdder first, second;
	
	public Sim2_FullAdder() {
		a         = new RussWire();
		b         = new RussWire();
		carryIn   = new RussWire();
		or 		  = new OR();
		sum       = new RussWire();
		carryOut  = new RussWire();
		
		first     = new Sim2_HalfAdder();
		second    = new Sim2_HalfAdder();
	}
}

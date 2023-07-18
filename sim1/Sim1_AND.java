/* Simulates a physical AND gate.
 *
 * Author: Cooper Harris
 * 
 * CSc 252 Fall Semester
 */

public class Sim1_AND {	
	
	public void execute() {
		
		out.set(a.get() && b.get());

	}

	public RussWire a,b;   // inputs
	public RussWire out;   // output

	public Sim1_AND() {
		this.a = new RussWire();
		this.b = new RussWire();
		this.out = new RussWire();
	}
}


/* Simulates a physical NOT gate.
 *
 * Author: Cooper Harris
 * 
 * CSc 252 Fall Semester
 */

public class Sim1_NOT
{
	public void execute()
	{	// negate the input
		if (in.get()) {
			out.set(false);
		} else {
			out.set(true);
		}
	}

	public RussWire in;    // input
	public RussWire out;   // output

	public Sim1_NOT()
	{
		in = new RussWire();
		out = new RussWire();
	}
}


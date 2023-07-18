/* Simulates a physical device that performs 2's complement on a 32-bit input.
 *
 * Author: Cooper Harris
 * 
 * CSc 252 Fall Semester
 */

public class Sim1_2sComplement
{
	public void execute()
	{
		// TODO: fill this in!
		//
		// REMEMBER: You may call execute() on sub-objects here, and
		//           copy values around - but you MUST NOT create
		//           objects while inside this function.
		
		for (int i = 0; i < 32; i++) {
			not[i].in.set(in[i].get());
//			System.out.println(not[i].in.get());
			
			not[i].execute();
//			System.out.println(not[i].out.get());
			
			add.a[i].set(not[i].out.get());
		}
	
		add.execute();
		
		for (int i = 0; i < 32; i++) {
			out[i].set(add.sum[i].get());
		}
	}



	// you shouldn't change these standard variables...
	public RussWire[] in;
	public RussWire[] out;


	// TODO: add some more variables here.  You must create them
	//       during the constructor below.  REMEMBER: You're not
	//       allowed to create any object inside the execute()
	//       method above!
	private Sim1_NOT[] not;
	private Sim1_ADD add;
	
	public Sim1_2sComplement()
	{
		// TODO: this is where you create the objects that
		//       you declared up above.
		in = new RussWire[32];
		out = new RussWire[32];
		
		not = new Sim1_NOT[32];
		add = new Sim1_ADD();
		
		for (int i=0; i<32; i++) {
			in  [i] = new RussWire();
			out [i] = new RussWire();
			not [i] = new Sim1_NOT();
			
			if (i == 0) {
				add.b[i].set(true);
			} else {
				add.b[i].set(false);
			}
		}	
	}
}


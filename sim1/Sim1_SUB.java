/* Simulates a physical device that performs (signed) subtraction on
 * a 32-bit input.
 *
 * Author: Cooper Harris
 * 
 * CSc 252 Fall Semester
 */

public class Sim1_SUB
{
	public void execute()
	{
		for (int i = 0; i < 32; i++) {
			boolean temp = a[i].get();
			add.a[i].set(temp);
			//System.out.println("a[i] " + a[i].get());
			
			comp.in[i].set(b[i].get());
			//System.out.println("comp.in[i] " + comp.in[i].get());
		}
		
		comp.execute();
//		for (int i = 0; i < 32; i++) {
//			int temp = 1;
//			if (comp.out[i].get() == false) {
//				temp = 0;
//			}
//			System.out.print(temp);
//		}
//		System.out.println("\n");
		
		for (int i = 0; i < 32; i++) {
			add.b[i].set(comp.out[i].get());
		}
		
		add.execute();
		
		for (int i = 0; i < 32; i++) {
			sum[i].set(add.sum[i].get());
		}
	}



	// --------------------
	// Don't change the following standard variables...
	// --------------------

	// inputs
	public RussWire[] a,b;

	// output
	public RussWire[] sum;

	// --------------------
	// But you should add some *MORE* variables here.
	// --------------------
	// TODO: fill this in
	private Sim1_2sComplement comp;
	private Sim1_ADD          add;



	public Sim1_SUB()
	{
		// TODO: fill this in!
		a   = new RussWire[32];
		b   = new RussWire[32];
		sum = new RussWire[32];
		add = new Sim1_ADD();
		comp = new Sim1_2sComplement();
		
		for (int i = 0; i < 32; i++) {
			a    [i] = new RussWire();
			b    [i] = new RussWire();
			sum  [i] = new RussWire();
		}
	}
}


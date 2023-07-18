
public class Tester {
	public static void main(String[] args) {
	
		Sim1_AND and = new Sim1_AND();
		Sim1_OR or = new Sim1_OR();
		Sim1_NOT not = new Sim1_NOT();
		Sim1_XOR xor = new Sim1_XOR();
		
		and.a.set(false);
		and.b.set(false);
		
		or.a.set(true);
		or.b.set(false);
		
		not.in.set(false);
		
		xor.a.set(false);
		xor.b.set(false);
		
		
//		and.execute();
//		or.execute();
//		not.execute();
//		xor.execute();
		
		Sim1_2sComplement comp = new Sim1_2sComplement();
		
		comp.in[ 0].set(false);
		comp.in[ 1].set(false);
		comp.in[ 2].set(false);
		comp.in[ 3].set(false);
		comp.in[ 4].set(false);
		comp.in[ 5].set(false);
		comp.in[ 6].set(false);
		comp.in[ 7].set(false);
		comp.in[ 8].set(false);
		comp.in[ 9].set(false);
		comp.in[10].set(false);
		comp.in[11].set(false);
		comp.in[12].set(false);
		comp.in[13].set(false);
		comp.in[14].set(false);
		comp.in[15].set(false);
		comp.in[16].set(false);
		comp.in[17].set(false);
		comp.in[18].set(false);
		comp.in[19].set(false);
		comp.in[20].set(false);
		comp.in[21].set(false);
		comp.in[22].set(false);
		comp.in[23].set(false);
		comp.in[24].set(false);
		comp.in[25].set(false);
		comp.in[26].set(false);
		comp.in[27].set(false);
		comp.in[28].set(false);
		comp.in[29].set(false);
		comp.in[30].set(false);
		comp.in[31].set(false);

		comp.execute();
		
		for (int i = 0; i < 32; i++) {
			int temp = 1;
			if (comp.in[i].get() == false) {
				temp = 0;
			}
			System.out.print(temp);
		}
		System.out.println(" --> ");
		
		for (int i = 0; i < 32; i++) {
			int temp = 1;
			if (comp.out[i].get() == false) {
				temp = 0;
			}
			System.out.print(temp);
		}
	}
	
	
}

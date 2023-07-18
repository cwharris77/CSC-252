
public class Test_FullAdder5 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Sim2_FullAdder fa = new Sim2_FullAdder();
		fa.a.set(false);
		fa.b.set(true);
		fa.carryIn.set(true);
		fa.execute();
		System.out.println(fa.sum.get());
		System.out.println(fa.carryOut.get());
	}

}

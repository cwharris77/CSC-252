
public class Test_HalfAdder3 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Sim2_HalfAdder ha = new Sim2_HalfAdder();
		ha.a.set(true);
		ha.b.set(true);
		ha.execute();
		System.out.println(ha.sum.get());
		System.out.println(ha.carry.get());
	}

}

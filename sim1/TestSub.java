
public class TestSub {
	/* Testcase for 252 Sim 1.
	 *
	 * Author: Russ Lewis
	 */
	
		public static void main(String[] args)
		{
			Sim1_SUB p = new Sim1_SUB();
			Sim1_SUB sub2 = new Sim1_SUB();
			
			p.a[ 0].set(false);
			p.a[ 1].set(false);
			p.a[ 2].set(false);
			p.a[ 3].set(true);
			p.a[ 4].set(true);
			p.a[ 5].set(true);
			p.a[ 6].set(false);
			p.a[ 7].set(false);
			p.a[ 8].set(false);
			p.a[ 9].set(false);
			p.a[10].set(false);
			p.a[11].set(false);
			p.a[12].set(false);
			p.a[13].set(false);
			p.a[14].set(false);
			p.a[15].set(false);
			p.a[16].set(false);
			p.a[17].set(false);
			p.a[18].set(false);
			p.a[19].set(false);
			p.a[20].set(false);
			p.a[21].set(false);
			p.a[22].set(false);
			p.a[23].set(false);
			p.a[24].set(false);
			p.a[25].set(false);
			p.a[26].set(false);
			p.a[27].set(false);
			p.a[28].set(false);
			p.a[29].set(false);
			p.a[30].set(false);
			p.a[31].set(false);

			p.b[ 0].set(true);
			p.b[ 1].set(true);
			p.b[ 2].set(true);
			p.b[ 3].set(false);
			p.b[ 4].set(false);
			p.b[ 5].set(false);
			p.b[ 6].set(false);
			p.b[ 7].set(false);
			p.b[ 8].set(false);
			p.b[ 9].set(false);
			p.b[10].set(false);
			p.b[11].set(false);
			p.b[12].set(false);
			p.b[13].set(false);
			p.b[14].set(false);
			p.b[15].set(false);
			p.b[16].set(false);
			p.b[17].set(false);
			p.b[18].set(false);
			p.b[19].set(false);
			p.b[20].set(false);
			p.b[21].set(false);
			p.b[22].set(false);
			p.b[23].set(false);
			p.b[24].set(false);
			p.b[25].set(false);
			p.b[26].set(false);
			p.b[27].set(false);
			p.b[28].set(false);
			p.b[29].set(false);
			p.b[30].set(false);
			p.b[31].set(false);
			
			p.execute();
			
			System.out.println("56 - 7");
			System.out.printf("   ");
			print_bits(p.a);
			System.out.print("\n");

			System.out.printf("+  ");
			print_bits(p.b);
			System.out.printf("\n");

			System.out.printf("-----------------------------------\n");

			System.out.printf("   ");
			print_bits(p.sum);
			System.out.printf("\n");

			
			System.out.printf("\n");
			
			// 2nd Test
//			sub2.a[ 0].set(true);
//			sub2.a[ 1].set(true);
//			sub2.a[ 2].set(true);
//			sub2.a[ 3].set(true);
//			sub2.a[ 4].set(false);
//			sub2.a[ 5].set(false);
//			sub2.a[ 6].set(true);
//			sub2.a[ 7].set(true);
//			sub2.a[ 8].set(true);
//			sub2.a[ 9].set(false);
//			sub2.a[10].set(true);
//			sub2.a[11].set(false);
//			sub2.a[12].set(false);
//			sub2.a[13].set(false);
//			sub2.a[14].set(false);
//			sub2.a[15].set(false);
//			sub2.a[16].set(true);
//			sub2.a[17].set(false);
//			sub2.a[18].set(false);
//			sub2.a[19].set(true);
//			sub2.a[20].set(false);
//			sub2.a[21].set(false);
//			sub2.a[22].set(false);
//			sub2.a[23].set(false);
//			sub2.a[24].set(false);
//			sub2.a[25].set(false);
//			sub2.a[26].set(false);
//			sub2.a[27].set(false);
//			sub2.a[28].set(false);
//			sub2.a[29].set(false);
//			sub2.a[30].set(false);
//			sub2.a[31].set(true);
//
//			sub2.b[ 0].set(false);
//			sub2.b[ 1].set(false);
//			sub2.b[ 2].set(true);
//			sub2.b[ 3].set(true);
//			sub2.b[ 4].set(false);
//			sub2.b[ 5].set(true);
//			sub2.b[ 6].set(false);
//			sub2.b[ 7].set(true);
//			sub2.b[ 8].set(false);
//			sub2.b[ 9].set(false);
//			sub2.b[10].set(false);
//			sub2.b[11].set(true);
//			sub2.b[12].set(false);
//			sub2.b[13].set(true);
//			sub2.b[14].set(false);
//			sub2.b[15].set(false);
//			sub2.b[16].set(false);
//			sub2.b[17].set(true);
//			sub2.b[18].set(false);
//			sub2.b[19].set(true);
//			sub2.b[20].set(false);
//			sub2.b[21].set(false);
//			sub2.b[22].set(false);
//			sub2.b[23].set(true);
//			sub2.b[24].set(false);
//			sub2.b[25].set(false);
//			sub2.b[26].set(false);
//			sub2.b[27].set(false);
//			sub2.b[28].set(false);
//			sub2.b[29].set(true);
//			sub2.b[30].set(false);
//			sub2.b[31].set(false);
//
//			sub2.execute();
//
//			System.out.printf("  ");
//			print_bits(sub2.a);
//			System.out.print("\n");
//
//			System.out.printf("+ ");
//			print_bits(sub2.b);
//			System.out.printf("\n");
//
//			System.out.printf("----------------------------------\n");
//
//			System.out.printf("  ");
//			print_bits(sub2.sum);
//			System.out.printf("\n");
//
//
//			System.out.printf("\n");
		}

		public static void print_bits(RussWire[] bits)
		{
			for (int i=31; i>=0; i--)
			{
				if (bits[i].get())
					System.out.print("1");
				else
					System.out.print("0");
			}
		}

		public static char bit(boolean b)
		{
			if (b)
				return '1';
			else
				return '0';
		}
	}

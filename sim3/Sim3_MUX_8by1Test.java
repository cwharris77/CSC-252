/**
 * Testcases for Sim3
 * 
 * @author Adrian Moore
 * setRussWireArray by Mochi#7459
 */

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class Sim3_MUX_8by1Test {

	@Test
	// tests each possible combo of control bits on the specified input
	void testMuxIndividual() {
		String input = "00000010";
		testEachControl(input);
	}

	@Test
	// the last input that get printed to console is the one that failed the test,
	// can copy paste it into testMuxIndividual to debug it specifically
	void testMuxExhaustive() {
		for (int inputNum = 0; inputNum < 256; inputNum++) {
			String inputStr = Integer.toBinaryString(inputNum);
			while (inputStr.length() < 8)
				inputStr = '0' + inputStr;
			System.out.println(inputStr);
			testEachControl(inputStr);
		}
	}

	void testEachControl(String inputStr) {
		Sim3_MUX_8by1 mux = new Sim3_MUX_8by1();
		setRussWireArray(mux.in, inputStr);
		setRussWireArray(mux.control, "000");
		mux.execute();
		assertEquals(mux.out.get(), mux.in[0].get());

		mux = new Sim3_MUX_8by1();
		setRussWireArray(mux.in, inputStr);
		setRussWireArray(mux.control, "001");
		mux.execute();
		assertEquals(mux.out.get(), mux.in[1].get());

		mux = new Sim3_MUX_8by1();
		setRussWireArray(mux.in, inputStr);
		setRussWireArray(mux.control, "010");
		mux.execute();
		assertEquals(mux.out.get(), mux.in[2].get());

		mux = new Sim3_MUX_8by1();
		setRussWireArray(mux.in, inputStr);
		setRussWireArray(mux.control, "011");
		mux.execute();
		assertEquals(mux.out.get(), mux.in[3].get());

		mux = new Sim3_MUX_8by1();
		setRussWireArray(mux.in, inputStr);
		setRussWireArray(mux.control, "100");
		mux.execute();
		assertEquals(mux.out.get(), mux.in[4].get());

		mux = new Sim3_MUX_8by1();
		setRussWireArray(mux.in, inputStr);
		setRussWireArray(mux.control, "101");
		mux.execute();
		assertEquals(mux.out.get(), mux.in[5].get());

		mux = new Sim3_MUX_8by1();
		setRussWireArray(mux.in, inputStr);
		setRussWireArray(mux.control, "110");
		mux.execute();
		assertEquals(mux.out.get(), mux.in[6].get());

		mux = new Sim3_MUX_8by1();
		setRussWireArray(mux.in, inputStr);
		setRussWireArray(mux.control, "111");
		mux.execute();
		assertEquals(mux.out.get(), mux.in[7].get());
	}

	// @author Mochi#7459
	// this function takes in a RussWire array and a String representation of
	// a 32 bit binary number, and translates the String into the RussWire array
	private static void setRussWireArray(RussWire[] m, String str) {
		char bit = '0';
		int size = str.length();
		for (int i = 0; i < size; i++) {
			bit = str.charAt(str.length() - 1);
			str = str.substring(0, str.length() - 1);
			m[i] = new RussWire();
			if (bit == '1')
				m[i].set(true);
			else
				m[i].set(false);
		}
	}
}

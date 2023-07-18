
/**
 * Testcases for Sim3
 * 
 * @author Adrian Moore
 * setRussWireArray by Mochi#7459
 */

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class Sim3_ALUElementTest {

	@Test
	// for testing a specific ALU input
	void testALUElementIndividual() {
		testALUElement("000", 0, 0, 0, 0, 0, 0, 0, 0);
	}

	@Test
	// test all possible ALU inputs for AND
	void testSim3_ALUElementAND() {
		// parameters are in the following order:
		// (aluOp, a, b, bInvert, carryIn, less, result, addResult, carryOut)
		testALUElement("000", 0, 0, 0, 0, 0, 0, 0, 0);
		testALUElement("000", 0, 0, 0, 0, 1, 0, 0, 0);
		testALUElement("000", 0, 0, 0, 1, 0, 0, 1, 0);
		testALUElement("000", 0, 0, 0, 1, 1, 0, 1, 0);
		testALUElement("000", 0, 0, 1, 0, 0, 0, 1, 0);
		testALUElement("000", 0, 0, 1, 0, 1, 0, 1, 0);
		testALUElement("000", 0, 0, 1, 1, 0, 0, 0, 1);
		testALUElement("000", 0, 0, 1, 1, 1, 0, 0, 1);
		testALUElement("000", 0, 1, 0, 0, 0, 0, 1, 0);
		testALUElement("000", 0, 1, 0, 0, 1, 0, 1, 0);
		testALUElement("000", 0, 1, 0, 1, 0, 0, 0, 1);
		testALUElement("000", 0, 1, 0, 1, 1, 0, 0, 1);
		testALUElement("000", 0, 1, 1, 0, 0, 0, 0, 0);
		testALUElement("000", 0, 1, 1, 0, 1, 0, 0, 0);
		testALUElement("000", 0, 1, 1, 1, 0, 0, 1, 0);
		testALUElement("000", 0, 1, 1, 1, 1, 0, 1, 0);
		testALUElement("000", 1, 0, 0, 0, 0, 0, 1, 0);
		testALUElement("000", 1, 0, 0, 0, 1, 0, 1, 0);
		testALUElement("000", 1, 0, 0, 1, 0, 0, 0, 1);
		testALUElement("000", 1, 0, 0, 1, 1, 0, 0, 1);
		testALUElement("000", 1, 0, 1, 0, 0, 1, 0, 1);
		testALUElement("000", 1, 0, 1, 0, 1, 1, 0, 1);
		testALUElement("000", 1, 0, 1, 1, 0, 1, 1, 1);
		testALUElement("000", 1, 0, 1, 1, 1, 1, 1, 1);
		testALUElement("000", 1, 1, 0, 0, 0, 1, 0, 1);
		testALUElement("000", 1, 1, 0, 0, 1, 1, 0, 1);
		testALUElement("000", 1, 1, 0, 1, 0, 1, 1, 1);
		testALUElement("000", 1, 1, 0, 1, 1, 1, 1, 1);
		testALUElement("000", 1, 1, 1, 0, 0, 0, 1, 0);
		testALUElement("000", 1, 1, 1, 0, 1, 0, 1, 0);
		testALUElement("000", 1, 1, 1, 1, 0, 0, 0, 1);
		testALUElement("000", 1, 1, 1, 1, 1, 0, 0, 1);
	}

	@Test
	// test all possible ALU inputs for OR
	void testSim3_ALUElementOR() {
		// parameters are in the following order:
		// (aluOp, a, b, bInvert, carryIn, less, result, addResult, carryOut)
		testALUElement("001", 0, 0, 0, 0, 0, 0, 0, 0);
		testALUElement("001", 0, 0, 0, 0, 1, 0, 0, 0);
		testALUElement("001", 0, 0, 0, 1, 0, 0, 1, 0);
		testALUElement("001", 0, 0, 0, 1, 1, 0, 1, 0);
		testALUElement("001", 0, 0, 1, 0, 0, 1, 1, 0);
		testALUElement("001", 0, 0, 1, 0, 1, 1, 1, 0);
		testALUElement("001", 0, 0, 1, 1, 0, 1, 0, 1);
		testALUElement("001", 0, 0, 1, 1, 1, 1, 0, 1);
		testALUElement("001", 0, 1, 0, 0, 0, 1, 1, 0);
		testALUElement("001", 0, 1, 0, 0, 1, 1, 1, 0);
		testALUElement("001", 0, 1, 0, 1, 0, 1, 0, 1);
		testALUElement("001", 0, 1, 0, 1, 1, 1, 0, 1);
		testALUElement("001", 0, 1, 1, 0, 0, 0, 0, 0);
		testALUElement("001", 0, 1, 1, 0, 1, 0, 0, 0);
		testALUElement("001", 0, 1, 1, 1, 0, 0, 1, 0);
		testALUElement("001", 0, 1, 1, 1, 1, 0, 1, 0);
		testALUElement("001", 1, 0, 0, 0, 0, 1, 1, 0);
		testALUElement("001", 1, 0, 0, 0, 1, 1, 1, 0);
		testALUElement("001", 1, 0, 0, 1, 0, 1, 0, 1);
		testALUElement("001", 1, 0, 0, 1, 1, 1, 0, 1);
		testALUElement("001", 1, 0, 1, 0, 0, 1, 0, 1);
		testALUElement("001", 1, 0, 1, 0, 1, 1, 0, 1);
		testALUElement("001", 1, 0, 1, 1, 0, 1, 1, 1);
		testALUElement("001", 1, 0, 1, 1, 1, 1, 1, 1);
		testALUElement("001", 1, 1, 0, 0, 0, 1, 0, 1);
		testALUElement("001", 1, 1, 0, 0, 1, 1, 0, 1);
		testALUElement("001", 1, 1, 0, 1, 0, 1, 1, 1);
		testALUElement("001", 1, 1, 0, 1, 1, 1, 1, 1);
		testALUElement("001", 1, 1, 1, 0, 0, 1, 1, 0);
		testALUElement("001", 1, 1, 1, 0, 1, 1, 1, 0);
		testALUElement("001", 1, 1, 1, 1, 0, 1, 0, 1);
		testALUElement("001", 1, 1, 1, 1, 1, 1, 0, 1);
	}

	@Test
	// test all possible ALU inputs for ADD
	void testSim3_ALUElementADD() {
		// parameters are in the following order:
		// (aluOp, a, b, bInvert, carryIn, less, result, addResult, carryOut)
		testALUElement("010", 0, 0, 0, 0, 0, 0, 0, 0);
		testALUElement("010", 0, 0, 0, 0, 1, 0, 0, 0);
		testALUElement("010", 0, 0, 0, 1, 0, 1, 1, 0);
		testALUElement("010", 0, 0, 0, 1, 1, 1, 1, 0);
		testALUElement("010", 0, 0, 1, 0, 0, 1, 1, 0);
		testALUElement("010", 0, 0, 1, 0, 1, 1, 1, 0);
		testALUElement("010", 0, 0, 1, 1, 0, 0, 0, 1);
		testALUElement("010", 0, 0, 1, 1, 1, 0, 0, 1);
		testALUElement("010", 0, 1, 0, 0, 0, 1, 1, 0);
		testALUElement("010", 0, 1, 0, 0, 1, 1, 1, 0);
		testALUElement("010", 0, 1, 0, 1, 0, 0, 0, 1);
		testALUElement("010", 0, 1, 0, 1, 1, 0, 0, 1);
		testALUElement("010", 0, 1, 1, 0, 0, 0, 0, 0);
		testALUElement("010", 0, 1, 1, 0, 1, 0, 0, 0);
		testALUElement("010", 0, 1, 1, 1, 0, 1, 1, 0);
		testALUElement("010", 0, 1, 1, 1, 1, 1, 1, 0);
		testALUElement("010", 1, 0, 0, 0, 0, 1, 1, 0);
		testALUElement("010", 1, 0, 0, 0, 1, 1, 1, 0);
		testALUElement("010", 1, 0, 0, 1, 0, 0, 0, 1);
		testALUElement("010", 1, 0, 0, 1, 1, 0, 0, 1);
		testALUElement("010", 1, 0, 1, 0, 0, 0, 0, 1);
		testALUElement("010", 1, 0, 1, 0, 1, 0, 0, 1);
		testALUElement("010", 1, 0, 1, 1, 0, 1, 1, 1);
		testALUElement("010", 1, 0, 1, 1, 1, 1, 1, 1);
		testALUElement("010", 1, 1, 0, 0, 0, 0, 0, 1);
		testALUElement("010", 1, 1, 0, 0, 1, 0, 0, 1);
		testALUElement("010", 1, 1, 0, 1, 0, 1, 1, 1);
		testALUElement("010", 1, 1, 0, 1, 1, 1, 1, 1);
		testALUElement("010", 1, 1, 1, 0, 0, 1, 1, 0);
		testALUElement("010", 1, 1, 1, 0, 1, 1, 1, 0);
		testALUElement("010", 1, 1, 1, 1, 0, 0, 0, 1);
		testALUElement("010", 1, 1, 1, 1, 1, 0, 0, 1);
	}

	@Test
	// test all possible ALU inputs for LESS
	void testSim3_ALUElementLESS() {
		// parameters are in the following order:
		// (aluOp, a, b, bInvert, carryIn, less, result, addResult, carryOut)
		testALUElement("011", 0, 0, 0, 0, 0, 0, 0, 0);
		testALUElement("011", 0, 0, 0, 0, 1, 1, 0, 0);
		testALUElement("011", 0, 0, 0, 1, 0, 0, 1, 0);
		testALUElement("011", 0, 0, 0, 1, 1, 1, 1, 0);
		testALUElement("011", 0, 0, 1, 0, 0, 0, 1, 0);
		testALUElement("011", 0, 0, 1, 0, 1, 1, 1, 0);
		testALUElement("011", 0, 0, 1, 1, 0, 0, 0, 1);
		testALUElement("011", 0, 0, 1, 1, 1, 1, 0, 1);
		testALUElement("011", 0, 1, 0, 0, 0, 0, 1, 0);
		testALUElement("011", 0, 1, 0, 0, 1, 1, 1, 0);
		testALUElement("011", 0, 1, 0, 1, 0, 0, 0, 1);
		testALUElement("011", 0, 1, 0, 1, 1, 1, 0, 1);
		testALUElement("011", 0, 1, 1, 0, 0, 0, 0, 0);
		testALUElement("011", 0, 1, 1, 0, 1, 1, 0, 0);
		testALUElement("011", 0, 1, 1, 1, 0, 0, 1, 0);
		testALUElement("011", 0, 1, 1, 1, 1, 1, 1, 0);
		testALUElement("011", 1, 0, 0, 0, 0, 0, 1, 0);
		testALUElement("011", 1, 0, 0, 0, 1, 1, 1, 0);
		testALUElement("011", 1, 0, 0, 1, 0, 0, 0, 1);
		testALUElement("011", 1, 0, 0, 1, 1, 1, 0, 1);
		testALUElement("011", 1, 0, 1, 0, 0, 0, 0, 1);
		testALUElement("011", 1, 0, 1, 0, 1, 1, 0, 1);
		testALUElement("011", 1, 0, 1, 1, 0, 0, 1, 1);
		testALUElement("011", 1, 0, 1, 1, 1, 1, 1, 1);
		testALUElement("011", 1, 1, 0, 0, 0, 0, 0, 1);
		testALUElement("011", 1, 1, 0, 0, 1, 1, 0, 1);
		testALUElement("011", 1, 1, 0, 1, 0, 0, 1, 1);
		testALUElement("011", 1, 1, 0, 1, 1, 1, 1, 1);
		testALUElement("011", 1, 1, 1, 0, 0, 0, 1, 0);
		testALUElement("011", 1, 1, 1, 0, 1, 1, 1, 0);
		testALUElement("011", 1, 1, 1, 1, 0, 0, 0, 1);
		testALUElement("011", 1, 1, 1, 1, 1, 1, 0, 1);
	}

	@Test
	// test all possible ALU inputs for XOR
	void testSim3_ALUElementXOR() {
		// parameters are in the following order:
		// (aluOp, a, b, bInvert, carryIn, less, result, addResult, carryOut)
		testALUElement("100", 0, 0, 0, 0, 0, 0, 0, 0);
		testALUElement("100", 0, 0, 0, 0, 1, 0, 0, 0);
		testALUElement("100", 0, 0, 0, 1, 0, 0, 1, 0);
		testALUElement("100", 0, 0, 0, 1, 1, 0, 1, 0);
		testALUElement("100", 0, 0, 1, 0, 0, 1, 1, 0);
		testALUElement("100", 0, 0, 1, 0, 1, 1, 1, 0);
		testALUElement("100", 0, 0, 1, 1, 0, 1, 0, 1);
		testALUElement("100", 0, 0, 1, 1, 1, 1, 0, 1);
		testALUElement("100", 0, 1, 0, 0, 0, 1, 1, 0);
		testALUElement("100", 0, 1, 0, 0, 1, 1, 1, 0);
		testALUElement("100", 0, 1, 0, 1, 0, 1, 0, 1);
		testALUElement("100", 0, 1, 0, 1, 1, 1, 0, 1);
		testALUElement("100", 0, 1, 1, 0, 0, 0, 0, 0);
		testALUElement("100", 0, 1, 1, 0, 1, 0, 0, 0);
		testALUElement("100", 0, 1, 1, 1, 0, 0, 1, 0);
		testALUElement("100", 0, 1, 1, 1, 1, 0, 1, 0);
		testALUElement("100", 1, 0, 0, 0, 0, 1, 1, 0);
		testALUElement("100", 1, 0, 0, 0, 1, 1, 1, 0);
		testALUElement("100", 1, 0, 0, 1, 0, 1, 0, 1);
		testALUElement("100", 1, 0, 0, 1, 1, 1, 0, 1);
		testALUElement("100", 1, 0, 1, 0, 0, 0, 0, 1);
		testALUElement("100", 1, 0, 1, 0, 1, 0, 0, 1);
		testALUElement("100", 1, 0, 1, 1, 0, 0, 1, 1);
		testALUElement("100", 1, 0, 1, 1, 1, 0, 1, 1);
		testALUElement("100", 1, 1, 0, 0, 0, 0, 0, 1);
		testALUElement("100", 1, 1, 0, 0, 1, 0, 0, 1);
		testALUElement("100", 1, 1, 0, 1, 0, 0, 1, 1);
		testALUElement("100", 1, 1, 0, 1, 1, 0, 1, 1);
		testALUElement("100", 1, 1, 1, 0, 0, 1, 1, 0);
		testALUElement("100", 1, 1, 1, 0, 1, 1, 1, 0);
		testALUElement("100", 1, 1, 1, 1, 0, 1, 0, 1);
		testALUElement("100", 1, 1, 1, 1, 1, 1, 0, 1);
	}

	void testALUElement(String aluOp, int a, int b, int bInv, int cIn, int less, int result, int addResult, int cOut) {
		Sim3_ALUElement alu = new Sim3_ALUElement();

		// set ALU inputs
		setRussWireArray(alu.aluOp, aluOp);
		alu.a.set((a == 1) ? true : false);
		alu.b.set((b == 1) ? true : false);
		alu.bInvert.set((bInv == 1) ? true : false);
		alu.carryIn.set((cIn == 1) ? true : false);

		alu.execute_pass1();

		// check outputs other than result
		assertEquals(alu.addResult.get(), (addResult == 1) ? true : false);
		assertEquals(alu.carryOut.get(), (cOut == 1) ? true : false);

		// set less
		alu.less.set((less == 1) ? true : false);

		alu.execute_pass2();

		// check all outputs
		assertEquals(alu.result.get(), (result == 1) ? true : false);
		assertEquals(alu.addResult.get(), (addResult == 1) ? true : false);
		assertEquals(alu.carryOut.get(), (cOut == 1) ? true : false);
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

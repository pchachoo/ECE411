--
-- VHDL Architecture ece411.IR.UNTITLED
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 16:45:12 05/22/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IR IS
   PORT( 
      LoadIR    : IN     std_logic;
      MDRout    : IN     LC3b_word;
      clk       : IN     std_logic;
   

      Opcode    : OUT    LC3b_opcode;
      SrcA      : OUT    LC3b_reg;
      SrcB      : OUT    LC3b_reg;
      index6    : OUT    LC3b_index6;
      offset9   : OUT    LC3b_offset9;
      offset11  : OUT    LC3b_offset11;
      JSR_R     : OUT    std_logic;
      ImmValue4 : OUT    LC3B_NIBBLE;
      ImmValue5 : OUT    LC3B_IMM5;
      ShiftAD   : OUT    LC3B_SHFTOP;
      OpImmBit  : OUT    std_logic;
      destIR    : OUT    LC3b_reg;
      TrapVec8  : OUT    LC3B_TRAPVECT8
   );

-- Declarations

END IR ;

--
ARCHITECTURE UNTITLED OF IR IS
SIGNAL VAL_IR : LC3B_WORD;
BEGIN
	------------------------------
	VHDL_REG_IR : PROCESS (CLK, LOADIR, MDROUT)
	------------------------------
	BEGIN
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			IF (LOADIR = '1') THEN
				VAL_IR <= MDROUT AFTER DELAY_REG;
			END IF;
		END IF;
	 IF (OPCODE = op_add OR OPCODE = op_and) THEN
	   OpImmBit <= VAL_IR(5);
	 ELSE
	   OpImmBit <= '0';
	 END IF;
	END PROCESS VHDL_REG_IR;

	OPCODE <= VAL_IR(15 DOWNTO 12);
	ImmValue4 <= VAL_IR(3 DOWNTO 0);
	ImmValue5 <= VAL_IR(4 DOWNTO 0);
	ShiftAD <= VAL_IR(5 DOWNTO 4);
	SRCA <= VAL_IR(8 DOWNTO 6);
	SRCB <= VAL_IR(2 DOWNTO 0);
	DESTIR <= VAL_IR(11 DOWNTO 9);	
	JSR_R <= VAL_IR(11);
	OFFSET11 <= VAL_IR(10 DOWNTO 0);
	OFFSET9 <= VAL_IR(8 DOWNTO 0);
	INDEX6 <= VAL_IR(5 DOWNTO 0);
	TrapVec8 <= VAL_IR(7 DOWNTO 0);
 OpImmBit <= VAL_IR(5);

END UNTITLED;


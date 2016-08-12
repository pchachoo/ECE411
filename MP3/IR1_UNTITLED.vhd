--
-- VHDL Architecture ece411.IR1.UNTITLED
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 17:38:42 07/25/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IR1 IS
   PORT( 
      --clk        : IN     std_logic;
      InstrIn    : IN     lc3b_word;
      opcode     : OUT    LC3b_opcode;
      destIR     : OUT    lc3b_reg;
      PCPlus2_ID : OUT    lc3b_word;
      PC_ID      : OUT    lc3b_word;
      SrcA       : OUT    lc3b_reg;
      SrcB       : OUT    lc3b_reg;
      Bit4       : OUT    std_logic;
      Bit5       : OUT    std_logic;
      JSR_RBit11 : OUT    std_logic;
      ImmValue4  : OUT    lc3b_nibble;
      ImmValue5  : OUT    lc3b_imm5;
      nzp_ID     : OUT    lc3b_nzp;
      index6     : OUT    lc3b_index6;
      offset9    : OUT    lc3b_offset9;
      offset11   : OUT    LC3b_offset11;
      TrapVec8   : OUT    LC3b_trapvect8
   );

-- Declarations

END IR1 ;

--
ARCHITECTURE UNTITLED OF IR1 IS
--SIGNAL VAL_IR : LC3B_WORD;
BEGIN
  	------------------------------
	VHDL_REG_IR : PROCESS (CLK, LOADIR, MDROUT)
	------------------------------
	BEGIN
		--IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			--IF (LOADIR = '1') THEN
				--VAL_IR <= MDROUT AFTER DELAY_REG;
		--END IF;
		
		
		  destIR <= InstrIn(11 downto 9) AFTER DELAY_REG;
      Opcode <= InstrIn(15 downto 12)AFTER DELAY_REG;
      PC_ID <= PC_IF;
      PCPlus2_ID <= PCPlus2_ID;
      SrcA <= InstrIn(8 downto 6);
      SrcB <= InstrIn(2 downto 0);
      Bit4 <= InstrIn(4);
      Bit5 <= InstrIn(5);
      JSR_RBit11 <= InstrIn(11);
      ImmValue4 <= InstrIn(3 downto 0);
      ImmValue5 <= InstrIn(4 downto 0);
      nzp_ID <= InstrIn(11 downto 9);
      index6 <= InstrIn(5 downto 0);
      offset9 <= InstrIn(8 downto 0);
      offset11 <= InstrIn(10 downto 0);
      TrapVec8 <= InstrIn(7 downto 0);
		--END IF;
	


	END PROCESS VHDL_REG_IR;


END ARCHITECTURE UNTITLED;

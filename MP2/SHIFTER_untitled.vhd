--
-- VHDL Architecture ece411.SHIFTER.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 16:22:45 05/31/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY SHIFTER IS
   PORT( 
      ImmValue4  : IN     LC3B_NIBBLE;
      RFAout     : IN     LC3b_word;
      ShiftAD    : IN     LC3B_SHFTOP;
      clk        : IN     std_logic;
      ShifterOut : OUT    LC3b_word
   );

-- Declarations

END SHIFTER ;

--
ARCHITECTURE untitled OF SHIFTER IS
BEGIN
  Shift_select: PROCESS (RFAout, ImmValue4, ShiftAD, Clk, ShifterOut)
 	VARIABLE TEMP_OUT : LC3B_WORD;
 	VARIABLE COUNT : INTEGER;
  Begin
    CASE ShiftAD is
      WHEN SHFT_SLL =>
			  TEMP_OUT := std_logic_vector("sll"(unsigned(RFAout), to_integer(unsigned(ImmValue4)))); 
			WHEN SHFT_SRL =>
			  TEMP_OUT := std_logic_vector("srl"(unsigned(RFAout), to_integer(unsigned(ImmValue4))));	
  			WHEN SHFT_SRA =>
			  COUNT := to_integer(unsigned(ImmValue4(3 downto 0)));
        if (ImmValue4(3 downto 0) = "0000") then
          TEMP_OUT := RFAout; --Perform no shifting
        else
          TEMP_OUT(15 - COUNT downto 0) := RFAout(15 downto COUNT);
          TEMP_OUT(15 downto (15 - COUNT + 1)) := (others => RFAout(15));
        end if;
    WHEN OTHERS =>
      TEMP_OUT := RFAout;
END CASE;
SHIFTEROUT <= TEMP_OUT AFTER Delay_Shifter;

END Process Shift_Select;
  --DELAY_SHIFTER
END ARCHITECTURE untitled;


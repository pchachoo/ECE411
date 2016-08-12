--
-- VHDL Architecture ece411.ADJ5.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 11:20:12 05/28/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADJ5 IS
   PORT( 
      clk     : IN     std_logic;
      Imm5  : IN     LC3B_IMM5;
      ADJ5out : OUT    LC3b_word
   );

-- Declarations

END ADJ5 ;

--
ARCHITECTURE UNTITLED OF ADJ5 IS
BEGIN
	ADJ5OUT <= Imm5(4) & Imm5(4) & Imm5(4) & Imm5(4) & Imm5(4) & Imm5(4) & Imm5(4) & Imm5(4) & Imm5(4) & Imm5(4) & Imm5(4) & Imm5 AFTER DELAY_MUX2;
END UNTITLED;

--
-- VHDL Architecture ece411.ADJ4.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 11:10:00 05/28/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADJ4 IS
   PORT( 
      clk     : IN     std_logic;
      index6  : IN     LC3b_index6;
      ADJ4out : OUT    LC3b_word
   );

-- Declarations

END ADJ4 ;

--
ARCHITECTURE UNTITLED OF ADJ4 IS
BEGIN
	ADJ4OUT <= INDEX6(3) & INDEX6(3) & INDEX6(3) & INDEX6(3) & INDEX6(3) & INDEX6(3) & INDEX6(3) & INDEX6(3) & INDEX6(3) & INDEX6(3) & INDEX6(3) & INDEX6(3) & INDEX6(2) & INDEX6(1) & INDEX6(0) & '0' AFTER DELAY_MUX2;
END UNTITLED;


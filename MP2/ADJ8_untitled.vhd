--
-- VHDL Architecture ece411.ADJ8.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 11:27:38 05/28/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADJ8 IS
   PORT( 
      clk     : IN     std_logic;
      offset9 : IN     LC3b_offset9;
      ADJ8out : OUT    LC3b_word
   );

-- Declarations

END ADJ8 ;


--
ARCHITECTURE UNTITLED OF ADJ8 IS
BEGIN
	ADJ8OUT <= offset9(7) & offset9(7) & offset9(7) & offset9(7) & offset9(7) & offset9(7) & offset9(7) & offset9(7) & offset9(6) & offset9(5) & offset9(4) & offset9(3) & offset9(2) & offset9(1) & offset9(0) & '0' AFTER DELAY_MUX2;
END UNTITLED;


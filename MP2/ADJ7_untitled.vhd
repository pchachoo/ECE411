--
-- VHDL Architecture ece411.ADJ7.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 11:25:14 05/28/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADJ7 IS
   PORT( 
      clk     : IN     std_logic;
      offset9 : IN     LC3b_offset9;
      ADJ7out : OUT    LC3b_word
   );

-- Declarations

END ADJ7 ;

--
ARCHITECTURE UNTITLED OF ADJ7 IS
BEGIN
	ADJ7OUT <= offset9(6) & offset9(6) & offset9(6) & offset9(6) & offset9(6) & offset9(6) & offset9(6) & offset9(6) & offset9(6) & offset9(5) & offset9(4) & offset9(3) & offset9(2) & offset9(1) & offset9(0) & '0' AFTER DELAY_MUX2;
END UNTITLED;


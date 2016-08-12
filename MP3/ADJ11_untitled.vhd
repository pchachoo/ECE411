--
-- VHDL Architecture ece411.ADJ11.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 11:33:29 05/28/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADJ11 IS
   PORT( 
      --clk      : IN     std_logic;
      input    : IN     LC3b_offset11;
      ADJ11out : OUT    LC3b_word
   );

-- Declarations

END ADJ11 ;

--
ARCHITECTURE untitled OF ADJ11 IS
BEGIN
  --ADJ11out <= input(10) & input(10) & input(10) & input(10) & input(10) & input(9) & input(8) & input(7) & input(6) & input(5) & input(4) & input(3) & input(2) & input(1) & input(0) & '0' AFTER DELAY_MUX2;
  ADJ11out <= input(10) & input(10) & input(10) & input(10) & input & '0' AFTER DELAY_MUX2;
END ARCHITECTURE untitled;



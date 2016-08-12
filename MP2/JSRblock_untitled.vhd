--
-- VHDL Architecture ece411.JSRblock.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 14:11:05 05/31/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY JSRblock IS
   PORT( 
      ADJ11out   : IN     LC3b_word;
      PCPlus2out : IN     LC3b_word;   -- PCPlus2out
      clk        : IN     std_logic;
      D          : OUT    LC3b_word;
      R7out      : OUT    LC3b_reg
   );

-- Declarations

END JSRblock ;

--
ARCHITECTURE untitled OF JSRblock IS
BEGIN
  JSR_adder: PROCESS (ADJ11out, PCPlus2out, clk)
BEGIN
  D <= STD_LOGIC_VECTOR(UNSIGNED(PCPlus2out)+UNSIGNED(ADJ11out) ) AFTER DELAY_ADDER;
  R7out <= "111";
END PROCESS JSR_adder;
END ARCHITECTURE untitled;


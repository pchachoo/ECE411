--
-- VHDL Architecture ece411.SEXT6.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 13:31:34 06/02/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY p_SEXT6 IS
   PORT( 
      --clk      : IN     std_logic;
      offset6  : IN     LC3b_index6;
      SEXT6out : OUT    LC3b_word
   );

-- Declarations

END p_SEXT6 ;

--
ARCHITECTURE untitled OF p_SEXT6 IS
BEGIN
  SEXT6out <= offset6(5) & offset6(5) & offset6(5) & offset6(5) & offset6(5) & offset6(5) & offset6(5) & offset6(5) & offset6(5) & offset6(5) & offset6 AFTER DELAY_MUX2;
END ARCHITECTURE untitled;


--
-- VHDL Architecture ece411.BRadd.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 17:11:02 05/22/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BRadd IS
   PORT( 
      ADJ9out  : IN     LC3b_word;
      PCout    : IN     LC3b_word;
      clk      : IN     std_logic;
      BRaddout : OUT    LC3b_word
   );

-- Declarations

END BRadd ;

--
ARCHITECTURE untitled OF BRadd IS
BEGIN
 	VHDL_BRADD : PROCESS (PCOUT, ADJ9out)
	BEGIN  -- PROCESS
		BRaddout <= STD_LOGIC_VECTOR(UNSIGNED(PCOUT)+UNSIGNED(ADJ9out) ) AFTER DELAY_ADDER;
	END PROCESS;
END ARCHITECTURE untitled;


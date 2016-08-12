--
-- VHDL Architecture ece411.Plus2.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 16:49:23 05/22/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY p_Plus2 IS
   PORT( 
      PCout      : IN     LC3b_word;
      --clk        : IN     std_logic;
      PCPlus2out : OUT    LC3b_word    -- PCPlus2out
   );

-- Declarations

END p_Plus2 ;

--
ARCHITECTURE UNTITLED OF p_Plus2 IS
BEGIN
	VHDL_ADD_2 : PROCESS (PCOUT)
	BEGIN  -- PROCESS
		PCPLUS2OUT <= STD_LOGIC_VECTOR(UNSIGNED(PCOUT) + 2 ) AFTER DELAY_ADDER;
	END PROCESS;
END UNTITLED;


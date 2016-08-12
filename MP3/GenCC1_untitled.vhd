--
-- VHDL Architecture ece411.GenCC1.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 14:14:55 07/25/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY GenCC1 IS
   PORT( 
      WriteData : IN     LC3b_word;
      clk       : IN     std_logic;
      GenCCout  : OUT    LC3b_cc
   );

-- Declarations

END GenCC1 ;

--
ARCHITECTURE untitled OF GenCC1 IS
BEGIN
  	VHDL_GENCC : PROCESS (WriteData)
	BEGIN    
		IF (WriteData = "0000000000000000") THEN
			GENCCOUT <= "010" AFTER DELAY_GENCC;
		ELSIF (WriteData(15) = '1') THEN
			GENCCOUT <= "100" AFTER DELAY_GENCC;
		ELSE
			GENCCOUT <= "001" AFTER DELAY_GENCC;
		END IF;
	END PROCESS VHDL_GENCC;
END ARCHITECTURE untitled;


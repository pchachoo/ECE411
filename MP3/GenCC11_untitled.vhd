--
-- VHDL Architecture ece411.GenCC11.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 11:12:19 07/26/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY GenCC11 IS
   PORT( 
      writedata : IN     LC3b_word;
      GenCCout  : OUT    LC3b_cc
   );

-- Declarations

END GenCC11 ;

--
ARCHITECTURE untitled OF GenCC11 IS
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


--
-- VHDL Architecture ece411.DEMUX2.UNTITLED
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 16:29:47 08/02/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ENTITY DEMUX2 IS
     PORT( 
      F   : IN     std_logic;
      Sel : IN     std_logic;
      A   : OUT    std_logic;
      B   : OUT    std_logic
   );

END ENTITY DEMUX2;

--
ARCHITECTURE UNTITLED OF DEMUX2 IS
BEGIN
 	PROCESS (F, SEL)
	BEGIN  
		IF SEL = '0' THEN
			A <= F AFTER DELAY_MUX2;
			B <= 'X' AFTER DELAY_MUX2;
		ELSIF SEL = '1' THEN
			A <= 'X' AFTER DELAY_MUX2;
			B <= F AFTER DELAY_MUX2;
		ELSE
			A <= 'X' AFTER DELAY_MUX2;
			B <= 'X' AFTER DELAY_MUX2;
		END IF;
	END PROCESS;
END ARCHITECTURE UNTITLED;


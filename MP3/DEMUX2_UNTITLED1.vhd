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


ENTITY DEMUX2_128 IS
     PORT( 
      F   : IN     lc3b_oword;
      Sel : IN     std_logic;
      A   : OUT    lc3b_oword;
      B   : OUT    lc3b_oword
   );

END ENTITY DEMUX2_128;

--
ARCHITECTURE UNTITLED OF DEMUX2_128 IS
BEGIN
 	PROCESS (F, SEL)
	BEGIN  
		IF SEL = '0' THEN
			A <= F AFTER DELAY_MUX2;
			B <= (OTHERS => 'X') AFTER DELAY_MUX2;
		ELSIF SEL = '1' THEN
			A <= (OTHERS => 'X') AFTER DELAY_MUX2;
			B <= F AFTER DELAY_MUX2;
		ELSE
			A <= (OTHERS => 'X') AFTER DELAY_MUX2;
			B <= (OTHERS => 'X') AFTER DELAY_MUX2;
		END IF;
	END PROCESS;
END ARCHITECTURE UNTITLED;


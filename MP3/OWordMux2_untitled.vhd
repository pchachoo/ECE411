--
-- VHDL Architecture ece411.OWordMux2.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 19:26:40 06/08/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY OWordMux2 IS
   PORT( 
      A   : IN     LC3b_OWORD;
      B   : IN     LC3b_OWORD;
      Sel : IN     std_logic;
      F   : OUT    LC3b_OWORD
   );

-- Declarations

END OWordMux2 ;

-- 
ARCHITECTURE UNTITLED OF OWordMux2 IS
BEGIN
	OWordMUX2: PROCESS(A,B,SEL)
	VARIABLE STATE : LC3B_OWORD;
	BEGIN
		CASE SEL IS
		WHEN '0' =>
			STATE := A;
		WHEN '1' =>
			STATE := B;
		WHEN OTHERS =>
			STATE := (OTHERS => 'X');
		END CASE;
		F <= STATE AFTER DELAY_MUX2;
	END PROCESS OWordMUX2;
END ARCHITECTURE untitled;


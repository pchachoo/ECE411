--
-- VHDL Architecture ece411.NZP1.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 14:16:31 07/25/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY NZP1 IS
   PORT( 
      GenCCout : IN     LC3b_cc;
      clk      : IN     std_logic;
      setcc_wb : IN     std_logic;
      P        : OUT    std_logic;
      n        : OUT    std_logic;
      z        : OUT    std_logic
   );

-- Declarations

END NZP1 ;

--
ARCHITECTURE untitled OF NZP1 IS
  SIGNAL PRE_NZP : STD_LOGIC_VECTOR (2 DOWNTO 0);
BEGIN
	------------------------------
	VHDL_NZP : PROCESS (CLK, GENCCOUT, setcc_wb)
	------------------------------
	BEGIN
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			IF (setcc_wb = '1') THEN
				PRE_NZP <= GENCCOUT;
			END IF;
		END IF;
	END PROCESS VHDL_NZP;
	N <= PRE_NZP(2) AFTER DELAY_REG;
	Z <= PRE_NZP(1) AFTER DELAY_REG;
	P <= PRE_NZP(0) AFTER DELAY_REG;
END ARCHITECTURE untitled;


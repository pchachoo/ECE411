--
-- VHDL Architecture ece411.NZP11.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 11:13:15 07/26/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY NZP11_c IS
     PORT(
-- Declarations
      GenCCout : IN     LC3b_cc;
      LoadNZP  : IN     std_logic;
      clk      : IN     std_logic;
      RESET_L  : IN     std_logic;
      n        : OUT    std_logic;
      p        : OUT    std_logic;
      z        : OUT    std_logic
       );
END NZP11_c ;

--
ARCHITECTURE untitled OF NZP11_c IS
  SIGNAL PRE_NZP : STD_LOGIC_VECTOR (2 DOWNTO 0);
BEGIN
	------------------------------
	VHDL_NZP : PROCESS (CLK, RESET_L,GENCCOUT, LoadNZP)
	------------------------------
	BEGIN
	  IF (RESET_L = '0') THEN
	    PRE_NZP <= "111";
	  END IF;
	    
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			IF (LoadNZP = '1') THEN
				PRE_NZP <= GENCCOUT;
			END IF;
		END IF;
	END PROCESS VHDL_NZP;
	N <= PRE_NZP(2) AFTER DELAY_REG;
	Z <= PRE_NZP(1) AFTER DELAY_REG;
	P <= PRE_NZP(0) AFTER DELAY_REG;
END ARCHITECTURE untitled;


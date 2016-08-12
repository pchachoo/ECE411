--
-- VHDL Architecture ece411.NZPsplit.UNTITLED
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 16:47:35 05/22/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY NZPsplit IS
   PORT( 
      clk    : IN     std_logic;
      dest   : IN     LC3b_reg;
      CheckN : OUT    std_logic;
      CheckP : OUT    std_logic;
      CheckZ : OUT    std_logic
   );

-- Declarations

END NZPsplit ;

--
ARCHITECTURE UNTITLED OF NZPSPLIT IS
BEGIN
	CHECKN <= dest(2);
	CHECKZ <= dest(1);
	CHECKP <= dest(0);
END UNTITLED;



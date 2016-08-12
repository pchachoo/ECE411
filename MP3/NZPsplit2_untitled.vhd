--
-- VHDL Architecture ece411.NZPsplit2.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 14:12:54 07/25/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY NZPsplit2 IS
   PORT( 
      clk    : IN     std_logic;
      CheckN : OUT    std_logic;
      CheckZ : OUT    std_logic;
      CheckP : OUT    std_logic
   );

-- Declarations

END NZPsplit2 ;

--
ARCHITECTURE untitled OF NZPsplit2 IS
BEGIN
  	CHECKN <= nzp_mem(2);
	CHECKZ <= nzp_mem(1);
	CHECKP <= nzp_mem(0);
END ARCHITECTURE untitled;



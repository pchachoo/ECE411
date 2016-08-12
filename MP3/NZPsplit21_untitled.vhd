--
-- VHDL Architecture ece411.NZPsplit21.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 11:13:32 07/26/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY NZPsplit21 IS
   PORT( 
      CheckN  : OUT    std_logic;
      CheckZ  : OUT    std_logic;
      CheckP  : OUT    std_logic;
      NZP_mem : IN     lc3b_nzp
   );

-- Declarations

END NZPsplit21 ;

--
ARCHITECTURE untitled OF NZPsplit21 IS
BEGIN
    	CHECKN <= nzp_mem(2);
	CHECKZ <= nzp_mem(1);
	CHECKP <= nzp_mem(0);
END ARCHITECTURE untitled;


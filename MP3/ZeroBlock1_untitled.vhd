--
-- VHDL Architecture ece411.ZeroBlock1.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 23:20:53 08/02/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ZeroBlock1 IS
   PORT( 
      Zero : OUT    STD_LOGIC
   );

-- Declarations

END ZeroBlock1 ;

--
ARCHITECTURE untitled OF ZeroBlock1 IS
BEGIN
  Zero <= '0';
END ARCHITECTURE untitled;


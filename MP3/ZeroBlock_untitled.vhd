--
-- VHDL Architecture ece411.ZeroBlock.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 22:02:29 06/08/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ZeroBlock IS
   PORT( 
      Zero : OUT    STD_LOGIC
   );

-- Declarations

END ZeroBlock ;

--
ARCHITECTURE untitled OF ZeroBlock IS
BEGIN
  Zero <= '0';
END ARCHITECTURE untitled;


--
-- VHDL Architecture ece411.GenR7.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 18:37:23 07/27/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY GenR7 IS
   PORT( 
      R7destOut : OUT    Lc3b_reg
   );

-- Declarations

END GenR7 ;

--
ARCHITECTURE untitled OF GenR7 IS
BEGIN
  R7destOut <= "111";
END ARCHITECTURE untitled;


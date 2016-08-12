--
-- VHDL Architecture ece411.AND4.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 11:45:37 06/08/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY AND4 IS
   PORT( 
      In0     : IN     std_logic;
      In1     : IN     std_logic;
      In2     : IN     std_logic;
      In3     : IN     std_logic;
      AND4Out : OUT    std_logic
   );

-- Declarations

END AND4 ;

--
ARCHITECTURE untitled OF AND4 IS
BEGIN
  	AND4Out <= In0 AND In1 AND In2 AND In3 AFTER DELAY_LOGIC4;
END ARCHITECTURE untitled;


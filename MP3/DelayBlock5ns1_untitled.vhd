--
-- VHDL Architecture ece411.DelayBlock5ns1.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 23:14:10 08/02/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DelayBlock5ns1 IS
   PORT( 
      WWCDataOutPreDel : IN     LC3b_OWORD;
      WWCDataOut       : OUT    LC3b_OWORD
   );

-- Declarations

END DelayBlock5ns1 ;

--
ARCHITECTURE untitled OF DelayBlock5ns1 IS
BEGIN
  WWCDataOut <= WWCDataOutPreDel after 5ns;
END ARCHITECTURE untitled;


--
-- VHDL Architecture ece411.DelayBlk.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 23:50:19 06/08/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DelayBlk IS
   PORT( 
      DelayOut     : OUT    std_logic;
      BeforeDelay : IN     STD_LOGIC
   );

-- Declarations

END DelayBlk ;

--
ARCHITECTURE untitled OF DelayBlk IS
BEGIN
  DelayOut <= BeforeDelay after 2ns;
END ARCHITECTURE untitled;


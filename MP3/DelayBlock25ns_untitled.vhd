--
-- VHDL Architecture ece411.DelayBlock25ns.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 21:19:56 06/17/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DelayBlock25ns IS
   PORT( 
      In0  : IN     std_logic;
      Out0 : OUT    std_logic
   );

-- Declarations

END DelayBlock25ns ;

--
ARCHITECTURE untitled OF DelayBlock25ns IS
BEGIN
  Out0 <= In0 after 25ns;
END ARCHITECTURE untitled;


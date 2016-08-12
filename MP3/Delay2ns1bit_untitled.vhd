--
-- VHDL Architecture ece411.Delay2ns1bit.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 16:18:09 08/09/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Delay2ns1bit IS
   PORT( 
      RegWrite_MEM : IN     std_logic;
      DelayOut     : OUT    std_logic
   );

-- Declarations

END Delay2ns1bit ;

--
ARCHITECTURE untitled OF Delay2ns1bit IS
BEGIN
  DelayOut <= RegWrite_MEM AFTER  2ns;
END ARCHITECTURE untitled;


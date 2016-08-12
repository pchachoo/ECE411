--
-- VHDL Architecture ece411.TrapVector.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 20:41:29 06/01/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TrapVector IS
   PORT( 
      ZEXTOut   : IN     LC3B_WORD;
      clk       : IN     std_logic;
      RegMuxIn3 : OUT    LC3b_REG
   );

-- Declarations

END TrapVector ;

--
ARCHITECTURE untitled OF TrapVector IS
BEGIN
  RegMuxIn3 <= "111";
END ARCHITECTURE untitled;


--
-- VHDL Architecture ece411.ClkDelay.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 16:11:33 06/09/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ClkDelay IS
   PORT( 
      Clk        : IN     std_logic;
      DelayedClk : OUT    std_logic
   );

-- Declarations

END ClkDelay ;

--
ARCHITECTURE untitled OF ClkDelay IS
BEGIN
  DelayedClk <= Clk after 25ns;
END ARCHITECTURE untitled;


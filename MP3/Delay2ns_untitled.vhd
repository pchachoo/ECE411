--
-- VHDL Architecture ece411.Delay2ns.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 21:01:52 07/31/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Delay2ns IS
   PORT( 
      DelayOut    : OUT    lc3b_word;
 --     clk         : IN     std_logic;
      BeforeDelay : IN     lc3b_word
   );

-- Declarations

END Delay2ns ;

--
ARCHITECTURE untitled OF Delay2ns IS
BEGIN
  DelayOut <= BeforeDelay after 2ns;
END ARCHITECTURE untitled;




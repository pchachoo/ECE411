--
-- VHDL Architecture ece411.ZEXT.untitlted
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 18:39:48 06/01/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ZEXT IS
   PORT( 
      --clk     : IN     std_logic;
      ZEXTIn  : IN     LC3B_TRAPVECT8;
      ZEXTOut : OUT    LC3B_WORD
   );

-- Declarations

END ZEXT ;

--
ARCHITECTURE untitlted OF ZEXT IS
BEGIN
  
  ZEXTOUT <= '0' & '0' & '0' & '0' & '0' & '0' &  '0' & ZEXTIN(7) & ZEXTIN(6) & ZEXTIN(5) & ZEXTIN(4) & ZEXTIN(3) & ZEXTIN(2) & ZEXTIN(1) & ZEXTIN(0) & '0';

END ARCHITECTURE untitlted;


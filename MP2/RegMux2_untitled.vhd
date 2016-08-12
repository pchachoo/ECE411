--
-- VHDL Architecture ece411.WordMux16.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 16:59:59 06/01/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY RegMux2 IS
   PORT( 
      RegMuxIn1     : IN     LC3b_REG;
      RegMuxIn2  : IN     LC3b_REG;
      RegMuxSel : IN     std_logic;
      dest : OUT    LC3b_Reg
   );

-- Declarations

END RegMux2 ;

--
ARCHITECTURE untitled OF RegMux2 IS
BEGIN
  RegMuxProcess: Process (RegMuxIn1, RegMuxIn2, RegMuxSel)
  variable state : LC3b_reg; 
  BEGIN
    case RegMuxSel is 
when '0' => 
state := RegMuxIn1; 
when '1' => 
state := RegMuxIn2; 
when others => 
state := (OTHERS => 'X'); 
end case; 
dest <= state after DELAY_MUX2; 
  END PROCESS;
END ARCHITECTURE untitled;


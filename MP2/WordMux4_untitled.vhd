--
-- VHDL Architecture ece411.WordMux4.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 11:10:31 05/29/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WordMux4 IS
   PORT( 
      A       : IN     LC3b_word;
      B       : IN     LC3b_word;
      C       : IN     LC3b_word;
      D       : IN     LC3b_word;-- := '1';
      Sel     : IN     LC3B_4MUX_SEL;
      MUX4Out : OUT    LC3b_word
   );

-- Declarations

END WordMux4 ;

--
ARCHITECTURE untitled OF WordMux4 IS
BEGIN
  Process (A, B, C, D, Sel)
  variable state : LC3b_word;
  BEGIN
    case Sel is 
     when "00" =>
      state := A;
     when "01" =>
      state := B;
     when "10" =>
      state := C;
     when "11" =>
      state := D;
     when others =>
      state := (OTHERS => 'X');
    end case;
    MUX4Out <= state after DELAY_MUX4;
  END PROCESS;
END ARCHITECTURE untitled;




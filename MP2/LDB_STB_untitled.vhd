--
-- VHDL Architecture ece411.LDB_STB.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 15:07:21 06/02/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LDB_STB IS
   PORT( 
      RFMuxOut1 : IN     LC3b_word;
      clk       : IN     std_logic;
      B         : OUT    LC3b_word
   );

-- Declarations

END LDB_STB ;

--
ARCHITECTURE untitled OF LDB_STB IS
BEGIN
  LdbStbByteZext : Process (RFMuxOut1, clk)
  Variable Temp_byte: LC3B_BYTE;
  Begin
    Temp_byte := RFMuxOut1(7 DOWNTO 0);
    B <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & Temp_byte;
End Process LdbStbByteZext;
END ARCHITECTURE untitled;


--
-- VHDL Architecture ece411.AddressSplitter.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 17:31:02 06/07/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY AddressSplitter IS
   PORT( 
      Offset4 : OUT    LC3B_C_OFFSET;
      Index3  : OUT    LC3B_C_INDEX;
      Tag9    : OUT    LC3B_C_TAG;
      ADDRESS : IN     LC3b_word
   );

-- Declarations

END AddressSplitter ;

--

ARCHITECTURE untitled OF AddressSplitter IS
BEGIN
  AddressSplit: PROCESS (ADDRESS)
  BEGIN
    Tag9 <= ADDRESS (15 DOWNTO 7);
    Index3 <=  ADDRESS (6 DOWNTO 4);
    Offset4 <= ADDRESS (3 DOWNTO 0);
  END PROCESS;
END ARCHITECTURE untitled;


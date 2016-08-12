--
-- VHDL Architecture ece411.AddressCombiner1.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 23:19:32 08/02/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY AddressCombiner1 IS
   PORT( 
      DelTag  : IN     LC3b_C_tag;
      CombAdd : OUT    LC3b_word;
      Index3  : IN     LC3B_C_INDEX
   );

-- Declarations

END AddressCombiner1 ;

--
ARCHITECTURE untitled OF AddressCombiner1 IS
BEGIN
    CombAdd <= DelTag & INDEX3 & '0' & '0' & '0' & '0' after DELAY_MUX2;
END ARCHITECTURE untitled;


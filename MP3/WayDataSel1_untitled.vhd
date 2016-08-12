--
-- VHDL Architecture ece411.WayDataSel1.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 22:58:28 08/02/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WayDataSel1 IS
   PORT( 
      OffSelOut   : IN     LC3B_CC;
      WayDataLine : IN     LC3B_OWORD;
      DATAIN      : OUT    LC3b_word
   );

-- Declarations

END WayDataSel1 ;

--
ARCHITECTURE untitled OF WayDataSel1 IS
BEGIN
  DATAIN <= WayDataLine (((to_integer(unsigned(OffSelOut))+1)*16)-1 DOWNTO (16*to_integer(unsigned(OffSelOut))));-- ((to_integer(unsigned(OffSelOut & '0')) : ));
END ARCHITECTURE untitled;


--
-- VHDL Architecture ece411.OffsetSelector.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 00:03:46 06/09/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY OffsetSelector IS
   PORT( 
      Offset4   : IN     LC3B_C_OFFSET;
      OffSelOut : OUT    LC3b_CC
   );

-- Declarations

END OffsetSelector ;

--
ARCHITECTURE untitled OF OffsetSelector IS
BEGIN
  OffSel: PROCESS (OFFSET4)
  BEGIN
--  Variable OffSet3: LC3B_REG;
--  BEGIN
--  Offset3 := Offset4(3) & Offset4(2) & Offset4(1);
  OffSelOut <= Offset4(3) & Offset4(2) & Offset4(1);
  
END PROCESS;
END ARCHITECTURE untitled;


--
-- VHDL Architecture ece411.MemWTrigger.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 23:27:05 06/20/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MemWTrigger IS
   PORT( 
      MWriteAccess : IN     std_logic;
      MWTOut       : OUT    std_logic
   );

-- Declarations

END MemWTrigger ;

--
ARCHITECTURE untitled OF MemWTrigger IS
BEGIN
  MemTrigger: Process (MWriteAccess)
  BEGIN
  IF (MWriteAccess'event AND ((MWriteAccess = '1') AND (MWriteAccess'LAST_VALUE = '0'))) THEN
        -- MWriteAccess signal going active
      MWTOut <= '1';  
  ELSIF (MWriteAccess'event AND ((MWriteAccess = '0') AND (MWriteAccess'LAST_VALUE = '1'))) THEN
        -- MWriteAccess going inactive
      MWTOut <= '0';
  END IF;
END PROCESS;      
END ARCHITECTURE untitled;


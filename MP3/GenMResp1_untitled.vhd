--
-- VHDL Architecture ece411.GenMResp1.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 23:18:12 08/02/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY GenMResp1 IS
   PORT( 
      PMRESP_H : IN     STD_LOGIC;
      hit      : IN     STD_LOGIC;
      MRESP_H  : OUT    std_logic
   );

-- Declarations

END GenMResp1 ;

--
ARCHITECTURE untitled OF GenMResp1 IS
BEGIN
  GenMemResp: PROCESS (hit, pmresp_h)--, in_str)
  BEGIN
--  IF (in_str = '1') THEN
--    MRESP_H <= '1' after DELAY_MP22_MEM;
--  ELSE
  IF (not(hit) = '1') THEN  -- miss is 1 
    IF (pmresp_h = '1') THEN
      MRESP_H <= '1';
    else 
      mresp_h <= '0';
    END IF;
  ELSE--miss is 0 ; hit is 1 
    MRESP_H <= '1';  
  END IF;
--END IF; 
END PROCESS;
END ARCHITECTURE untitled;




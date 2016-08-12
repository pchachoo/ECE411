--
-- VHDL Architecture ece411.StallUnitPC.untitled
--
-- Created:
--          by - chachon2.ews (siebl-0222-12.ews.illinois.edu)
--          at - 12:03:39 08/12/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY StallUnitPC IS
-- Declarations
PORT( 
     
      --RESET_L     : IN     std_logic;
      I_MRESP_H   : IN     std_logic;  
      D_MRESP_H  : IN     std_logic;
      D_MREAD_L  : IN     std_logic;
      D_MWRITEL_L  : IN     std_logic; 
      D_MWRITEH_L  : IN     std_logic;
      opSTI_MEM : IN     std_logic;
      LDI_STI_MEM : IN     std_logic;
      Reg_input:      OUT std_logic;      
      Reg_output:      IN std_logic;
  --    Latch_Data:      OUT std_logic;
      LatchPipeData:      OUT std_logic     
);
END StallUnitPC ;

--
ARCHITECTURE untitled OF StallUnitPC IS

    signal LLD:std_logic;
    
BEGIN

      LLD <= (((D_MRESP_H AND (NOT LDI_STI_MEM )) 
                OR (D_MRESP_H AND (NOT Reg_output )))
                OR (D_MREAD_L AND D_MWRITEL_L AND D_MWRITEH_L)) AFTER 8ns;
    LatchPipeData <= I_MRESP_H AND LLD;-- AFTER 10ns;
    Reg_input <= (D_MRESP_H AND (NOT LDI_STI_MEM) )
                OR ((NOT LDI_STI_MEM) AND Reg_output)
                OR (Reg_output AND (NOT D_MRESP_H) )
                OR (D_MRESP_H AND (NOT Reg_output) ) AFTER 8ns;
END ARCHITECTURE untitled;


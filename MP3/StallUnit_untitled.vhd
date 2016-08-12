--
-- VHDL Architecture ece411.StallUnit.untitled
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 23:56:36 08/05/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY StallUnit IS
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
      Latch_Data:      OUT std_logic;
      LatchPipeData:      OUT std_logic     
);
END StallUnit ;

--
ARCHITECTURE untitled OF StallUnit IS

  signal a:std_logic;
   
  signal c:std_logic;
  signal B:std_logic;
  signal AA:std_logic;
  signal LLD:std_logic;
BEGIN
  

  a <= D_MRESP_H AND (NOT LDI_STI_MEM );
  c <= D_MRESP_H AND (NOT Reg_output );
  B<= (D_MREAD_L AND D_MWRITEL_L AND D_MWRITEH_L);
  AA <= A OR C;
  LLD <= AA OR B;
  
  Latch_Data <= (((D_MRESP_H AND (NOT LDI_STI_MEM )) 
                OR (D_MRESP_H AND (NOT Reg_output )))
                OR (D_MREAD_L AND D_MWRITEL_L AND D_MWRITEH_L)) AFTER 8ns;
  LatchPipeData <= I_MRESP_H AND Latch_Data AFTER 10ns;
  Reg_input <= (D_MRESP_H AND (NOT LDI_STI_MEM) )
                OR ((NOT LDI_STI_MEM) AND Reg_output)
                OR (Reg_output AND (NOT D_MRESP_H) )
                OR (D_MRESP_H AND (NOT Reg_output) ) AFTER 8ns;
  
END ARCHITECTURE untitled;


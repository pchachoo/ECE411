--
-- VHDL Architecture ece411.ForwardingUnit.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 22:20:15 08/08/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ForwardingUnit IS
  
   PORT(
-- Declarations
DestIR_MEM: IN LC3B_REG;
RegWrite_MEM: IN STD_LOGIC;
DestIR_WB: IN LC3B_REG;
RegWrite_WB: IN STD_LOGIC;
ImmSel_EX : IN STD_LOGIC;
WRITE_EX : IN STD_LOGIC;
DestIR_EX: IN LC3B_REG;
SrcA_EX: IN LC3B_REG;
SrcB_EX: IN LC3B_REG;
Mux1Sel : OUT STD_LOGIC;
Mux2Sel : OUT STD_LOGIC;
Mux3Sel : OUT STD_LOGIC;
MuxW1Sel : OUT STD_LOGIC;
MuxW2Sel : OUT STD_LOGIC;  
MuxW3Sel : OUT STD_LOGIC
 ); 
  END ForwardingUnit ;

--
ARCHITECTURE untitled OF ForwardingUnit IS
  SIGNAL A1:STD_LOGIC;
  SIGNAL B1:STD_LOGIC;
  SIGNAL C1:STD_LOGIC;
  
  SIGNAL A2:STD_LOGIC;
  SIGNAL B2:STD_LOGIC;
  SIGNAL C2:STD_LOGIC;
  
  SIGNAL A3:STD_LOGIC;
  SIGNAL B3:STD_LOGIC;
  SIGNAL C3:STD_LOGIC;
  
  SIGNAL RCA1:STD_LOGIC;
  SIGNAL RCB1:STD_LOGIC;
  SIGNAL RCC1:STD_LOGIC;
  
  SIGNAL RCA2:STD_LOGIC;
  SIGNAL RCB2:STD_LOGIC;
  SIGNAL RCC2:STD_LOGIC;
  
  SIGNAL RCA3:STD_LOGIC;
  SIGNAL RCB3:STD_LOGIC;
  SIGNAL RCC3:STD_LOGIC;

begin
  FUProcess: PROCESS (DestIR_MEM, RegWrite_MEM, DestIR_WB,RegWrite_WB,ImmSel_EX,WRITE_EX,DestIR_EX,SrcA_EX,SrcB_EX)
BEGIN
  IF ( SrcA_EX = DestIR_WB) then
    RCA1 <= '1';
  ELSE 
    RCA1 <= '0';
  END IF;
  A1 <=  RCA1 AND RegWrite_WB;
  
  
  if ( SrcA_EX = DestIR_MEM) then
  RCB1 <= '1';
  else 
  RCB1 <= '0';
  END IF;
  B1 <=  RCB1 NAND RegWrite_MEM;
  
  MuxW1Sel <= A1 AND B1;-- AFTER 5ns;
  
  IF ( SrcA_EX = DestIR_MEM) THEN
    RCC1 <= '1';--AFTER DELAY_COMPARE8; 
  else RCC1 <= '0';--AFTER DELAY_COMPARE8;
  END IF;
  C1 <=   RCC1 AND RegWrite_MEM;-- AFTER DELAY_LOGIC2;
  Mux1Sel <= C1 OR MuxW1Sel ;
  
  
  IF ( SrcB_EX = DestIR_WB) THEN
  RCA2 <= '1';
  else RCA2 <= '0';
  END IF;
  A2 <=   RCA2 AND RegWrite_WB AND (NOT ImmSel_EX);
  
  IF( SrcB_EX = DestIR_MEM) THEN
    RCB2 <= '1';
  else RCB2 <= '0';
  END IF;
  B2 <=   RCB2 NAND RegWrite_MEM;
  
  MuxW2Sel <= A2 AND B2 AFTER 5ns;
  
  IF( SrcB_EX = DestIR_MEM) THEN
     RCC2 <= '1';
  else RCC2 <= '0';
  END IF;
  C2 <=    RCC2 AND RegWrite_MEM AND (NOT ImmSel_EX);
  Mux2Sel <= C2 OR MuxW2Sel AFTER 5ns;
  
  
  IF ( DestIR_EX = DestIR_WB) THEN
  RCA3 <= '1' ;
    else RCA3 <= '0';
  END IF;
  A3 <=  RCA3 AND RegWrite_WB AND (NOT WRITE_EX);
  
  
  IF( DestIR_EX = DestIR_MEM) THEN
    RCB3 <= '1';
  else RCB3 <= '0';
  END IF;
  B3 <=  RCB3 NAND RegWrite_MEM;
  
  MuxW3Sel <= A3 AND B3 AFTER 5ns;
  
  IF( DestIR_EX = DestIR_MEM) THEN
  RCC3 <= '1';
  else RCC3 <= '0';
  END IF;
  C3 <=  RCC3 AND RegWrite_MEM AND (NOT WRITE_EX);
  Mux3Sel <= C3 OR MuxW3Sel AFTER 5ns;
  
end process FUProcess;

END ARCHITECTURE untitled;


--
-- VHDL Architecture ece411.HazardDetection.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 08:29:54 08/02/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY HazardDetection IS
   PORT( 
      clk : IN     std_logic;
      RESET_L : IN     std_logic;
      Read_EX  : IN     std_logic;
      SrcB_ID : IN     LC3B_REG;
      SrcA_ID : IN     LC3B_REG;
      DestIR_EX : IN     LC3B_REG;
      I_MRESP_H  : IN     std_logic; 
      D_MRESP_H  : IN     std_logic;
      D_MREAD_L  : IN     std_logic;
      D_MWRITEL_L  : IN     std_logic; 
      D_MWRITEH_L  : IN     std_logic;
      opSTI_MEM : IN     std_logic;
      LDI_STI_MEM : IN     std_logic;
      Branch_Sel: IN     std_logic;
      Zextsel_WB : IN     std_logic;
      latch_data : IN     std_logic;
      Stall:      OUT std_logic;
    
      NewInstr:      OUT std_logic
   );

-- Declarations

END HazardDetection ;

--
ARCHITECTURE untitled OF HazardDetection IS
signal temp1: std_logic;
signal temp2: std_logic;
signal temp3: std_logic;
signal tempStall: std_logic;
signal temp5: std_logic;
signal aaa: std_logic;
signal aaaa: std_logic;
signal aaaainv: std_logic;
--signal pre_stall : std_logic;
BEGIN

hdect: PROCESS (clk, RESET_L, Read_EX,SrcB_ID,SrcA_ID,DestIR_EX, D_MREAD_L, D_MWRITEH_L, D_MWRITEL_L, D_MResp_H)

BEGIN
    if ((Read_EX = '0') AND ((SrcA_ID = DestIR_EX)OR(SrcB_ID = DestIR_EX))) then
      tempStall <= '1';
    else
      tempStall <= '0';
    end if;

    --temp1 <= (not temp4 or Branch_Sel or Zextsel_WB ) and I_MRESP_H;
    aaaa <= tempStall;--((Read_EX = '0') AND ((SrcA_ID = DestIR_EX)OR(SrcB_ID = DestIR_EX)));   
    aaaainv <= not aaaa;
    aaa <= aaaainv or Branch_Sel or Zextsel_WB;
    
    if ((aaa = '1' and I_MRESP_H = '1') OR ((D_MResp_H = '1') and ((D_MREAD_L = '0') OR (D_MWRITEH_L = '0') OR (D_MWRITEL_L = '0')))) then
      temp1 <= '1';
  else temp1<= '0';
  end if;
    
    temp2 <= temp1 and latch_data; 
    temp3 <= ((clk)or not(clk'delayed(30ns)));
    temp5 <= temp2 or temp3;
    
end process hdect;

Stall <= tempStall;-- AFTER 12ns;
--LatchPipeData <= 
NewInstr <= temp5;-- AFTER 25ns; --23 delay
END ARCHITECTURE untitled;


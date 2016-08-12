--
-- VHDL Architecture ece411.Datapath.struct
--
-- Created:
--          by - chachon2.ews (linux-a1.ews.illinois.edu)
--          at - 01:10:24 07/19/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--LIBRARY ieee;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ID_EX IS
   PORT(
      ALUMuxSel_ID : IN LC3B_4MUX_SEL;
      ALUMemSel_ID : IN std_logic;
      ALUop_ID : IN LC3b_aluop;
      --AdjSel_ID : IN std_logic;
      --BaseSel_ID : IN std_logic;
      JSRSel_ID : IN std_logic;
      Branch_ID : IN std_logic;
      JSRRSel_ID : IN std_logic;
      PC_ID : IN lc3b_word;
      PCPlus2_ID : IN lc3b_word;
      RESET_L : IN std_logic;
      Read_ID : IN std_logic;
      RegWrite_ID : IN std_logic;
      SrcA_data_ID : IN LC3b_word;
      SrcB_data_ID : IN lc3b_word;
      STR_data_ID : IN lc3b_word;
      SetCC_ID : IN std_logic;
      ImmSel_ID : IN std_logic;
      Write_ID : IN std_logic;
      adj_offset6_ID : IN lc3b_word;
      adj_offset9_ID : IN lc3b_word;
      clk : IN std_logic;
      nzp_ID : IN lc3b_nzp;
      sext_imm5_ID : IN lc3b_word;
      sext_offset6_ID : IN lc3b_word;
      adj_offset11_ID : IN LC3b_word;
      Opcode_ID : IN LC3b_opcode;
      SrcA_ID : IN lc3b_reg;
      SrcB_ID : IN lc3b_reg;
      LatchPipeData : IN std_logic;
      LEAMuxSel_ID : IN std_logic;
 
      Branch_Sel : IN std_logic;
      LDI_STI_ID : IN std_logic;
      opSTI_ID : IN std_logic;
      
      destIR_ID : IN lc3b_reg;
      jump_ID : IN std_logic;
      TrapPCout_ID : IN LC3b_word;
      ZextSel_ID : IN std_logic;
      ZextSel_WB : IN std_logic;
      
      ALUMuxSel_EX : OUT LC3B_4MUX_SEL;
      ALUMemSel_EX : OUT std_logic;
      ALUop_EX : OUT LC3b_ALUop;
      --AdjSel_EX : OUT std_logic;
      --BaseSel_EX : OUT std_logic;
      Branch_EX : OUT std_logic;
      destIR_EX : OUT lc3b_reg;
      JSRRSel_EX : OUT std_logic;
      PC_EX : OUT lc3b_word;
      PCPlus2_EX : OUT lc3b_word;
      Read_EX : OUT std_logic;
      RegWrite_EX : OUT std_logic;
      SrcA_data_EX : OUT lc3b_word;
      SrcB_data_EX : OUT lc3b_word;
      STR_data_EX : OUT lc3b_word;
      SetCC_EX : OUT std_logic;
      ImmSel_EX : OUT std_logic;
      Write_EX : OUT std_logic;
      adj_imm5_EX : OUT lc3b_word;
      adj_offset6_EX : OUT lc3b_word;
      adj_offset9_EX : OUT lc3b_word;
      adj_offset11_EX : OUT lc3b_word;
      nzp_EX : OUT lc3b_nzp;
      sext_offset6_EX : OUT lc3b_word;
      Opcode_EX : OUT lc3b_opcode;
      SrcA_EX : OUT lc3b_reg;
      SrcB_EX : OUT lc3b_reg;
      LEAMuxSel_EX : OUT std_logic;
 
      LDI_STI_EX : OUT std_logic;
      opSTI_EX : OUT std_logic;
      
      JSRSel_EX : OUT std_logic;
      jump_EX : OUT std_logic;
      
      TrapPCout_EX : OUT lc3b_word;
      ZextSel_EX : OUT std_logic
      
   );

-- Declarations

END ID_EX ;

--
ARCHITECTURE untitled OF ID_EX IS

      SIGNAL Reg_ALUMuxSel_EX : LC3B_4MUX_SEL;
      SIGNAL Reg_ALUMemSel_EX : std_logic;
      SIGNAL Reg_ALUop_EX : lc3b_aluop;
      --SIGNAL Reg_AdjSel_EX : std_logic;
      --SIGNAL Reg_BaseSel_EX : std_logic;
      SIGNAL Reg_JSRSel_EX : std_logic;
      SIGNAL Reg_Branch_EX : std_logic;
      SIGNAL Reg_destIR_EX : lc3b_reg;
      SIGNAL Reg_JSRRSel_EX : std_logic;
      SIGNAL Reg_PC_EX : lc3b_word;
      SIGNAL Reg_PCPlus2_EX : lc3b_word;
      SIGNAL Reg_Read_EX : std_logic;
      SIGNAL Reg_RegWrite_EX : std_logic;
      SIGNAL Reg_SrcA_data_EX : lc3b_word;
      SIGNAL Reg_SrcB_data_EX : lc3b_word;
      SIGNAL Reg_STR_data_EX : lc3b_word;
      SIGNAL Reg_SetCC_EX : std_logic;
      SIGNAL Reg_ImmSel_EX : std_logic;
      SIGNAL Reg_Write_EX : std_logic;
      SIGNAL Reg_adj_imm5_EX : lc3b_word;
      SIGNAL Reg_adj_offset6_EX : lc3b_word;
      SIGNAL Reg_adj_offset9_EX : lc3b_word;
      SIGNAL Reg_adJ_offset11_EX : lc3b_word;
      SIGNAL Reg_nzp_EX : lc3b_nzp;
      SIGNAL Reg_sext_offset6_EX : lc3b_word;
      SIGNAL Reg_Opcode_EX : lc3b_opcode;
      SIGNAL Reg_SrcA_EX : lc3b_reg;
      SIGNAL Reg_SrcB_EX : lc3b_reg;
      SIGNAL Reg_LEAMuxSel_EX : std_logic;
      SIGNAL Reg_LDI_STI_EX : std_logic;
      SIGNAL Reg_opSTI_EX : std_logic;
      SIGNAL Reg_jump_EX : std_logic;
      SIGNAL Reg_TrapPCout_EX : lc3b_word;
      SIGNAL Reg_ZextSel_EX : std_logic;
      
BEGIN
  
  READ_REG : PROCESS (
Reg_ALUMuxSel_EX ,
Reg_ALUMemSel_EX,
Reg_ALUop_EX ,
--Reg_AdjSel_EX ,
--Reg_BaseSel_EX ,
Reg_JSRSel_EX ,
Reg_Branch_EX ,
Reg_destIR_EX ,
Reg_JSRRSel_EX ,
Reg_PC_EX ,
Reg_PCPLus2_EX ,
Reg_Read_EX ,
Reg_RegWrite_EX ,
Reg_SrcA_data_EX ,
Reg_SrcB_data_EX ,
Reg_STR_data_EX ,
Reg_SetCC_EX ,
Reg_ImmSel_EX ,
Reg_Write_EX ,
Reg_adj_imm5_EX ,
Reg_adj_offset6_EX ,
Reg_adj_offset9_EX ,
Reg_adj_offset11_EX ,
Reg_nzp_EX ,
Reg_sext_offset6_EX,
Reg_Opcode_EX,
Reg_SrcA_EX,
Reg_SrcB_EX,
Reg_LEAMuxSel_EX,
Reg_LDI_STI_EX,
Reg_opSTI_EX,
Reg_jump_EX,
Reg_TrapPCout_EX,
Reg_ZextSel_EX
  )
  BEGIN
    ALUMuxSel_EX <= Reg_ALUMuxSel_EX after delay_reg;
    ALUMemSel_ex  <= Reg_ALUMemSel_EX after delay_reg;
    ALUop_EX <= Reg_ALUop_EX after delay_reg;
    --AdjSel_EX <= Reg_AdjSel_EX after delay_reg;
    --BaseSel_EX <= Reg_BaseSel_EX after delay_reg;
    JSRSel_EX <= Reg_JSRSel_EX after delay_reg;
    Branch_EX <= Reg_Branch_EX after delay_reg;
    destIR_EX <= Reg_destIR_EX after delay_reg;
    JSRRSel_EX <= Reg_JSRRSel_EX after delay_reg;
    PC_EX <= Reg_PC_EX after delay_reg;
    PCPlus2_EX <= Reg_PCPlus2_EX after delay_reg;
    Read_EX <= Reg_Read_EX after delay_reg;
    RegWrite_EX <= Reg_RegWrite_EX after delay_reg;
    SrcA_data_EX <= Reg_SrcA_data_EX after delay_reg;
    SrcB_data_EX <= Reg_SrcB_data_EX after delay_reg;
    STR_data_EX <= Reg_STR_data_EX after delay_reg;
    SetCC_EX <= Reg_SetCC_EX after delay_reg;
    ImmSel_EX <= Reg_ImmSel_EX after delay_reg;
    Write_EX <= Reg_Write_EX after delay_reg;
    adj_imm5_EX <= Reg_adj_imm5_EX after delay_reg;
    adj_offset6_EX <= Reg_adj_offset6_EX after delay_reg;
    adj_offset9_EX <= Reg_adj_offset9_EX after delay_reg;
    adj_offset11_EX <= Reg_adj_offset11_EX after delay_reg;
    nzp_EX <= Reg_nzp_EX after delay_reg;
    sext_offset6_EX <= Reg_sext_offset6_EX after delay_reg;
    Opcode_EX <= Reg_Opcode_EX after delay_reg;
    SrcA_EX <= Reg_SrcA_EX after delay_reg;
    SrcB_EX <= Reg_SrcB_EX after delay_reg;
    LEAMuxSel_EX <= Reg_LEAMuxSel_EX after delay_reg;
    LDI_STI_EX <= Reg_LDI_STI_EX after delay_reg;
    opSTI_EX <= Reg_opSTI_EX after delay_reg;
    jump_EX <= Reg_jump_EX after delay_reg;
    TrapPCout_EX <= Reg_TrapPCout_EX after delay_reg;
    ZextSel_EX <= Reg_ZextSel_EX after delay_reg;
  END PROCESS READ_REG;

  WRITE_REG : PROCESS(CLK, RESET_L,ZextSel_WB,Branch_Sel,LatchPipeData)
  
  BEGIN
    IF (RESET_L = '0') THEN
      Reg_ALUMuxSel_EX <= "00";
      Reg_ALUMemSel_EX <= '0';
      Reg_ALUop_EX <= "000";
      --Reg_AdjSel_EX <= '0';
      --Reg_BaseSel_EX <= '0';
      Reg_JSRSel_EX <= '0';
      Reg_Branch_EX <= '0';
      Reg_destIR_EX <= "000";
      Reg_JSRRSel_EX <= '0';
      Reg_PC_EX <= "0000000000000000";
      Reg_PCPlus2_EX <= "0000000000000000";
      Reg_Read_EX <= '1';
      Reg_RegWrite_EX <= '0';
      Reg_SrcA_data_EX <= "0000000000000000";
      Reg_SrcB_data_EX <= "0000000000000000";
      Reg_STR_data_EX <= "0000000000000000";
      Reg_SetCC_EX <= '0';
      Reg_ImmSel_EX <= '0';
      Reg_Write_EX <= '1';
      Reg_adj_imm5_EX <= "0000000000000000";
      Reg_adj_offset6_EX <= "0000000000000000";
      Reg_adj_offset9_EX <= "0000000000000000";
      Reg_adj_offset11_EX <= "0000000000000000";
      Reg_nzp_EX <= "000";
      Reg_sext_offset6_EX <= "0000000000000000";
      Reg_Opcode_EX <= "0000";
      Reg_SrcA_EX <= "000";
      Reg_SrcB_EX <= "000";
      Reg_LEAMuxSel_EX <= '0';
      Reg_LDI_STI_EX <= '0';
      Reg_opSTI_EX <= '0';
      Reg_jump_EX <= '0';
      Reg_TrapPCout_EX <= "0000000000000000";
      Reg_ZextSel_EX <= '0';
    END IF;

IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0') AND ((ZextSel_WB = '1') OR (Branch_Sel = '1')) AND (LatchPipeData = '1' )) THEN
    
      Reg_ALUMuxSel_EX <= "00";
      Reg_ALUMemSel_EX <= '0';
      Reg_ALUop_EX <= "000";
      --Reg_AdjSel_EX <= '0';
      --Reg_BaseSel_EX <= '0';
      Reg_JSRSel_EX <= '0';
      Reg_Branch_EX <= '0';
      Reg_destIR_EX <= "000";
      Reg_JSRRSel_EX <= '0';
      Reg_PC_EX <= "0000000000000000";
      Reg_PCPlus2_EX <= "0000000000000000";
      Reg_Read_EX <= '1';
      Reg_RegWrite_EX <= '0';
      Reg_SrcA_data_EX <= "0000000000000000";
      Reg_SrcB_data_EX <= "0000000000000000";
      Reg_STR_data_EX <= "0000000000000000";
      Reg_SetCC_EX <= '0';
      Reg_ImmSel_EX <= '0';
      Reg_Write_EX <= '1';
      Reg_adj_imm5_EX <= "0000000000000000";
      Reg_adj_offset6_EX <= "0000000000000000";
      Reg_adj_offset9_EX <= "0000000000000000";
      Reg_adj_offset11_EX <= "0000000000000000";
      Reg_nzp_EX <= "000";
      Reg_sext_offset6_EX <= "0000000000000000";
      Reg_Opcode_EX <= "0000";
      Reg_SrcA_EX <= "000";
      Reg_SrcB_EX <= "000";
      Reg_LEAMuxSel_EX <= '0';
      Reg_LDI_STI_EX <= '0';
      Reg_opSTI_EX <= '0';
      Reg_jump_EX <= '0';
      Reg_TrapPCout_EX <= "0000000000000000";
      Reg_ZextSel_EX <= '0';
     

      ELSIF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0') AND (LatchPipeData = '1')) THEN
        
      Reg_ALUMuxSel_EX <= ALUMuxSel_ID ;
      Reg_ALUMemSel_EX <= ALUMemSel_ID ;
      
      Reg_ALUop_EX <= ALUop_ID ;
      --Reg_AdjSel_EX <= AdjSel_ID ;
      --Reg_BaseSel_EX <= BaseSel_ID ;
      Reg_JSRSel_EX <= JSRSel_ID ;
      Reg_Branch_EX <= Branch_ID ;
      Reg_destIR_EX <= destIR_ID ;
      Reg_JSRRSel_EX <= JSRRSel_ID ;
      Reg_PC_EX <= PC_ID ;
      Reg_PCPlus2_EX <= PCPlus2_ID ;
      Reg_Read_EX <= Read_ID ;
      Reg_RegWrite_EX <= RegWrite_ID ;
      Reg_SrcA_data_EX <= SrcA_data_ID ;
      Reg_SrcB_data_EX <= SrcB_data_ID ;
      Reg_STR_data_EX <= STR_data_ID ;
      Reg_SetCC_EX <= SetCC_ID ;
      Reg_ImmSel_EX <= ImmSel_ID ;
      Reg_Write_EX <= Write_ID ;
      Reg_adj_imm5_EX <= sext_imm5_ID ;
      Reg_adj_offset6_EX <= adj_offset6_ID ;
      Reg_adj_offset9_EX <= adj_offset9_ID ;
      Reg_adj_offset11_EX <= adj_offset11_ID ;
      Reg_nzp_EX <= nzp_ID ;
      Reg_sext_offset6_EX <= sext_offset6_ID ;
      Reg_Opcode_EX <= Opcode_ID;
      Reg_SrcA_EX <= SrcA_ID;
      Reg_SrcB_EX <= SrcB_ID;
      Reg_LEAMuxSel_EX <= LEAMuxSel_ID;
      Reg_LDI_STI_EX <= LDI_STI_ID;
      Reg_opSTI_EX <= opSTI_ID;
      Reg_jump_EX <= jump_ID;
      Reg_TrapPCout_EX <= TrapPCout_ID;
      Reg_ZextSel_EX <= ZextSel_ID;
    END IF;
  END PROCESS WRITE_REG;
END ARCHITECTURE untitled;
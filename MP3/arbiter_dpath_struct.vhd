-- VHDL Entity ece411.Arbiter_dpath.symbol
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 19:15:41 08/07/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Arbiter_dpath IS
   PORT( 
      arbitersel   : IN     std_logic  := '0';
      d_PMaddress  : IN     LC3B_WORD;
      i_PMaddress  : IN     LC3B_WORD;
      D_PMREAD_L   : IN     std_logic;
      ArbPMADDRESS : OUT    LC3B_WORD;
      D_PMDATAOUT  : IN     LC3B_oWORD;
      I_PMREAD_L   : IN     std_logic;
      ArbPMREAD_L  : OUT    std_logic;
      ArbPMDATAOUT : OUT    LC3B_oWORD;
      ArbPMWRITE_L : OUT    std_logic;
      D_PMWRITE_L  : IN     std_logic;
      ArbPMRESP_H  : IN     std_logic;
      ArbPMDATAIN  : IN     LC3B_oWORD;
      I_PMRESP_H   : OUT    std_logic;
      D_PMRESP_H   : OUT    std_logic;
      I_PMDATAIN   : OUT    LC3B_oWORD;
      D_PMDATAIN   : OUT    LC3B_oWORD
   );

-- Declarations

END Arbiter_dpath ;

--
-- VHDL Architecture ece411.Arbiter_dpath.struct
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 19:15:42 08/07/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF Arbiter_dpath IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL I_PMDATAOUT_CONSTANT : LC3B_oWORD;
   SIGNAL I_PMWRITE_L          : std_logic;


   -- Component Declarations
   COMPONENT DEMUX2
   PORT (
      F   : IN     std_logic;
      Sel : IN     std_logic;
      A   : OUT    std_logic;
      B   : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT DEMUX2_128
   PORT (
      F   : IN     lc3b_oword;
      Sel : IN     std_logic;
      A   : OUT    lc3b_oword;
      B   : OUT    lc3b_oword
   );
   END COMPONENT;
   COMPONENT OWordMux2
   PORT (
      A   : IN     LC3b_OWORD ;
      B   : IN     LC3b_OWORD ;
      Sel : IN     std_logic ;
      F   : OUT    LC3b_OWORD 
   );
   END COMPONENT;
   COMPONENT MUX2_1
   PORT (
      A   : IN     STD_LOGIC ;
      B   : IN     STD_LOGIC ;
      SEL : IN     STD_LOGIC ;
      F   : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT MUX2_16
   PORT (
      A   : IN     LC3B_WORD ;
      B   : IN     LC3B_WORD ;
      SEL : IN     STD_LOGIC ;
      F   : OUT    LC3B_WORD 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : DEMUX2 USE ENTITY ece411.DEMUX2;
   FOR ALL : DEMUX2_128 USE ENTITY ece411.DEMUX2_128;
   FOR ALL : MUX2_1 USE ENTITY mp3lib.MUX2_1;
   FOR ALL : MUX2_16 USE ENTITY mp3lib.MUX2_16;
   FOR ALL : OWordMux2 USE ENTITY ece411.OWordMux2;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   -- eb1 1   
   I_PMDATAOUT_CONSTANT <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";                                     

   -- HDL Embedded Text Block 2 eb2
   -- eb2 2   
   I_PMWRITE_L <= '1';                                     


   -- Instance port mappings.
   U_5 : DEMUX2
      PORT MAP (
         F   => ArbPMRESP_H,
         Sel => arbitersel,
         A   => I_PMRESP_H,
         B   => D_PMRESP_H
      );
   U_6 : DEMUX2_128
      PORT MAP (
         F   => ArbPMDATAIN,
         Sel => arbitersel,
         A   => I_PMDATAIN,
         B   => D_PMDATAIN
      );
   U_2 : OWordMux2
      PORT MAP (
         A   => I_PMDATAOUT_CONSTANT,
         B   => D_PMDATAOUT,
         Sel => arbitersel,
         F   => ArbPMDATAOUT
      );
   U_1 : MUX2_1
      PORT MAP (
         A   => I_PMREAD_L,
         B   => D_PMREAD_L,
         SEL => arbitersel,
         F   => ArbPMREAD_L
      );
   U_7 : MUX2_1
      PORT MAP (
         A   => I_PMWRITE_L,
         B   => D_PMWRITE_L,
         SEL => arbitersel,
         F   => ArbPMWRITE_L
      );
   U_0 : MUX2_16
      PORT MAP (
         A   => i_PMaddress,
         B   => d_PMaddress,
         SEL => arbitersel,
         F   => ArbPMADDRESS
      );

END struct;

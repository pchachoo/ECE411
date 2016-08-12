--
-- VHDL Architecture ece411.Arbiter_dpath.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 15:46:29 08/02/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Arbiter IS
   PORT( 
      ArbiterSel   : IN     std_logic;
      D_ADDRESS    : IN     LC3B_WORD;
      D_DATAOUT    : IN     LC3b_oword;
      D_MREAD_L    : IN     std_logic;
      D_MWRITE_L   : IN     STD_LOGIC;
      I_ADDRESS    : IN     LC3B_WORD;
      I_MREAD_L    : IN     std_logic;
      L2_DATAIN    : IN     LC3B_OWORD;
      L2_MRESP_H   : IN     std_logic;
      D_DATAIN     : OUT    LC3B_OWORD;
      D_L2_MRESP_H : OUT    std_logic;
      I_DATAIN     : OUT    LC3B_OWORD;
      I_L2_MRESP_H : OUT    std_logic;
      L2_ADDRESS   : OUT    LC3B_WORD;
      L2_DATAOUT   : OUT    LC3b_oword;
      MREAD_L      : OUT    std_logic;
      MWRITE_L     : OUT    STD_LOGIC
   );

-- Declarations

END Arbiter ;

ARCHITECTURE untitled OF Arbiter IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL A1              : std_logic;
   SIGNAL I_DATAOUT_CONST : LC3B_OWORD;


   -- Component Declarations
   COMPONENT DEMUX2_1
   PORT (
      F   : IN     std_logic ;
      Sel : IN     std_logic ;
      A   : OUT    std_logic ;
      B   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT DEMUX2_128
   PORT (
      F   : IN     LC3B_OWORD ;
      Sel : IN     std_logic ;
      A   : OUT    LC3B_OWORD ;
      B   : OUT    LC3B_OWORD 
   );
   END COMPONENT;
   COMPONENT OWordMux2
   PORT (
      A   : IN     LC3b_oword ;
      B   : IN     LC3b_oword ;
      Sel : IN     std_logic ;
      F   : OUT    LC3b_oword 
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
   FOR ALL : DEMUX2_1 USE ENTITY ece411.DEMUX2_1;
   FOR ALL : DEMUX2_128 USE ENTITY ece411.DEMUX2_128;
   FOR ALL : MUX2_1 USE ENTITY mp3lib.MUX2_1;
   FOR ALL : MUX2_16 USE ENTITY mp3lib.MUX2_16;
   FOR ALL : OWordMux2 USE ENTITY ece411.OWordMux2;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   I_DATAOUT_CONST <= x"00000000000000000000000000000000";                             


   -- ModuleWare code(v1.9) for instance 'I_WRITE_1' of 'constval'
   A1 <= '1';

   -- Instance port mappings.
   U_1 : DEMUX2_1
      PORT MAP (
         F   => L2_MRESP_H,
         Sel => ArbiterSel,
         A   => I_L2_MRESP_H,
         B   => D_L2_MRESP_H
      );
   U_5 : DEMUX2_128
      PORT MAP (
         F   => L2_DATAIN,
         Sel => ArbiterSel,
         A   => I_DATAIN,
         B   => D_DATAIN
      );
   U_4 : OWordMux2
      PORT MAP (
         A   => I_DATAOUT_CONST,
         B   => D_DATAOUT,
         Sel => ArbiterSel,
         F   => L2_DATAOUT
      );
   U_2 : MUX2_1
      PORT MAP (
         A   => A1,
         B   => D_MWRITE_L,
         SEL => ArbiterSel,
         F   => MWRITE_L
      );
   U_3 : MUX2_1
      PORT MAP (
         A   => I_MREAD_L,
         B   => D_MREAD_L,
         SEL => ArbiterSel,
         F   => MREAD_L
      );
   U_0 : MUX2_16
      PORT MAP (
         A   => I_ADDRESS,
         B   => D_ADDRESS,
         SEL => ArbiterSel,
         F   => L2_ADDRESS
      );

END untitled;


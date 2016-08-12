-- VHDL Entity ece411.mp3_CPU.symbol
--
-- Created:
--          by - chachon2.ews (siebl-0222-02.ews.illinois.edu)
--          at - 16:59:33 08/12/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY mp3_CPU IS
-- Declarations

END mp3_CPU ;

--
-- VHDL Architecture ece411.mp3_CPU.struct
--
-- Created:
--          by - chachon2.ews (siebl-0222-02.ews.illinois.edu)
--          at - 16:59:33 08/12/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF mp3_CPU IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL D_DATAIN    : LC3B_WORD;
   SIGNAL D_DATAOUT   : LC3B_WORD;
   SIGNAL D_MREAD_L   : STD_LOGIC := '1';
   SIGNAL D_MRESP_H   : STD_LOGIC := '0';
   SIGNAL D_MWRITEH_L : STD_LOGIC := '1';
   SIGNAL D_MWRITEL_L : STD_LOGIC := '1';
   SIGNAL D_address   : LC3B_WORD;
   SIGNAL I_ADDRESS   : LC3B_WORD;
   SIGNAL I_DATAIN    : LC3B_WORD;
   SIGNAL I_MREAD_L   : STD_LOGIC := '1';
   SIGNAL I_MRESP_H   : STD_LOGIC := '0';
   SIGNAL RESET_L     : std_logic;
   SIGNAL clk         : std_logic := '0';


   -- Component Declarations
   COMPONENT CLKgen
   PORT (
      clk : INOUT  std_logic  := '0'
   );
   END COMPONENT;
   COMPONENT MagicMemory
   PORT (
      CLK         : IN     STD_LOGIC ;
      D_ADDRESS   : IN     LC3b_word ;
      D_DATAOUT   : IN     LC3b_word ;
      D_MREAD_L   : IN     std_logic ;
      D_MWRITEH_L : IN     std_logic ;
      D_MWRITEL_L : IN     std_logic ;
      I_ADDRESS   : IN     LC3b_word ;
      I_MREAD_L   : IN     std_logic ;
      RESET_L     : IN     STD_LOGIC ;
      D_DATAIN    : OUT    LC3B_WORD ;
      D_MRESP_H   : OUT    STD_LOGIC ;
      I_DATAIN    : OUT    LC3b_word ;
      I_MRESP_H   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT PIPELINED_Datapath
   PORT (
      D_MRESP_H   : IN     std_logic  := '0';
      --RESET_L     : IN     std_logic;
      I_MRESP_H   : IN     std_logic  := '0';
      RESET_L     : IN     std_logic ;
      clk         : IN     std_logic ;
      d_datain    : IN     LC3b_word ;
      i_datain    : IN     LC3b_word ;
      D_MREAD_L   : OUT    std_logic  := '1';
      D_MWRITEH_L : OUT    std_logic  := '1';
      D_MWRITEL_L : OUT    std_logic  := '1';
      D_dataout   : OUT    LC3b_word ;
      I_MREAD_L   : OUT    std_logic  := '1';
      I_address   : OUT    LC3B_WORD ;
      d_address   : OUT    LC3B_WORD 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : CLKgen USE ENTITY ece411.CLKgen;
   FOR ALL : MagicMemory USE ENTITY ece411.MagicMemory;
   FOR ALL : PIPELINED_Datapath USE ENTITY ece411.PIPELINED_Datapath;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   CLKgen1 : CLKgen
      PORT MAP (
         clk => clk
      );
   MMDRAM : MagicMemory
      PORT MAP (
         CLK         => clk,
         D_ADDRESS   => D_address,
         D_DATAOUT   => D_DATAOUT,
         D_MREAD_L   => D_MREAD_L,
         D_MWRITEH_L => D_MWRITEH_L,
         D_MWRITEL_L => D_MWRITEL_L,
         I_ADDRESS   => I_ADDRESS,
         I_MREAD_L   => I_MREAD_L,
         RESET_L     => RESET_L,
         D_DATAIN    => D_DATAIN,
         D_MRESP_H   => D_MRESP_H,
         I_DATAIN    => I_DATAIN,
         I_MRESP_H   => I_MRESP_H
      );
   PP_DP : PIPELINED_Datapath
      PORT MAP (
         D_MRESP_H   => D_MRESP_H,
         I_MRESP_H   => I_MRESP_H,
         RESET_L     => RESET_L,
         clk         => clk,
         d_datain    => D_DATAIN,
         i_datain    => I_DATAIN,
         D_MREAD_L   => D_MREAD_L,
         D_MWRITEH_L => D_MWRITEH_L,
         D_MWRITEL_L => D_MWRITEL_L,
         D_dataout   => D_DATAOUT,
         I_MREAD_L   => I_MREAD_L,
         I_address   => I_ADDRESS,
         d_address   => D_address
      );

END struct;

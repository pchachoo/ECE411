-- VHDL Entity ece411.MagicMemory.symbol
--
-- Created:
--          by - chachon2.ews (siebl-0222-02.ews.illinois.edu)
--          at - 16:59:31 08/12/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MagicMemory IS
   PORT( 
      CLK         : IN     STD_LOGIC;
      D_ADDRESS   : IN     LC3b_word;
      D_DATAOUT   : IN     LC3b_word;
      D_MREAD_L   : IN     std_logic;
      D_MWRITEH_L : IN     std_logic;
      D_MWRITEL_L : IN     std_logic;
      I_ADDRESS   : IN     LC3b_word;
      I_MREAD_L   : IN     std_logic;
      RESET_L     : IN     STD_LOGIC;
      D_DATAIN    : OUT    LC3B_WORD;
      D_MRESP_H   : OUT    STD_LOGIC;
      I_DATAIN    : OUT    LC3b_word;
      I_MRESP_H   : OUT    std_logic
   );

-- Declarations

END MagicMemory ;

--
-- VHDL Architecture ece411.MagicMemory.struct
--
-- Created:
--          by - chachon2.ews (siebl-0222-02.ews.illinois.edu)
--          at - 16:59:32 08/12/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF MagicMemory IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ArbPMADDRESS : LC3B_WORD;
   SIGNAL ArbPMDATAIN  : LC3B_oWORD;
   SIGNAL ArbPMDATAOUT : LC3B_oWORD;
   SIGNAL ArbPMREAD_L  : std_logic;
   SIGNAL ArbPMRESP_H  : std_logic;
   SIGNAL ArbPMWRITE_L : std_logic;
   SIGNAL D_PMADDRESS  : LC3B_WORD;
   SIGNAL D_PMDATAIN   : LC3B_OWORD;
   SIGNAL D_PMDATAOUT  : LC3B_OWORD;
   SIGNAL D_PMREAD_L   : STD_LOGIC;
   SIGNAL D_PMRESP_H   : STD_LOGIC;
   SIGNAL D_PMWRITE_L  : STD_LOGIC;
   SIGNAL I_DATAOUT    : LC3b_word;
   SIGNAL I_MWRITEH_L  : std_logic;
   SIGNAL I_MWRITEL_L  : std_logic;
   SIGNAL I_PMADDRESS  : LC3B_WORD;
   SIGNAL I_PMDATAIN   : LC3B_OWORD;
   SIGNAL I_PMDATAOUT  : LC3B_OWORD;
   SIGNAL I_PMREAD_L   : STD_LOGIC;
   SIGNAL I_PMRESP_H   : STD_LOGIC;
   SIGNAL I_PMWRITE_L  : STD_LOGIC;
   SIGNAL Way0Write    : STD_LOGIC;
   SIGNAL Way1Write    : STD_LOGIC;


   -- Component Declarations
   COMPONENT Arbiter
   PORT (
      CLK          : IN     STD_LOGIC ;
      RESET_L      : IN     STD_LOGIC ;
      D_PMREAD_L   : IN     STD_LOGIC ;
      D_PMWRITE_L  : IN     STD_LOGIC ;
      I_PMREAD_L   : IN     STD_LOGIC ;
      ArbPMADDRESS : OUT    LC3B_WORD ;
      ArbPMDATAOUT : OUT    LC3B_oWORD ;
      ArbPMREAD_L  : OUT    std_logic ;
      ArbPMWRITE_L : OUT    std_logic ;
      D_PMDATAIN   : OUT    LC3B_oWORD ;
      D_PMRESP_H   : OUT    std_logic ;
      I_PMDATAIN   : OUT    LC3B_oWORD ;
      I_PMRESP_H   : OUT    std_logic ;
      ArbPMDATAIN  : IN     LC3B_oWORD ;
      ArbPMRESP_H  : IN     std_logic ;
      d_PMaddress  : IN     LC3B_WORD ;
      D_PMDATAOUT  : IN     LC3B_oWORD ;
      i_PMaddress  : IN     LC3B_WORD 
   );
   END COMPONENT;
   COMPONENT DCache
   PORT (
      CLK         : IN     STD_LOGIC ;
      D_ADDRESS   : IN     LC3b_word ;
      D_DATAOUT   : IN     LC3b_word ;
      D_MREAD_L   : IN     std_logic ;
      D_MWRITEH_L : IN     std_logic ;
      D_MWRITEL_L : IN     std_logic ;
      D_PMDATAIN  : IN     LC3B_OWORD ;
      D_PMRESP_H  : IN     STD_LOGIC ;
      RESET_L     : IN     STD_LOGIC ;
      Way0Write   : IN     STD_LOGIC ;
      Way1Write   : IN     STD_LOGIC ;
      D_DATAIN    : OUT    LC3B_WORD ;
      D_MRESP_H   : OUT    STD_LOGIC ;
      D_PMADDRESS : OUT    LC3B_WORD ;
      D_PMDATAOUT : OUT    LC3B_OWORD ;
      D_PMREAD_L  : OUT    STD_LOGIC ;
      D_PMWRITE_L : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT ICache
   PORT (
      CLK         : IN     STD_LOGIC ;
      I_ADDRESS   : IN     LC3b_word ;
      I_DATAOUT   : IN     LC3b_word ;
      I_MREAD_L   : IN     std_logic ;
      I_MWRITEH_L : IN     std_logic ;
      I_MWRITEL_L : IN     std_logic ;
      I_PMDATAIN  : IN     LC3B_OWORD ;
      I_PMRESP_H  : IN     STD_LOGIC ;
      RESET_L     : IN     STD_LOGIC ;
      Way0Write   : IN     STD_LOGIC ;
      Way1Write   : IN     STD_LOGIC ;
      I_DATAIN    : OUT    LC3b_word ;
      I_MRESP_H   : OUT    std_logic ;
      I_PMADDRESS : OUT    LC3B_WORD ;
      I_PMDATAOUT : OUT    LC3B_OWORD ;
      I_PMREAD_L  : OUT    STD_LOGIC ;
      I_PMWRITE_L : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT PDRAM
   PORT (
      clk       : IN     std_logic ;
      PMDATAOUT : IN     LC3B_OWORD ;
      PMREAD_L  : IN     STD_LOGIC ;
      PMWRITE_L : IN     STD_LOGIC ;
      RESET_L   : IN     std_logic ;
      PMDATAIN  : OUT    LC3B_OWORD ;
      PMRESP_H  : OUT    STD_LOGIC ;
      PMADDRESS : IN     LC3B_WORD 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : Arbiter USE ENTITY ece411.Arbiter;
   FOR ALL : DCache USE ENTITY ece411.DCache;
   FOR ALL : ICache USE ENTITY ece411.ICache;
   FOR ALL : PDRAM USE ENTITY ece411.PDRAM;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   aArbiter : Arbiter
      PORT MAP (
         CLK          => CLK,
         RESET_L      => RESET_L,
         D_PMREAD_L   => D_PMREAD_L,
         D_PMWRITE_L  => D_PMWRITE_L,
         I_PMREAD_L   => I_PMREAD_L,
         ArbPMADDRESS => ArbPMADDRESS,
         ArbPMDATAOUT => ArbPMDATAOUT,
         ArbPMREAD_L  => ArbPMREAD_L,
         ArbPMWRITE_L => ArbPMWRITE_L,
         D_PMDATAIN   => D_PMDATAIN,
         D_PMRESP_H   => D_PMRESP_H,
         I_PMDATAIN   => I_PMDATAIN,
         I_PMRESP_H   => I_PMRESP_H,
         ArbPMDATAIN  => ArbPMDATAIN,
         ArbPMRESP_H  => ArbPMRESP_H,
         d_PMaddress  => D_PMADDRESS,
         D_PMDATAOUT  => D_PMDATAOUT,
         i_PMaddress  => I_PMADDRESS
      );
   aDCache : DCache
      PORT MAP (
         CLK         => CLK,
         D_ADDRESS   => D_ADDRESS,
         D_DATAOUT   => D_DATAOUT,
         D_MREAD_L   => D_MREAD_L,
         D_MWRITEH_L => D_MWRITEH_L,
         D_MWRITEL_L => D_MWRITEL_L,
         D_PMDATAIN  => D_PMDATAIN,
         D_PMRESP_H  => D_PMRESP_H,
         RESET_L     => RESET_L,
         Way0Write   => Way0Write,
         Way1Write   => Way1Write,
         D_DATAIN    => D_DATAIN,
         D_MRESP_H   => D_MRESP_H,
         D_PMADDRESS => D_PMADDRESS,
         D_PMDATAOUT => D_PMDATAOUT,
         D_PMREAD_L  => D_PMREAD_L,
         D_PMWRITE_L => D_PMWRITE_L
      );
   aICache : ICache
      PORT MAP (
         CLK         => CLK,
         I_ADDRESS   => I_ADDRESS,
         I_DATAOUT   => I_DATAOUT,
         I_MREAD_L   => I_MREAD_L,
         I_MWRITEH_L => I_MWRITEH_L,
         I_MWRITEL_L => I_MWRITEL_L,
         I_PMDATAIN  => I_PMDATAIN,
         I_PMRESP_H  => I_PMRESP_H,
         RESET_L     => RESET_L,
         Way0Write   => Way0Write,
         Way1Write   => Way1Write,
         I_DATAIN    => I_DATAIN,
         I_MRESP_H   => I_MRESP_H,
         I_PMADDRESS => I_PMADDRESS,
         I_PMDATAOUT => I_PMDATAOUT,
         I_PMREAD_L  => I_PMREAD_L,
         I_PMWRITE_L => I_PMWRITE_L
      );
   PhyMem : PDRAM
      PORT MAP (
         clk       => CLK,
         PMDATAOUT => ArbPMDATAOUT,
         PMREAD_L  => ArbPMREAD_L,
         PMWRITE_L => ArbPMWRITE_L,
         RESET_L   => RESET_L,
         PMDATAIN  => ArbPMDATAIN,
         PMRESP_H  => ArbPMRESP_H,
         PMADDRESS => ArbPMADDRESS
      );

END struct;
--
-- VHDL Architecture ece411.IR.UNTITLED
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 16:45:12 05/22/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY p_IR IS
   PORT( 
      --Branch_ID : IN     std_logic;
     -- MDRout    : IN     LC3b_word;
      clk       : IN     std_logic;
      RESET_L   : IN     std_logic;
      PCIn      : IN      LC3b_word;
      datain    : IN       LC3b_word;
      
      jump_EX : IN std_logic;
      ZextSel_WB : IN std_logic;
      Branch_Sel : IN std_logic;

 --     MRESP_H   : IN      std_logic;
      MemREAD_L   : OUT     std_logic;
      --FETCH     : OUT     std_logic;
      InstrOut  : OUT    lc3b_word;
      PCOut     : OUT      LC3b_word;
      MemResp_H:   IN std_logic;
      --address   : OUT     LC3B_WORD;
       ADDR   : OUT     LC3B_WORD
    
   );

-- Declarations

END p_IR ;

--
ARCHITECTURE UNTITLED OF p_IR IS
--SIGNAL VAL_IR : LC3B_WORD;
BEGIN
	------------------------------
	VHDL_REG_IR : PROCESS (CLK, RESET_L, PCIN, DATAIN, MemRESP_H,jump_EX,ZextSel_WB,Branch_Sel)
--	------------------------------
	BEGIN
--		--IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
--
--		  --ADDRESS <= PCIN; -- send address to memory
--		  --MREAD_L <= '0' AFTER 0 NS, '1' AFTER CLOCK_PERIOD; --tell memory to read
--			--IF (LOADIR = '1') THEN
--				--VAL_IR <= MDROUT AFTER DELAY_REG;
--				--InstrOut <= MDROUT AFTER DELAY_REG;
--				--LoadIROut <= LoadIR AFTER DELAY_REG;
--				--PCOut <= PCIn AFTER DELAY_REG;
--			--END IF;
--		--END IF;
	--IF 	(RESET_L = '0') THEN
	  
	  --InstrOut <= "0000000000000000"; 
	--else 
	
--IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
	  ADDR <= pcin;
		MemREAD_L <= '0';--AFTER 0 NS , '1' AFTER CLOCK_PERIOD;
		if (MemResp_H = '1') then
	   	     
	     if ((jump_EX = '1') or (ZextSel_WB = '1') or (Branch_Sel ='1')) then
	       InstrOut <= "0000000000000000";
	     else
	       InstrOut <= DATAIN;
	      END IF;

	 
	     PCOut <= PCIn;
	   END IF;
--END IF;
	
END PROCESS VHDL_REG_IR;

END UNTITLED;


--
-- VHDL Architecture ece411.ALU.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 16:50:02 05/22/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ALU IS
   PORT( 
      ALUop     : IN     LC3b_aluop;
      RFAout    : IN     LC3b_word;
      clk       : IN     std_logic;
      ALUout    : OUT    LC3b_word;
      ALUMuxout : IN     LC3b_word
   );

-- Declarations

END ALU ;

--
ARCHITECTURE UNTITLED OF ALU IS
BEGIN
	----------------------------------------
	VHDL_ALU : PROCESS (RFAOUT, ALUMUXOUT, ALUOP)--, OpImmBit)
	----------------------------------------
	VARIABLE TEMP_ALUOUT : LC3B_WORD;
	BEGIN
		-- CHECK FOR ALU OPERATION TYPE, AND EXECUTE
		CASE ALUOP IS
			WHEN ALU_ADD =>
	--		  IF (OpImmBit = '0') THEN
			   TEMP_ALUOUT := STD_LOGIC_VECTOR(SIGNED(RFAOUT) + SIGNED(ALUMUXOUT));
	--		  ELSE
	--		   TEMP_ALUOUT := STD_LOGIC_VECTOR(SIGNED(RFAOUT)+ (ALUMUXOUT(4)& ALUMUXOUT(4)& ALUMUXOUT(4)& ALUMUXOUT(4)& ALUMUXOUT(4) & ALUMUXOUT(4)& ALUMUXOUT(4)& ALUMUXOUT(4)& ALUMUXOUT(4)& ALUMUXOUT(4)& ALUMUXOUT(4)& ALUMUXOUT(4)& ALUMUXOUT(3)& ALUMUXOUT(2)& ALUMUXOUT(1)& ALUMUXOUT(0)));
	--		 END IF;
--	    WHEN ALU_JMP =>
--	      TEMP_ALUOUT := RFAOUT;
			WHEN ALU_AND =>
				TEMP_ALUOUT := (RFAOUT AND ALUMUXOUT);
			WHEN ALU_NOT =>
				TEMP_ALUOUT := (RFAOUT XOR "1111111111111111");
			WHEN ALU_PASS =>
				TEMP_ALUOUT := (RFAOUT);

			WHEN OTHERS =>
			  TEMP_ALUOUT := RFAOUT;
		END CASE;
	--SET OUTPUT VALUE ALUOUT TO BE THE TEMPORARY VALUE CALCULATED WITHIN THE PROCESS AFTER A DELAY
	ALUOUT <= TEMP_ALUOUT AFTER DELAY_ALU;
	END PROCESS VHDL_ALU;
END UNTITLED;


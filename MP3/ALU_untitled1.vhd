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

ENTITY p_ALU IS
   PORT( 
      ALUop     : IN     LC3b_aluop;
      RFAout    : IN     LC3b_word;
      clk       : IN     std_logic;
      ALUout    : OUT    LC3b_word;
 --     ALUoutn    : OUT    std_logic;
--      ALUoutz    : OUT    std_logic;
--      ALUoutp    : OUT    std_logic;
      ALUMuxout : IN     LC3b_word
   );

-- Declarations

END p_ALU ;

--
ARCHITECTURE UNTITLED OF p_ALU IS
BEGIN
	----------------------------------------
	VHDL_ALU : PROCESS (RFAOUT, ALUMUXOUT, ALUOP)
	----------------------------------------
	VARIABLE TEMP_ALUOUT : LC3B_WORD;
	VARIABLE COUNT : INTEGER;
	BEGIN
		-- CHECK FOR ALU OPERATION TYPE, AND EXECUTE
		CASE ALUOP IS
			WHEN ALU_ADD =>
			   TEMP_ALUOUT := STD_LOGIC_VECTOR(SIGNED(RFAOUT) + SIGNED(ALUMUXOUT));
			WHEN ALU_AND =>
				TEMP_ALUOUT := (RFAOUT AND ALUMUXOUT);
			WHEN ALU_NOT =>
				TEMP_ALUOUT := (RFAOUT XOR "1111111111111111");
			WHEN ALU_PASS =>
				TEMP_ALUOUT := (RFAOUT);
				
			WHEN ALU_SLL =>
			  TEMP_ALUOUT := std_logic_vector("sll"(unsigned(RFAout), to_integer(unsigned(ALUMUXOUT(3 downto 0))))); 
			WHEN ALU_SRL =>
			  TEMP_ALUOUT := std_logic_vector("srl"(unsigned(RFAout), to_integer(unsigned(ALUMUXOUT(3 downto 0)))));	
  			WHEN ALU_SRA =>
			  COUNT := to_integer(unsigned(ALUMUXOUT(3 downto 0)));
        if (ALUMUXOUT(3 downto 0) = "0000") then
          TEMP_ALUOUT := RFAout; --Perform no shifting
        else
          TEMP_ALUOUT(15 - COUNT downto 0) := RFAout(15 downto COUNT);
          TEMP_ALUOUT(15 downto (15 - COUNT + 1)) := (others => RFAout(15));
        end if;
	
			WHEN OTHERS =>
			  TEMP_ALUOUT := RFAOUT;
		END CASE;
	--SET OUTPUT VALUE ALUOUT TO BE THE TEMPORARY VALUE CALCULATED WITHIN THE PROCESS AFTER A DELAY
	ALUOUT <= TEMP_ALUOUT AFTER DELAY_ALU;
	
--	--if(ALUOUT = 0) then
--	    -- ALUOUTz <= 1;
--	-elsif (ALUOUT < 0) then
--	     ALUOUTn  <= 1;
--	elsif (ALUOUT > 0) then
--	     ALUOUTp <= 1;
--	end if;
	     
	END PROCESS VHDL_ALU;
END UNTITLED;


--
-- VHDL Architecture ece411.Reg16.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 12:54:20 05/22/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
LIBRARY ece411;
USE ece411.LC3B_TYPES.all;

ENTITY PCReg16 IS
   PORT( 
      Input  : IN     LC3b_word;
      RESET  : IN     std_logic;
      clk    : IN     std_logic;
      NewInstr   : IN std_logic;
      Output : OUT    LC3b_word
   );

-- Declarations

END PCReg16 ;


ARCHITECTURE untitled OF PCReg16 IS
signal pre_out : LC3b_word;
BEGIN
pcreg16process: PROCESS (clk, RESET, Input,NewInstr)
BEGIN
  if (RESET = '0') then
    pre_out <= (others => '0');
  elsif ((clk'event) and (clk = '1')and (CLK'LAST_VALUE = '0')) then 
     if (NewInstr = '1') then
     pre_out <= Input;
    end if;
  else
    --do nothing
  end if;
end process pcreg16process;
Output <= pre_out after delay_reg;
END ARCHITECTURE untitled;


--ARCHITECTURE untitled OF PCReg16 IS
--signal pre_out : LC3b_word;
--BEGIN
--pcreg16process: PROCESS (clk, RESET, Input,stall)
--  VARIABLE Counter : INTEGER := 0;
--BEGIN
--  if (RESET = '0') then
--    pre_out <= (others => '0');
--    Counter :=1;
--  else 
--    Counter :=0;
--  end if;
--  
--  if ((clk'event) and (clk = '0')and (CLK'LAST_VALUE = '1') and (Counter = 0)) then
--     if (stall = '0') then
--       pre_out <= Input;
--    end if;
--  end if;
--  
--  
--end process pcreg16process;
--Output <= pre_out after delay_reg;
--END ARCHITECTURE untitled;
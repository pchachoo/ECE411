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

ENTITY p_datamemory IS
   PORT( 
      clk       : IN      std_logic;
      RESET_L   : IN      std_logic;
      ALUOUtMem : IN      LC3b_word;
      datain    : IN      LC3b_word;
      MRESP_H   : IN      std_logic;
      Read_MEM  : IN      std_logic;
      Write_MEM : IN      std_logic;
      OPcode    : IN      lc3b_opcode;
      STR_data  : IN      LC3b_word;
      MREAD_L   : OUT     std_logic;
      MWRITEH_L : OUT     std_logic;
      MWRITEL_L : OUT     std_logic;
      dataout   : OUT     LC3b_word;
      DataRead  : OUT     LC3b_word;
      sti_flag : OUT     std_logic;
      sti_counter : OUT     INTEGER;
      address   : OUT     LC3B_WORD
);

-- Declarations

END p_datamemory ;


----
ARCHITECTURE UNTITLED OF p_datamemory IS
--signal pre_mread_l: STD_LOGIC;
BEGIN
  
 
	------------------------------
	VHDL_REG_IR : PROCESS (CLK,RESET_L,DATAIN,MRESP_H,ALUOUtMem,Read_MEM,Write_MEM,OPCODE,STR_data)
	------------------------------
  Variable Temp_byte: LC3B_BYTE;	
    
  Variable temp_ldr:INTEGER;
  
BEGIN

ADDRESS <= ALUOUtMem;
    MREAD_L <= '1';--AFTER 0 NS, '0' AFTER CLOCK_PERIOD;
    MWRITEL_L <= '1';
    MWRITEH_L <=  '1';
 
IF (OPCODE = OP_LDR) then
    MREAD_L <= Read_MEM ;--AFTER 0NS, '0' AFTER CLOCK_PERIOD;
    --pre_mread_l <= '1' AFTER 0 NS, '0' AFTER CLOCK_PERIOD;
    
    MWRITEL_L <= '1';
    MWRITEH_L <=  '1';
    sti_counter <= 0;
ELSIF (OPCODE = OP_STR) then
    dataout <= STR_data;--FOR storing data to memory pointed to address
    MWRITEH_L <= '0' after 3ns;
    MWRITEL_L <= '0' after 3ns;
    MREAD_L <= '1'after 3ns;
    sti_counter <= 0;
    
ELSIF (OPCODE = OP_LDB) THEN
    MREAD_L <= Read_MEM;
    MWRITEL_L <= '1';
    MWRITEH_L <= '1';   
    sti_counter <= 0;
    
ELSIF (OPCODE = OP_STB) THEN
    dataout <= STR_data;--FOR storing data to memory pointed to address
    IF (to_integer(unsigned( std_logic_vector(ADDRESS))) MOD 2 = 0) THEN
        MWRITEL_L <= '0' ;
        MWRITEH_L <= '1' ;
        MREAD_L <= '1';
    ELSE
        MWRITEL_L <= '1' ;
        MWRITEH_L <= '0' ;
        MREAD_L <= '1';
    END IF;   
    sti_counter <= 0;
    
   
ELSIF (OPCODE = OP_LDI) then
    MREAD_L <= Read_MEM;
    MWRITEL_L <= '1';
    MWRITEH_L <= '1'; 
    
    IF (MRESP_H = '1') THEN
        ADDRESS <= DATAIN; --SEND DATAREAD TO ADDRESS AGAIN
        MREAD_L <= Read_MEM;
        MWRITEL_L <= '1';
        MWRITEH_L <= '1'; 
    END IF;
    sti_counter <= 0;
  
        
ELSIF (OPCODE = OP_STI) then
    
--    
--    sti_counter <= 2;
--    IF (sti_counter = 2) then
--      --do first iteration
--      IF (mresp_l = '0') then
--        sti_counter <= sti_counter-1;
--      end if;
--    end if;
--    if (sti_counter = 1) then
--      --do second iteration
--      IF (mresp_l = '0') then
--        sti_counter <= sti_counter-1;
--      end if;
--    end if;
--    if (sti_counter = 0)then 
--  end if;
    
    
    sti_counter <= 1;
  
  
    for sti_counter in 0 to 2 loop
      
      ADDRESS <= ALUOUtMem;
      MREAD_L <= '0';-- first get the memory contents of ADDRESS <= ALUOUtMem;
      MWRITEL_L <= '1';
      MWRITEH_L <= '1'; 
      --MREAD_L <= '1';

     
    IF (sti_flag = '1') THEN
        
       ADDRESS <= DATAIN ;--after clock_period; --get the memory contents and copy to address
       dataout <= STR_data;
       MREAD_L <= Read_MEM;
       MWRITEL_L <= Write_MEM;
       MWRITEH_L <= Write_MEM; 
   END IF;
  --    if(sti_flag = '1') then -- second iteration
  --      sti_flag <= '0';
--
    --sti_counter_out <= "0000000000000000";
  --    else
       sti_flag <= '1' AFTER 0 NS, '0' AFTER CLOCK_PERIOD;
     --end if;
  --   sti_counter <= "0000000000000000";
--            sti_counter <= 0;
   end loop;
   
   
END IF;

--IF (OPCODE = OP_LDR) then
--temp_ldr := 0;
--
--WHILE (MRESP_H = '0') loop
--   temp_ldr := temp_ldr + 1;
--
--end loop;
-- END IF;

--IF (MRESP_H = '1') THEN  temp removed

  IF (OPCODE = OP_LDR) then
    
    DataRead <= DATAIN;
    
  ELSIF (OPCODE = OP_LDB) THEN
  
    IF (to_integer(unsigned( std_logic_vector(ADDRESS))) MOD 2 = 0) THEN
      Temp_byte := DATAIN(7 DOWNTO 0);
    ELSE
      Temp_byte := DATAIN(15 DOWNTO 8);
    END IF;
    DataRead <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & Temp_byte;
  END IF;

--END IF;


END PROCESS VHDL_REG_IR;
--mread_l <= pre_mread_l;
END UNTITLED;

-- VHDL Entity ece411.Cache_Controller.interface
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 11:30:46 07/26/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Cache_Controller IS
   PORT( 
      Dirty      : IN     STD_LOGIC;
      MISS       : IN     STD_LOGIC;
      MRESP_H    : IN     std_logic;
      MWRITEH_L  : IN     std_logic;
      MWRITEL_L  : IN     std_logic;
      PMRESP_H   : IN     STD_LOGIC;
      RESET_L    : IN     std_logic;
      Way0Write  : IN     STD_LOGIC;
      Way1Write  : IN     STD_LOGIC;
      clk        : IN     std_logic;
      store_op   : IN     STD_LOGIC;
      PMREAD_L   : OUT    STD_LOGIC;
      PMWRITE_L  : OUT    STD_LOGIC;
      in_idlehit : OUT    STD_LOGIC;
      in_load    : OUT    STD_LOGIC;
      in_store   : OUT    STD_LOGIC;
      in_wb      : OUT    STD_LOGIC
   );

-- Declarations

END Cache_Controller ;

--
-- VHDL Architecture ece411.Cache_Controller.fsm
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 11:30:46 07/26/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;
 
ARCHITECTURE fsm OF Cache_Controller IS

   TYPE STATE_TYPE IS (
      IdleHit,
      Load,
      WriteBack,
      Store
   );
 
   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

BEGIN

   -----------------------------------------------------------------
   clocked_proc : PROCESS ( 
      CLK,
      RESET_L
   )
   -----------------------------------------------------------------
   BEGIN
      IF (RESET_L = '0') THEN
         current_state <= IdleHit;
      ELSIF (CLK'EVENT AND CLK = '1') THEN
         current_state <= next_state;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      Dirty,
      MISS,
      PMRESP_H,
      Way0Write,
      Way1Write,
      current_state,
      store_op
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         WHEN IdleHit => 
            IF (store_op = '1') THEN 
               next_state <= Store;
            ELSIF ((miss = '1') AND 
                   (dirty = '1')) THEN 
               next_state <= WriteBack;
            ELSIF ((miss = '1') AND 
                   (dirty = '0')) THEN 
               next_state <= Load;
            ELSE
               next_state <= IdleHit;
            END IF;
         WHEN Load => 
            IF (PMRESP_H = '1') THEN 
               next_state <= IdleHit;
            ELSE
               next_state <= Load;
            END IF;
         WHEN WriteBack => 
            IF (PMRESP_H = '1') THEN 
               next_state <= Load;
            ELSE
               next_state <= WriteBack;
            END IF;
         WHEN Store => 
            IF (Way0Write = '1' OR Way1Write = '1') THEN 
               next_state <= IdleHit;
            ELSE
               next_state <= Store;
            END IF;
         WHEN OTHERS =>
            next_state <= IdleHit;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      PMREAD_L <= '1';
      PMWRITE_L <= '1';
      in_idlehit <= '0';
      in_load <= '0';
      in_store <= '0';
      in_wb <= '0';

      -- Combined Actions
      CASE current_state IS
         WHEN IdleHit => 
            in_idlehit <= '1' ;
         WHEN Load => 
            in_load <= '1' ; 
            PMREAD_L <= '0'  after 3ns;
         WHEN WriteBack => 
            in_wb <= '1' ;
            PMWRITE_L <= '0'  after 3ns;
         WHEN Store => 
            in_store <= '1';
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;

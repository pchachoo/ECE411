--
-- VHDL Architecture ece411.DirtyArray.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 15:56:36 06/08/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DirtyArray IS
   PORT( 
      DirtyIN    : IN     std_logic;
      DirtyWrite : IN     std_logic;
      INDEX      : IN     LC3B_C_INDEX;
      RESET_L    : IN     std_logic;
      Dirty      : OUT    std_logic
   );

-- Declarations

END DirtyArray ;

--
ARCHITECTURE untitled OF DirtyArray IS
  TYPE DirtyArray IS	array (7 downto 0) of std_logic;
	SIGNAL DirtyA : DirtyArray;

	BEGIN
		--------------------------------------------------------------
		ReadFromDirtyArray : PROCESS (DirtyA, INDEX)
		--------------------------------------------------------------
    
			VARIABLE DirtyIndex : integer;
			BEGIN
				DirtyIndex := to_integer(unsigned(INDEX));
				Dirty <= DirtyA(DirtyIndex) after 10 ns;

		END PROCESS ReadFromDirtyArray;

		--------------------------------------------------------------
		WriteToDirtyArray : PROCESS (RESET_L, DirtyWrite, DirtyIN, INDEX)
		-------------------------------------------------------	------	
			VARIABLE DirtyIndex : integer;
			BEGIN
				DirtyIndex := to_integer(unsigned(INDEX));
			IF RESET_L = '0' THEN
				DirtyA(0) <= '0';
				DirtyA(1) <= '0';
				DirtyA(2) <= '0';
				DirtyA(3) <= '0';
				DirtyA(4) <= '0';
				DirtyA(5) <= '0';
				DirtyA(6) <= '0';
				DirtyA(7) <= '0';
			END IF;

			IF (DirtyWrite = '1') THEN
				DirtyA(DirtyIndex) <= DirtyIn;
			END IF;

		END PROCESS WriteToDirtyArray;
END ARCHITECTURE untitled;


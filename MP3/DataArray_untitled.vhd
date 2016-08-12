--
-- VHDL Architecture ece411.DataArray.untitled
--
-- Created:
--          by - chachon2.ews (linux-a2.ews.illinois.edu)
--          at - 14:44:03 06/08/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DataArray IS
   PORT( 
      CacheWayDataIN : IN     LC3B_OWORD;
      CacheWayWrite  : IN     std_logic;
      INDEX          : IN     LC3B_C_INDEX;
      RESET_L        : IN     std_logic;
      CacheLine      : OUT    LC3B_OWORD
   );

-- Declarations

END DataArray ;

--
ARCHITECTURE untitled OF DataArray IS
	TYPE DataArray IS array (7 downto 0) of LC3B_OWORD;
	SIGNAL Data : DataArray;
	BEGIN
		--------------------------------------------------------------
		ReadFromDataArray : PROCESS (Data, Index)
		--------------------------------------------------------------
    
			VARIABLE DataIndex : integer;
			BEGIN
				DataIndex := to_integer(unsigned(Index));
				CacheLine <= Data(DataIndex) after 0ns;--20 ns; reduced for mp3
		
		END PROCESS ReadFromDataArray;
	
		--------------------------------------------------------------
		WriteToDataArray : PROCESS (RESET_L, Index, CacheWayWrite, CacheWayDataIN)
		-------------------------------------------------------	------	
			VARIABLE DataIndex : integer;
			BEGIN
				DataIndex := to_integer(unsigned(Index));
			IF RESET_L = '0' THEN
				Data(0) <= (OTHERS => 'X');
				Data(1) <= (OTHERS => 'X');
				Data(2) <= (OTHERS => 'X');
				Data(3) <= (OTHERS => 'X');
				Data(4) <= (OTHERS => 'X');
				Data(5) <= (OTHERS => 'X');
				Data(6) <= (OTHERS => 'X');
				Data(7) <= (OTHERS => 'X');
			END IF;

			IF (CacheWayWrite = '1') THEN
				Data(DataIndex) <= CacheWayDataIN;
			END IF;
	--		CacheLine <= Data(DataIndex) after 20 ns;
		
		END PROCESS WriteToDataArray;
END ARCHITECTURE untitled;


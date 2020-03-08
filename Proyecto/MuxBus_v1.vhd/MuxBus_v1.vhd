----------------------------------------------------------------------------------------------------------------------
-- Actividad : MuxAlu Proyecto
-- Autores : German Andres Caycedo , David Hernandez, Maria Camila Lopez, Alejandro Meza
-- Fecha : 27/10/2018
--
-- archivo : MuxBus_v1.vhd
----------------------------------------------------------------------------------------------------------------------
-- Descripción : Vamos a hacer el MuxAlu del proyecto
----------------------------------------------------------------------------------------------------------------------
-- cambios :
----------------------------------------------------------------------------------------------------------------------

Library IEEE;
use IEEE.std_logic_1164.all;

Entity MuxBus_v1 is
	generic (Nbus: positive := 8);
	port
	(	datin : in std_logic_vector(Nbus-1 downto 0);
		datout : in std_logic_vector(Nbus-1 downto 0);
		clk : in std_logic;
		datram: inout std_logic_vector(Nbus-1 downto 0);
		reg : out std_logic_vector(Nbus-1 downto 0);
		mbsig : inout std_logic_vector(1 downto 0)
	);

End Entity;


Architecture MuxBus_v1_arc of MuxBus_v1 is
	signal temp : std_logic_vector(7 downto 0);
	Begin
		Process (clk)
		Begin
			if (rising_edge(clk)) then
				if (mbsig = "00") then
					temp <= datin;
				end if;
				if (mbsig = "01") then
					temp <= datram;
				end if;
--				if (mbsig = "10") then
--					datout <= reg;
				end if;
				if (mbsig = "11") then
					datram <= reg;
				end if;
			end if;
			reg <= temp;
		end process;

End Architecture;

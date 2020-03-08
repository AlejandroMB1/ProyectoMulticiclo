Library IEEE;
Use IEEE.std_logic_1164.all;

Entity Divisor_v1 is
	port
	(
		Clkin: in std_logic;
		Clkout: out std_logic
	);
	
End Divisor_v1;

Architecture Behaviour of Divisor_v1 is
	Constant max: natural := 50000000/20 ;
	Signal counter : integer range 0 to max := 0;
	Signal State: std_logic := '0';
	
	Begin
	
		Process(Clkin,counter,state)
			Begin
				if(rising_edge(clkin)) then
					if counter = max then
						state <= not state;
						
						counter <= 0;
						
					else
						counter <= counter + 1;
						
					end if;
				end if;
				Clkout <= state;
		end process;

End Architecture;
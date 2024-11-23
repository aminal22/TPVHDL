library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity PLL is
    Port ( CLK : in  STD_LOGIC;
           PLL2x, PLL4x : out  STD_LOGIC);
end PLL;

architecture Behavioral of PLL is
signal CLK_IBUFG, CLK2x, CLK2xBUFG, LOCKED2x, Q, NOT_Q, CLK4x, CLK4xBUFG, LOCKED4x, LOCKED4xOBUF: std_logic;
begin

IBUFG1: IBUFG port map(I => CLK, O => CLK_IBUFG);
BUFG1: BUFG port map(I => CLK2x, O => CLK2xBUFG);
BUFG2: BUFG port map(I => CLK4x, O => CLK4xBUFG);
OBUF1: OBUF port map(I => LOCKED4x, O => LOCKED4xOBUF);
INV1: INV port map(I => Q, O => NOT_Q);

SRL16_copy: SRL16 port map(D => LOCKED2x, CLK => CLK2xBUFG, A0 => '0', A1 => '0', A2 => '0', A3 => '0', Q => Q);

CLKDLL1: CLKDLL port map(CLKIN => CLK_IBUFG, CLKFB => CLK2xBUFG, RST => '0', CLK0 => open, CLK90 => open, 
								 CLK180 => open, CLK270 => open, CLK2x => CLK2x, CLKDV => open, LOCKED => LOCKED2x);
								 
CLKDLL2: CLKDLL port map(CLKIN => CLK2xBUFG, CLKFB => CLK4xBUFG, RST => NOT_Q, CLK0 => open, CLK90 => open,
								 CLK180 => open, CLK270 => open, CLK2x => CLK4x, CLKDV => open, LOCKED => LOCKED4x);
								 
PLL2x <= CLK2xBUFG when LOCKED2x = '1' else '0';
PLL4x <= CLK4xBUFG when LOCKED4x = '1' else '0';

end Behavioral;


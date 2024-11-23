library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DivHorloge is
    Port ( RESET, CLK : in  STD_LOGIC;
           CLK_Div : out  STD_LOGIC);
end DivHorloge;

architecture Behavioral of DivHorloge is
signal cpt: std_logic_vector(4 downto 0);
begin

process(RESET, CLK)
begin
if RESET = '1' then cpt <= (others => '0');
elsif rising_edge(CLK) then cpt <= cpt + 1;
end if;
end process;

CLK_Div <= cpt(4);

end Behavioral;


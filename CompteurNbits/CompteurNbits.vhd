library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CompteurNbits is generic(N: natural := 4);
    Port ( RESET, CLK : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (N-1 downto 0));
end CompteurNbits;

architecture Behavioral of CompteurNbits is
signal tmpQ: STD_LOGIC_VECTOR (N-1 downto 0);
begin

process(RESET, CLK)
begin
if RESET = '1' then tmpQ <= (others => '0');
elsif rising_edge(CLK) then tmpQ <= tmpQ + 1;
end if;
end process;

Q <= tmpQ;

end Behavioral;


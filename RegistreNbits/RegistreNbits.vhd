library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegistreNbits is generic(N: natural := 4);
    Port ( CLK : in  STD_LOGIC;
           B : in  STD_LOGIC_VECTOR (N-1 downto 0);
           D : out  STD_LOGIC_VECTOR (N-1 downto 0));
end RegistreNbits;

architecture Behavioral of RegistreNbits is

begin

process(CLK)
begin
if falling_edge(CLK) then D <= B;
end if;
end process;

end Behavioral;


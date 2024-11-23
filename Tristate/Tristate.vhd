library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Tristate is
    Port ( LesSout, Enable : in  STD_LOGIC;
           SORTIE : out  STD_LOGIC);
end Tristate;

architecture Behavioral of Tristate is
signal Sm: std_logic;
begin

Sm <= not(LesSout);
SORTIE <= Sm when Enable = '1' else 'Z';

end Behavioral;


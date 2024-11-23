library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Somateur is
    Port ( ai, di, LesSin : in  STD_LOGIC;
           LesSout : out  STD_LOGIC);
end Somateur;

architecture Behavioral of Somateur is

begin

LesSout <= (ai and di) nor not(LesSin);

end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Coefficient is
    Port ( Qi, LesQin : in  STD_LOGIC;
           ai, LesQout : out  STD_LOGIC);
end Coefficient;

architecture Behavioral of Coefficient is

begin

ai <= Qi and LesQin;
LesQout <= not(Qi) and LesQin;

end Behavioral;


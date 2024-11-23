library IEEE;
use IEEE.STD_LOGIC_1164.all;

package Biblio is

component Coefficient is
    Port ( Qi, LesQin : in  STD_LOGIC;
           ai, LesQout : out  STD_LOGIC);
end component;

component Somateur is
    Port ( ai, di, LesSin : in  STD_LOGIC;
           LesSout : out  STD_LOGIC);
end component;

component Tristate is
    Port ( LesSout, Enable : in  STD_LOGIC;
           SORTIE : out  STD_LOGIC);
end component;

component RegistreNbits is generic(N: natural := 4);
    Port ( CLK : in  STD_LOGIC;
           B : in  STD_LOGIC_VECTOR (N-1 downto 0);
           D : out  STD_LOGIC_VECTOR (N-1 downto 0));
end component;

component DivHorloge is
    Port ( RESET, CLK : in  STD_LOGIC;
           CLK_Div : out  STD_LOGIC);
end component;

component CompteurNbits is generic(N: natural := 4);
    Port ( RESET, CLK : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (N-1 downto 0));
end component;

end Biblio;


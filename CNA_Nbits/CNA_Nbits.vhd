library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Biblio.all;

entity CNA_Nbits is generic(N: natural := 4);
    Port ( RESET, CLK50MHz, Enable : in  STD_LOGIC;
           B : in  STD_LOGIC_VECTOR (N-1 downto 0);
           SORTIE : out  STD_LOGIC);
end CNA_Nbits;

architecture Behavioral of CNA_Nbits is

signal CLK_Div: std_logic;
signal Q, LesQout, LesSout, A, D: STD_LOGIC_VECTOR (N-1 downto 0);

begin

CopyDivHorloge: DivHorloge port map(CLK => CLK50MHz, RESET => RESET, CLK_Div => CLK_Div);

CopyRegistreNbits: RegistreNbits generic map(N => N)
port map(CLK => Q(N-1), B => B, D => D);

CopyCompteurNbits: CompteurNbits generic map(N => N)
port map(RESET => RESET, CLK => CLK_Div, Q => Q);

CopyTristate: Tristate port map(LesSout => LesSout(0), Enable => Enable, SORTIE => SORTIE);

Copy1Coefficient: Coefficient port map(LesQin => '1', Qi => Q(N-1), LesQout => LesQout(N-1), ai => A(n-1));

Copy1Somateur: Somateur port map(LesSin => '1', ai => A(N-1), di => D(N-1), LesSout => LesSout(N-1));

Boucle: for i in N-2 downto 0 generate
LesCoefficients: Coefficient port map(LesQin => LesQout(i+1), Qi => Q(i), LesQout => LesQout(i), ai => A(i));
LesSomateurs: Somateur port map(LesSin => LesSout(i+1), ai => A(i), di => D(i), LesSout => LesSout(i));
end generate Boucle;

end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Carrefour is
    Port ( RESET, CLK : in  STD_LOGIC;
           Detection : in  STD_LOGIC;
           Rp, Op, Vp, Rs, Os, Vs : out  STD_LOGIC);
end Carrefour;

architecture Behavioral of Carrefour is
type etat is (Etat_Defaut, Etat_OpRs, Etat_RpRs, Etat_RpVs, Etat_RpOs, Etat_RsRp, Etat_VpRs);
signal etata, etatf: etat;
signal Cpt_130s: natural range 0 to 129;
signal En_1Hz: std_logic;

component DiviseurHorloge is generic(N: natural := 50);
    Port ( RESET, CLK : in  STD_LOGIC;
           En_1MHz : out  STD_LOGIC);
end component;

begin

DivHorloge: DiviseurHorloge generic map(N => 50000000)
port map (RESET => RESET, CLK => CLK, En_1MHz => En_1Hz);

process(RESET, CLK)
begin
if RESET = '1' then Cpt_130s <= 0;
elsif rising_edge(CLK) then 
	if Cpt_130s = 129 or etata = Etat_Defaut then Cpt_130s <= 0;
	elsif En_1Hz = '1' then Cpt_130s <= Cpt_130s + 1;
	end if;
end if;
end process;

	



end Behavioral;


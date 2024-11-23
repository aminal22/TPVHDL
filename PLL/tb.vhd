LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PLL
    PORT(
         CLK : IN  std_logic;
         PLL2x : OUT  std_logic;
         PLL4x : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';

 	--Outputs
   signal PLL2x : std_logic;
   signal PLL4x : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PLL PORT MAP (
          CLK => CLK,
          PLL2x => PLL2x,
          PLL4x => PLL4x
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
	

END;

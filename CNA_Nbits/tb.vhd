--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:48:41 03/09/2023
-- Design Name:   
-- Module Name:   E:/TP_VHDL_2023/CNA_Nbits/tb.vhd
-- Project Name:  CNA_Nbits
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CNA_Nbits
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CNA_Nbits
    PORT(
         RESET : IN  std_logic;
         CLK50MHz : IN  std_logic;
         Enable : IN  std_logic;
         B : IN  std_logic_vector(3 downto 0);
         SORTIE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RESET : std_logic := '0';
   signal CLK50MHz : std_logic := '0';
   signal Enable : std_logic := '0';
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal SORTIE : std_logic;

   -- Clock period definitions
   constant CLK50MHz_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CNA_Nbits PORT MAP (
          RESET => RESET,
          CLK50MHz => CLK50MHz,
          Enable => Enable,
          B => B,
          SORTIE => SORTIE
        );

   -- Clock process definitions
   CLK50MHz_process :process
   begin
		CLK50MHz <= '0';		wait for 10 ns;
		CLK50MHz <= '1';		wait for 10 ns;
   end process;
 
	RESET <= '1', '0' after 100 ns;
	
	--B <= "0001", "0110" after 120 us, "1001" after 240 us, "1111" after 360 us;
	
	process
	begin
	B <= "0001";	wait for 120 us;
	B <= "0110";	wait for 120 us;
	B <= "1001";	wait for 120 us;
	B <= "1111";	wait for 120 us;
	wait;
	end process;
	
	Enable <= '0', '1' after 1 us, '0' after 400 us;
	
	

END;

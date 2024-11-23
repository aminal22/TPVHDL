--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:54:02 03/06/2023
-- Design Name:   
-- Module Name:   E:/TP_VHDL_2023/DiviseurHorloge/tb.vhd
-- Project Name:  DiviseurHorloge
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DiviseurHorloge
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
 
    COMPONENT DiviseurHorloge
    PORT(
         RESET : IN  std_logic;
         CLK : IN  std_logic;
         En_1MHz : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RESET : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal En_1MHz : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DiviseurHorloge PORT MAP (
          RESET => RESET,
          CLK => CLK,
          En_1MHz => En_1MHz
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';		wait for 10 ns;
		CLK <= '1';		wait for 10 ns;
   end process;
 
	RESET <= '1', '0' after 100 ns; 
   

END;

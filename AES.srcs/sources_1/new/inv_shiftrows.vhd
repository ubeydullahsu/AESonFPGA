----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.01.2020 01:44:55
-- Design Name: 
-- Module Name: inv_shiftrows - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity inv_shiftrows is
     Port ( shiftin : in STD_LOGIC_VECTOR (127 downto 0);
           shiftout : out STD_LOGIC_VECTOR (127 downto 0));
end inv_shiftrows;

architecture Behavioral of inv_shiftrows is

signal r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15 : std_logic_vector (7 downto 0);

begin

r15 <= shiftin(7 downto 0);	 
r11 <= shiftin(39 downto 32);		 
r7 <= shiftin(71 downto 64);		 
r3 <= shiftin(103 downto 96);	
	 
r10 <= shiftin(15 downto 8);
r6 <= shiftin(47 downto 40);
r2 <= shiftin(79 downto 72);	
r14 <= shiftin(111 downto 104);
	
r5 <= shiftin(23 downto 16);	
r1 <= shiftin(55 downto 48);	
r13 <= shiftin(87 downto 80);	
r9 <= shiftin(119 downto 112);	

r0 <= shiftin(31 downto 24);	
r12 <= shiftin(63 downto 56);	
r8 <= shiftin(95 downto 88);	
r4 <= shiftin(127 downto 120);	

shiftout <= r4 & r13 & r6 & r15 & r8 & r1 &r10 & r3 & r12 & r5 & r14 & r7 & r0 & r9 & r2 & r11;	


end Behavioral;
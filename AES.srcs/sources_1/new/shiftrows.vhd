----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2019 21:44:40
-- Design Name: 
-- Module Name: shiftrows - Behavioral
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

entity shiftrows is
    Port ( shiftin : in STD_LOGIC_VECTOR (127 downto 0);
           shiftout : out STD_LOGIC_VECTOR (127 downto 0));
end shiftrows;

architecture Behavioral of shiftrows is

signal r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15 : std_logic_vector (7 downto 0);

begin

r15 <= shiftin(7 downto 0);	 
r11 <= shiftin(39 downto 32);		 
r7 <= shiftin(71 downto 64);		 
r3 <= shiftin(103 downto 96);	
	 
r14 <= shiftin(15 downto 8);
r10 <= shiftin(47 downto 40);
r6 <= shiftin(79 downto 72);	
r2 <= shiftin(111 downto 104);
	
r13 <= shiftin(23 downto 16);	
r9 <= shiftin(55 downto 48);	
r5 <= shiftin(87 downto 80);	
r1 <= shiftin(119 downto 112);	

r12 <= shiftin(31 downto 24);	
r8 <= shiftin(63 downto 56);	
r4 <= shiftin(95 downto 88);	
r0 <= shiftin(127 downto 120);	

shiftout <= r0 & r5 & r10 & r15 & r4 & r9 &r14 & r3 & r8 & r13 & r2 & r7 & r12 & r1 & r6 & r11;	

end Behavioral;

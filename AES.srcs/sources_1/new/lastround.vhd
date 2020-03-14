----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2019 01:18:55
-- Design Name: 
-- Module Name: lastround - Behavioral
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

entity lastround is
    Port ( lastin : in STD_LOGIC_VECTOR (127 downto 0);
           lastkey : in STD_LOGIC_VECTOR (127 downto 0);
           rcon : in STD_LOGIC_VECTOR (7 downto 0);
           ciphertext : out STD_LOGIC_VECTOR (127 downto 0));
           --keyout : inout std_logic_vector(127 downto 0));
end lastround;

architecture Behavioral of lastround is

component keyGenerator is
    Port ( inkey : in STD_LOGIC_VECTOR (127 downto 0);
           rcon : in STD_LOGIC_VECTOR (7 downto 0);
           outkey : out STD_LOGIC_VECTOR (127 downto 0));
end component;

component shiftrows is
    Port ( shiftin : in STD_LOGIC_VECTOR (127 downto 0);
           shiftout : out STD_LOGIC_VECTOR (127 downto 0));
end component;

component subbytes is
    Port ( sin : in STD_LOGIC_VECTOR (127 downto 0);
           sout : out STD_LOGIC_VECTOR (127 downto 0));
end component;

signal subout,shiftout,keyout:std_logic_vector(127 downto 0);

begin

q1: keyGenerator port map (lastkey,rcon,keyout);

q2:subbytes port map(lastin,subout);
	
q3:shiftrows  port map(subout,shiftout);

ciphertext <= shiftout xor keyout;

end Behavioral;

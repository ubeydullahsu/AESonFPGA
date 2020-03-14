----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2019 21:17:40
-- Design Name: 
-- Module Name: subbytestb - Behavioral
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

entity subbytestb is
--  Port ( );
end subbytestb;

architecture Behavioral of subbytestb is

component subbytes is
    Port ( sin : in STD_LOGIC_VECTOR (127 downto 0);
           sout : out STD_LOGIC_VECTOR (127 downto 0));
end component;

signal itb : std_logic_vector (127 downto 0); 
signal otb : std_logic_vector (127 downto 0);

begin

uut : subbytes port map(
                        sin => itb,
                        sout => otb);
                        
stimproc : process

begin

itb <= "01100010011101010110011101110101011011100010000001101000011000010111011001100001001000000110001101101111011010110010000000100001";
wait for 10 ns;
                        
end process;

end Behavioral;

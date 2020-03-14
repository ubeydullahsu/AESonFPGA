----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2019 00:29:12
-- Design Name: 
-- Module Name: keyGentb - Behavioral
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

entity keyGentb is
--  Port ( );
end keyGentb;

architecture Behavioral of keyGentb is

component keyGenerator is
    Port ( inkey : in STD_LOGIC_VECTOR (127 downto 0);
           rcon : in STD_LOGIC_VECTOR (7 downto 0);
           outkey : out STD_LOGIC_VECTOR (127 downto 0));
end component;

signal itb, otb : std_logic_vector (127 downto 0);
signal rcontb : std_logic_vector (7 downto 0);

begin

uut : keyGenerator port map (
                            inkey => itb,
                            rcon => rcontb,
                            outkey => otb);
                            
stimproc : process

begin

itb <= "01100010011101010110011101110101011011100010000001101000011000010111011001100001001000000110001101101111011010110010000000100001";
rcontb <= "01100100"; 
wait for 10 ns;

end process;

end Behavioral;

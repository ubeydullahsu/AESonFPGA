----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2019 01:24:45
-- Design Name: 
-- Module Name: lastroundtb - Behavioral
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

entity lastroundtb is
--  Port ( );
end lastroundtb;

architecture Behavioral of lastroundtb is

component lastround is
    Port ( lastin : in STD_LOGIC_VECTOR (127 downto 0);
           lastkey : in STD_LOGIC_VECTOR (127 downto 0);
           rcon : in STD_LOGIC_VECTOR (7 downto 0);
           ciphertext : out STD_LOGIC_VECTOR (127 downto 0));
end component;

signal lastintb, lastkeytb :std_logic_vector (127 downto 0);
signal rcontb : std_logic_vector (7 downto 0);
signal outtb : std_logic_vector (127 downto 0);

begin

uut : lastround port map (
                          lastin => lastintb,
                          lastkey => lastkeytb,
                          rcon => rcontb,
                          ciphertext => outtb);
                          
stimproc : process

begin

lastintb <= "01100010011101010110011101110101011011100010000001101000011000010111011001100001001000000110001101101111011010110010000000100001";
lastkeytb <= "01110100011011110110010001100001011110010010011101110011001000000111010001101000011001010010000001100100011000010111100100101110";
rcontb <= "01100100";

wait for 10 ns;

end process;


end Behavioral;

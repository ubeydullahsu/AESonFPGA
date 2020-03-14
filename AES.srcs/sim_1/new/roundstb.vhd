----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2019 01:00:35
-- Design Name: 
-- Module Name: roundstb - Behavioral
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

entity roundstb is
--  Port ( );
end roundstb;

architecture Behavioral of roundstb is

component rounds is
    Port ( roundin : in STD_LOGIC_VECTOR (127 downto 0);
           keyin : in STD_LOGIC_VECTOR (127 downto 0);
           keyout : inout STD_LOGIC_VECTOR (127 downto 0);
           rcon : in STD_LOGIC_VECTOR (7 downto 0);
           roundout : out STD_LOGIC_VECTOR (127 downto 0));
end component;

signal roundintb, keyintb, keyouttb : std_logic_vector (127 downto 0);
signal rcontb : std_logic_vector (7 downto 0);
signal roundouttb : std_logic_vector (127 downto 0); 

begin

uut : rounds port map(
                       roundin => roundintb,
                       keyin => keyintb,
                       keyout => keyouttb,
                       rcon => rcontb,
                       roundout => roundouttb);
                       
stimproc : process

begin

roundintb <= "01100010011101010110011101110101011011100010000001101000011000010111011001100001001000000110001101101111011010110010000000100001";
keyintb <= "01110100011011110110010001100001011110010010011101110011001000000111010001101000011001010010000001100100011000010111100100101110";
rcontb <=  "01100100";

wait for 10 ns;

end process;
end Behavioral;

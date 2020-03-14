----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2019 21:56:00
-- Design Name: 
-- Module Name: shrtb - Behavioral
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

entity shrtb is
--  Port ( );
end shrtb;

architecture Behavioral of shrtb is
component shiftrows is
    Port ( shiftin : in STD_LOGIC_VECTOR (127 downto 0);
           shiftout : out STD_LOGIC_VECTOR (127 downto 0));
end component;

signal itb : std_logic_vector (127 downto 0);
signal otb : std_logic_vector (127 downto 0);

begin

uut : shiftrows port map(
                        shiftin => itb,
                        shiftout => otb);
                        
stimproc : process

begin

itb <= "01000010011101010110011101110101011011100010000001101000011000010111011001100001001000000110001101101111011010110010000000100001";
wait for 10 ns;

end process;

end Behavioral;

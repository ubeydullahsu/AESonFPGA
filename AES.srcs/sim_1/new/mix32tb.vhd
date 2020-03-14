----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2019 22:26:38
-- Design Name: 
-- Module Name: mix32tb - Behavioral
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

entity mix32tb is
--  Port ( );
end mix32tb;

architecture Behavioral of mix32tb is

component mixcolumns32 is
    Port ( c1 : in STD_LOGIC_VECTOR (7 downto 0);
           c2 : in STD_LOGIC_VECTOR (7 downto 0);
           c3 : in STD_LOGIC_VECTOR (7 downto 0);
           c4 : in STD_LOGIC_VECTOR (7 downto 0);
           mixedout : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal c1tb, c2tb, c3tb, c4tb : std_logic_vector (7 downto 0);
signal outtb : std_logic_vector (7 downto 0);

begin

uut : mixcolumns32 port map(
                            c1 => c1tb,
                            c2 => c2tb,
                            c3 => c3tb,
                            c4 => c4tb,
                            mixedout => outtb);
                            
stimproc : process

begin

c1tb <= "01101000";
c2tb <= "01101111";
c3tb <= "01110000";
c4tb <= "01100101";

wait for 10 ns;

end process;

end Behavioral;

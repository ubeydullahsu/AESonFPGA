----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2019 20:59:58
-- Design Name: 
-- Module Name: sboxtb - Behavioral
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

entity sboxtb is
--  Port ( );
end sboxtb;

architecture Behavioral of sboxtb is

component sbox is 
           Port ( inbox : in STD_LOGIC_VECTOR (7 downto 0);
            outbox : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal itb : std_logic_vector (7 downto 0) := "00000000";
signal otb : std_logic_vector (7 downto 0);

begin

uut : sbox port map(
                    inbox => itb,
                    outbox => otb);
                    
stimprocc : process

begin

itb <= "01001000";
wait for 10 ns;

end process;


end Behavioral;

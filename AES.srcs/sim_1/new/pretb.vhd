----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2019 15:22:57
-- Design Name: 
-- Module Name: pretb - Behavioral
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

entity pretb is
--  Port ( );
end pretb;

architecture Behavioral of pretb is

component pre is
    Port ( prein : in STD_LOGIC_VECTOR (127 downto 0);
           prekey : in STD_LOGIC_VECTOR (127 downto 0);
           preout : out STD_LOGIC_VECTOR (127 downto 0));
end component;

signal intb, keytb, outtb : std_logic_vector(127 downto 0);

begin

uut : pre port map(
                    prein => intb,
                    prekey => keytb,
                    preout => outtb);
                  
stim_proc : process
begin

intb <= x"627567756E206861766120636F6B2021";
keytb <= x"6C69666520697320676F6F6420796561";

wait for 10 ns;

end process;


end Behavioral;

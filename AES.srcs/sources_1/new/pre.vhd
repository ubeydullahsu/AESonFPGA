----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2019 12:26:49
-- Design Name: 
-- Module Name: pre - Behavioral
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

entity pre is
    Port ( prein : in STD_LOGIC_VECTOR (127 downto 0);
           prekey : in STD_LOGIC_VECTOR (127 downto 0);
           preout : out STD_LOGIC_VECTOR (127 downto 0));
end pre;

architecture Behavioral of pre is

begin

preout <= prein xor prekey;

end Behavioral;

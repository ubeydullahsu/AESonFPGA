----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2019 00:40:43
-- Design Name: 
-- Module Name: addroundkey - Behavioral
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

entity addroundkey is
    Port ( keyin : in STD_LOGIC_VECTOR (127 downto 0);
           mixedin : in STD_LOGIC_VECTOR (127 downto 0);
           addout : out STD_LOGIC_VECTOR (127 downto 0));
end addroundkey;

architecture Behavioral of addroundkey is

begin

addout <= keyin xor mixedin;


end Behavioral;

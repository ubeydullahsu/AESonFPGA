----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2019 21:12:24
-- Design Name: 
-- Module Name: lastround - Behavioral
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

entity invlastround is
    Port ( lastin : in STD_LOGIC_VECTOR (127 downto 0);
           lastkey : in STD_LOGIC_VECTOR (127 downto 0);
           rcon : in STD_LOGIC_VECTOR (7 downto 0);
           plaintext : out STD_LOGIC_VECTOR (127 downto 0));
end invlastround;

architecture Behavioral of invlastround is

component InvKeyGenerator is
         Port ( inkey : in STD_LOGIC_VECTOR (127 downto 0);
           rcon : in STD_LOGIC_VECTOR (7 downto 0);
           outkey : out STD_LOGIC_VECTOR (127 downto 0));
end component;

component inv_shiftrows is
         Port ( shiftin : in STD_LOGIC_VECTOR (127 downto 0);
                shiftout : out STD_LOGIC_VECTOR (127 downto 0));
end component;
component inv_subbytes is
        Port ( sin : in STD_LOGIC_VECTOR (127 downto 0);
             sout : out STD_LOGIC_VECTOR (127 downto 0));
end component;

signal subout,shiftout,keyout:std_logic_vector(127 downto 0);
 
begin

q1:invKeyGenerator port map (lastkey,rcon,keyout);

q2:inv_shiftrows  port map(lastin,shiftout);
	
q3:inv_subbytes port map(shiftout,subout);


plaintext <= subout xor keyout;


end Behavioral;
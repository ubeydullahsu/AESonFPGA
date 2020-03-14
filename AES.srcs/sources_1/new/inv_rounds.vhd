----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2019 21:04:36
-- Design Name: 
-- Module Name: inv_rounds - Behavioral
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

entity inv_rounds is
    Port ( roundin : in STD_LOGIC_VECTOR (127 downto 0);
           keyin : in STD_LOGIC_VECTOR (127 downto 0);
           keyout : inout STD_LOGIC_VECTOR (127 downto 0);
           rcon : in STD_LOGIC_VECTOR (7 downto 0);
           roundout : out STD_LOGIC_VECTOR (127 downto 0));
end inv_rounds;

architecture Behavioral of inv_rounds is

component addroundkey is
           Port ( keyin : in STD_LOGIC_VECTOR (127 downto 0);
           mixedin : in STD_LOGIC_VECTOR (127 downto 0);
           addout : out STD_LOGIC_VECTOR (127 downto 0));
end component;

component InvKeyGenerator is
        Port (inkey : in STD_LOGIC_VECTOR (127 downto 0);
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

component inv_mixed_columns is
    Port ( intext : in STD_LOGIC_VECTOR (127 downto 0);
           mixedtext : out STD_LOGIC_VECTOR (127 downto 0));
end component;

signal subout,shiftout,addout:std_logic_vector(127 downto 0);                     
         
begin

w1: InvKeyGenerator port map (keyin,rcon,keyout);

w2:inv_shiftrows  port map(roundin,shiftout);

w3:inv_subbytes port map(shiftout,subout);

w4:inv_mixed_columns port map(addout,roundout);

w5:addroundkey  port map(keyout,subout,addout);

end Behavioral;
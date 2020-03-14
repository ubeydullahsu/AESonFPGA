----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2019 00:50:07
-- Design Name: 
-- Module Name: rounds - Behavioral
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

entity rounds is
    Port ( roundin : in STD_LOGIC_VECTOR (127 downto 0);
           keyin : in STD_LOGIC_VECTOR (127 downto 0);
           keyout : inout STD_LOGIC_VECTOR (127 downto 0);
           rcon : in STD_LOGIC_VECTOR (7 downto 0);
           roundout : out STD_LOGIC_VECTOR (127 downto 0));
end rounds;

architecture Behavioral of rounds is

component addroundkey is
    Port ( keyin : in STD_LOGIC_VECTOR (127 downto 0);
           mixedin : in STD_LOGIC_VECTOR (127 downto 0);
           addout : out STD_LOGIC_VECTOR (127 downto 0));
end component;

component keyGenerator is
    Port ( inkey : in STD_LOGIC_VECTOR (127 downto 0);
           rcon : in STD_LOGIC_VECTOR (7 downto 0);
           outkey : out STD_LOGIC_VECTOR (127 downto 0));
end component;

component mixcolumns is
    Port ( intext : in STD_LOGIC_VECTOR (127 downto 0);
           mixedtext : out STD_LOGIC_VECTOR (127 downto 0));
end component;

component shiftrows is
    Port ( shiftin : in STD_LOGIC_VECTOR (127 downto 0);
           shiftout : out STD_LOGIC_VECTOR (127 downto 0));
end component;

component subbytes is
    Port ( sin : in STD_LOGIC_VECTOR (127 downto 0);
           sout : out STD_LOGIC_VECTOR (127 downto 0));
end component;

signal subout,shiftout,mixcolout:std_logic_vector(127 downto 0);

begin

w1: KeyGenerator port map (keyin,rcon,keyout);

w2:subbytes port map(roundin,subout);

w3:shiftrows  port map(subout,shiftout);

w4:mixcolumns port map(shiftout,mixcolout);

w5:addroundkey  port map(keyout,mixcolout,roundout);


end Behavioral;

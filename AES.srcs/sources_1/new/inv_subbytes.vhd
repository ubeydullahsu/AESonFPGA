----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.12.2019 18:54:25
-- Design Name: 
-- Module Name: subbytes - Behavioral
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

entity inv_subbytes is
    Port ( sin : in STD_LOGIC_VECTOR (127 downto 0);
           sout : out STD_LOGIC_VECTOR (127 downto 0));
end inv_subbytes;

architecture Behavioral of inv_subbytes is

component inv_sbox is
    Port ( inbox : in STD_LOGIC_VECTOR (7 downto 0);
           outbox : out STD_LOGIC_VECTOR (7 downto 0));
end component;


begin

b1 : inv_sbox port map (sin(127 downto 120),
                   sout(127 downto 120));

b2 : inv_sbox port map (sin(119 downto 112),
                    sout(119 downto 112));
                    
b3 : inv_sbox port map (sin(111 downto 104),
                    sout(111 downto 104));
                    
b4 : inv_sbox port map (sin(103 downto 96),
                    sout(103 downto 96));
                    
b5 : inv_sbox port map (sin(95 downto 88),
                    sout(95 downto 88));
                    
b6 : inv_sbox port map (sin(87 downto 80),
                    sout(87 downto 80));
                    
b7 : inv_sbox port map (sin(79 downto 72),
                    sout(79 downto 72));
                    
b8 : inv_sbox port map (sin(71 downto 64),
                    sout(71 downto 64));
                    
b9 : inv_sbox port map (sin(63 downto 56),
                    sout(63 downto 56));
                    
b10 : inv_sbox port map (sin(55 downto 48),
                     sout(55 downto 48));
                     
b11 : inv_sbox port map (sin(47 downto 40),
                     sout(47 downto 40));
                     
b12 : inv_sbox port map (sin(39 downto 32),
                     sout(39 downto 32));
                     
b13 : inv_sbox port map (sin(31 downto 24),
                     sout(31 downto 24));
                     
b14 : inv_sbox port map (sin(23 downto 16),
                     sout(23 downto 16));
                     
b15 : inv_sbox port map (sin(15 downto 8),
                     sout(15 downto 8));
                     
b16 : inv_sbox port map (sin(7 downto 0),
                     sout(7 downto 0));
                                   
                   
end Behavioral;

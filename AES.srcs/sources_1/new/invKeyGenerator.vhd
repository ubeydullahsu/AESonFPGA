----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2019 00:20:00
-- Design Name: 
-- Module Name: keyGenerator - Behavioral
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

entity invkeyGenerator is
    Port ( inkey : in STD_LOGIC_VECTOR (127 downto 0);
           rcon : in STD_LOGIC_VECTOR (7 downto 0);
           outkey : out STD_LOGIC_VECTOR (127 downto 0));
end invkeyGenerator;

architecture Behavioral of invkeyGenerator is

component inv_sbox is 
            Port ( inbox : in STD_LOGIC_VECTOR (7 downto 0);
           outbox : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal w0,w1,w2,w3 : std_logic_vector(31 downto 0);
signal x0,x1,x2,x3: std_logic_vector(31 downto 0);
signal temp,rcon_xor :std_logic_vector(31 downto 0);
signal  m,shift : std_logic_vector(31 downto 0);

begin

temp <= inkey(31 downto 24) & inkey(23 downto 16) & inkey(15 downto 8) & inkey(7 downto 0);
w0 <= inkey(127 downto 120) & inkey(119 downto 112) & inkey(111 downto 104) & inkey(103 downto 96) ;
w1 <= inkey(95 downto 88) & inkey(87 downto 80) & inkey(79 downto 72) & inkey(71 downto 64);
w2 <= inkey(63 downto 56) & inkey(55 downto 48) & inkey(47 downto 40) & inkey(39 downto 32);
w3 <= inkey(31 downto 24) & inkey(23 downto 16) & inkey(15 downto 8) & inkey(7 downto 0);


shift <= temp(23 downto 16) & temp(15 downto 8) & temp(7  downto 0) & temp(31 downto 24);

e1:inv_sbox port map(shift(7  downto 0),m(7  downto 0));
e2:inv_sbox port map(shift(15  downto 8),m(15  downto 8));
e3:inv_sbox port map(shift(23  downto 16),m(23  downto 16));
e4:inv_sbox port map(shift(31  downto 24),m(31  downto 24));

rcon_xor<= (m(31 downto 24) xor rcon) & m(23  downto 16) & m(15  downto 8) & m(7  downto 0);


x0 <= (rcon_xor(31 downto 24) xor  w0(31 downto 24)) & (rcon_xor(23  downto 16) xor w0(23  downto 16)) & (rcon_xor(15  downto 8) xor w0(15  downto 8)) & (rcon_xor(7  downto 0) xor w0(7  downto 0));
x1 <= (x0(31 downto 24) xor w1(31 downto 24))& (x0(23  downto 16) xor w1(23  downto 16)) & (x0(15  downto 8) xor w1(15  downto 8))& (x0(7  downto 0) xor w1(7  downto 0)) ;
x2 <= (x1(31 downto 24) xor w2(31 downto 24)) & (x1(23  downto 16) xor w2(23  downto 16)) & (x1(15  downto 8) xor w2(15  downto 8)) & (x1(7  downto 0) xor  w2(7  downto 0)) ;
x3 <= (x2(31 downto 24) xor w3(31 downto 24)) & (x2(23  downto 16) xor w3(23  downto 16))&(x2(15  downto 8) xor w3(15  downto 8))& (x2(7  downto 0) xor w3(7  downto 0)) ;

outkey <=  x0 & x1 & x2 & x3;


end Behavioral;

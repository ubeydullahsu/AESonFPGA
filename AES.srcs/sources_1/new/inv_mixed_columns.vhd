----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2019 22:42:52
-- Design Name: 
-- Module Name: mixcolumns - Behavioral
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

entity inv_mixed_columns is
    Port ( intext : in STD_LOGIC_VECTOR (127 downto 0);
           mixedtext : out STD_LOGIC_VECTOR (127 downto 0));
end inv_mixed_columns;

architecture Behavioral of inv_mixed_columns is

component invmixed32 is
    Port ( c1 : in STD_LOGIC_VECTOR (7 downto 0);
           c2 : in STD_LOGIC_VECTOR (7 downto 0);
           c3 : in STD_LOGIC_VECTOR (7 downto 0);
           c4 : in STD_LOGIC_VECTOR (7 downto 0);
           mixedout : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15 : std_logic_vector (7 downto 0);

begin

z1:invmixed32 port map(intext(127 downto 120),intext(119 downto 112),intext(111 downto 104),intext(103 downto 96), m0);
z2:invmixed32 port map(intext(119 downto 112),intext(111 downto 104),intext(103 downto 96),intext(127 downto 120),m1);
z3:invmixed32 port map(intext(111 downto 104),intext(103 downto 96),intext(127 downto 120),intext(119 downto 112),m2);
z4:invmixed32 port map(intext(103 downto 96),intext(127 downto 120),intext(119 downto 112),intext(111 downto 104),m3);

z5:invmixed32 port map(intext(95 downto 88),intext(87 downto 80),intext(79 downto 72),intext(71 downto 64),m4);
z6:invmixed32 port map(intext(87 downto 80),intext(79 downto 72),intext(71 downto 64),intext(95 downto 88),m5);
z7:invmixed32 port map(intext(79 downto 72),intext(71 downto 64),intext(95 downto 88),intext(87 downto 80),m6);
z8:invmixed32 port map(intext(71 downto 64),intext(95 downto 88),intext(87 downto 80),intext(79 downto 72),m7);

z9:invmixed32 port map(intext(63 downto 56),intext(55 downto 48),intext(47 downto 40),intext(39 downto 32),m8);
z10:invmixed32 port map(intext(55 downto 48),intext(47 downto 40),intext(39 downto 32),intext(63 downto 56),m9);
z11:invmixed32 port map(intext(47 downto 40),intext(39 downto 32),intext(63 downto 56),intext(55 downto 48),m10);
z12:invmixed32 port map(intext(39 downto 32),intext(63 downto 56),intext(55 downto 48),intext(47 downto 40),m11);

z13:invmixed32 port map(intext(31 downto 24),intext(23 downto 16),intext(15 downto 8),intext(7 downto 0),m12);
z14:invmixed32 port map(intext(23 downto 16),intext(15 downto 8),intext(7 downto 0),intext(31 downto 24),m13);
z15:invmixed32 port map(intext(15 downto 8),intext(7 downto 0),intext(31 downto 24),intext(23 downto 16),m14);
z16:invmixed32 port map(intext(7 downto 0),intext(31 downto 24),intext(23 downto 16),intext(15 downto 8),m15);

mixedtext <= m0 & m1 & m2 & m3 & m4 & m5 & m6 & m7 & m8 & m9 & m10 & m11 & m12 & m13 & m14 & m15;

end Behavioral;

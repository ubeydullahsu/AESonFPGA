library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity invmixed32 is
Port ( c1 : in STD_LOGIC_VECTOR (7 downto 0);
           c2 : in STD_LOGIC_VECTOR (7 downto 0);
           c3 : in STD_LOGIC_VECTOR (7 downto 0);
           c4 : in STD_LOGIC_VECTOR (7 downto 0);
           mixedout : out STD_LOGIC_VECTOR (7 downto 0));

end invmixed32;

architecture Behavioral of invmixed32 is

begin

mixedout(7) <= c1(6) xor c1(5) xor c1(4) xor c2(7) xor c2(6) xor c2(4) xor c3(7) xor c3(5) xor c3(4) xor c4(7) xor c4(4);

mixedout(6) <= c1(5) xor c1(4) xor c1(3) xor c2(6) xor c2(5) xor c2(3) xor c3(6) xor c3(4) xor c3(3) xor c4(6) xor c4(3);

mixedout(5) <= c1(4) xor c1(3) xor c1(2) xor c2(5) xor c2(4) xor c2(2) xor c3(5) xor c3(3) xor c3(2) xor c4(5) xor c4(2);

mixedout(4) <= c1(3) xor c1(2) xor c1(1) xor c1(7) xor c2(4) xor c2(3) xor c2(1) xor c2(7) xor c3(4) xor c3(2) xor c3(1) xor c4(4) xor c4(1);

mixedout(3) <= c1(0) xor c1(1) xor c1(2) xor c1(6) xor c2(0) xor c2(2) xor c2(3) xor c2(6) xor c3(0) xor c3(1) xor c3(3) xor c4(0) xor c4(3);

mixedout(2) <= c1(0) xor c1(1) xor c1(7) xor c2(1) xor c2(2) xor c2(7) xor c3(0) xor c3(2) xor c3(7) xor c4(2) xor c4(7);

mixedout(1) <= c1(0) xor c1(6) xor c1(7) xor c2(0) xor c2(1) xor c2(6) xor c2(7) xor c3(1) xor c3(6) xor c3(7) xor c4(1) xor c4(6);

mixedout(0) <= c1(5) xor c1(6) xor c1(7) xor c2(0) xor c2(6) xor c2(7) xor c3(0) xor c3(5) xor c3(6) xor c4(0) xor c4(5);

end Behavioral;
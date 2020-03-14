----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2019 22:30:26
-- Design Name: 
-- Module Name: decrtb - Behavioral
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

entity decrtb is
--  Port ( );
end decrtb;

architecture Behavioral of decrtb is

component decryption is
    Port ( ciphertext : in STD_LOGIC_VECTOR (127 downto 0);
           key : in STD_LOGIC_VECTOR (127 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           run : in STD_LOGIC;
           done : out STD_LOGIC;
           plaintext : out STD_LOGIC_VECTOR (127 downto 0));
end component;

signal clktb, resettb, runtb : std_logic;
signal donetb : std_logic := '0';
signal ciphertb, keyintb, plaintb : std_logic_vector (127 downto 0);
constant clk_period : time := 10 ns;

begin

uut : decryption port map(
                          ciphertext => ciphertb,
                          key => keyintb,
                          clk => clktb,
                          reset => resettb,
                          run => runtb,
                          done => donetb,
                          plaintext => plaintb);

clkproc : process
begin
clktb <= '0';
wait for clk_period/2;
clktb <= '1';
wait for clk_period/2;
end process;

stim_proc : process
begin
resettb <= '1';
ciphertb <=  x"2a70e038d6e70b749f47bb2a0df24c12";
keyintb <= x"746F6461792069732074686520646179";
runtb <= '1';
--donetb <= '0';
wait for 10 ns;

end process;


end Behavioral;

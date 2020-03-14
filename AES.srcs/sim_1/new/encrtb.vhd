----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2019 05:25:44
-- Design Name: 
-- Module Name: encrtb - Behavioral
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

entity encrtb is
--  Port ( );
end encrtb;

architecture Behavioral of encrtb is

component encryption is
    Port ( plaintext : in STD_LOGIC_VECTOR (127 downto 0);
           key : in STD_LOGIC_VECTOR (127 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           run : in STD_LOGIC;
           done : out STD_LOGIC;
           ciphertext : out STD_LOGIC_VECTOR (127 downto 0));
           --lastkey : inout std_logic_vector(127 downto 0));
end component;

signal clktb, resettb, runtb : std_logic;
signal donetb : std_logic := '0';
signal textintb, keyintb, ciphertb : std_logic_vector (127 downto 0);
constant clk_period : time := 10 ns;

begin

uut : encryption port map(
                              clk => clktb,
                              reset => resettb,
                              run => runtb,
                              done => donetb,
                              plaintext => textintb,
                              key => keyintb,
                              ciphertext => ciphertb);
                              --lastkey => keyouttb);

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
textintb <=  x"627567756E206861766120636F6B2021";
keyintb <= x"746F6461792069732074686520646179";
runtb <= '1';
--donetb <= '0';
wait for 10 ns;

end process;





end Behavioral;

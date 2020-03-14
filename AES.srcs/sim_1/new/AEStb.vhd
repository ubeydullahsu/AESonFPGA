----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.12.2019 23:20:30
-- Design Name: 
-- Module Name: AEStb - Behavioral
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

entity AEStb is
--  Port ( );
end AEStb;

architecture Behavioral of AEStb is

component AES is
    Port (intext : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in std_logic;
           reset : in std_logic;
           s : in std_logic;
           run : in std_logic;
           done_enc: out std_logic;
           done_dec: out std_logic;
           output : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal outtb, intb : std_logic_vector(7 downto 0);
signal clktb,resettb,runtb,doneenctb,donedectb,stb : std_logic;
constant clk_period : time := 1.5 ns;

begin

uut : AES port map(
                   intext => intb,
                    clk => clktb,
                    reset => resettb,
                    s => stb,
                    run => runtb,
                    done_enc => doneenctb,
                    done_dec => donedectb,
                    output => outtb);
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
intb <=  "11101000";
stb <= '1';
runtb <= '1';
--donetb <= '0';
wait for 1000000 ns;

end process;                    



end Behavioral;
-- Company:
-- Engineer:
-- 
-- Create Date: 20.12.2019 13:54:20
-- Design Name:
-- Module Name: AES - Behavioral
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
--use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AES is
    Port ( intext : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in std_logic;
           reset : in std_logic;
           s : in std_logic;
           run : in std_logic;
           done_enc: out std_logic;
           done_dec : out std_logic;
           output : out STD_LOGIC_VECTOR (7 downto 0));
end AES;

architecture Behavioral of AES is

component encryption is
    Port ( plaintext : in STD_LOGIC_VECTOR (127 downto 0);
           key : in STD_LOGIC_VECTOR (127 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           run : in STD_LOGIC;
           done : out STD_LOGIC;
           ciphertext : out STD_LOGIC_VECTOR (127 downto 0));
end component;

component Decryption is
    Port ( ciphertext : in STD_LOGIC_VECTOR (127 downto 0);
           key : in STD_LOGIC_VECTOR (127 downto 0);
           clk : in STD_LOGIC;
           reset :in STD_LOGIC;
           run : in STD_LOGIC;
           done : out STD_LOGIC;
           plaintext : out STD_LOGIC_VECTOR (127 downto 0));
end component;

signal textinvec : std_logic_vector (127 downto 0);
signal key : std_logic_vector (127 downto 0);
signal outputvec, enc_out, dec_out : std_logic_vector (127 downto 0) ;

--clock divider parameters
signal count: integer := 1;
signal tmp : std_logic := '0';
signal clockdiv : std_logic;

type ShiftRegister is (sh15, sh14, sh13,sh12, sh11, sh10,sh9, sh8,sh7, sh6, sh5, sh4, sh3, sh2, sh1, sh0);
signal currentregister, nextregister : ShiftRegister;

--signal Q_temp8, Q_temp7, Q_temp6, Q_temp5, Q_temp4, Q_temp3, Q_temp2, Q_temp1 : std_logic_vector(15 downto 0);



begin

key <= x"746F6461792069732074686520646179";

process(clk)

begin

if (clk'event and clk = '1') then

if (intext(7) = '1') then
    textinvec(127 downto 112) <= "1111111111111111";
else
    textinvec(127 downto 112) <= "0000000000000000";
end if;

if (intext(6) = '1') then
    textinvec(111 downto 96) <= "1111111111111111";
else
    textinvec(111 downto 96) <= "0000000000000000";
end if;

if (intext(5) = '1') then
    textinvec(95 downto 80) <= "1111111111111111";
else
    textinvec(95 downto 80) <= "0000000000000000";
end if;

if (intext(4) = '1') then
    textinvec(79 downto 64) <= "1111111111111111";
else
    textinvec(79 downto 64) <= "0000000000000000";
end if;

if (intext(3) = '1') then
    textinvec(63 downto 48) <= "1111111111111111";
else
    textinvec(63 downto 48) <= "0000000000000000";
end if;

if (intext(2) = '1') then
    textinvec(47 downto 32) <= "1111111111111111";
else
    textinvec(47 downto 32) <= "0000000000000000";
end if;

if (intext(1) = '1') then
    textinvec(31 downto 16) <= "1111111111111111";
else
    textinvec(31 downto 16) <= "0000000000000000";
end if;

if (intext(0) = '1') then
    textinvec(15 downto 0) <= "1111111111111111";
else
    textinvec(15 downto 0) <= "0000000000000000";
end if;
end if;


end process;


uut_enc: encryption port map (
                              clk => clk,
                              reset => reset,
                              run => run,
                              done => done_enc,
                              plaintext => textinvec,
                              key => key,
                              ciphertext => enc_out);
                             
 uut_dec : Decryption Port map( ciphertext => textinvec,
                                key => key,
                                clk => clk,
                                reset => reset,
                                run => run,
                                done => done_dec,
                                plaintext => dec_out);
mux: process(clk,reset)
begin
if(reset = '0') then
    outputvec <= x"00000000000000000000000000000000";
 elsif(clk'event and clk = '1') then                              
 if (S = '0') then
    outputvec <= enc_out;
 else
    outputvec <= dec_out;
end if;
end if;
end process;                      

process (clk)
begin
if(clk'event and clk='1') then
count <=count+1;
if (count = 16) then
tmp <= NOT tmp;
count <= 0;
end if;
end if;
clockdiv <= tmp;
end process;  
   
memorylogic : process (clockdiv,reset)
begin
    if(reset = '0') then
        currentregister <= sh14;
    elsif (clockdiv'event and clockdiv = '1') then
        currentregister <= nextregister;
    end if;
end process;

nextregisterlogic : process(currentregister)
begin
    case (currentregister) is
   
    when sh15 => nextregister <= sh14;
    when sh14 => nextregister <= sh13;
    when sh13 => nextregister <= sh12;
    when sh12 => nextregister <= sh11;
    when sh11 => nextregister <= sh10;
    when sh10 => nextregister <= sh9;
    when sh9 => nextregister <= sh8;
    when sh8 => nextregister <= sh7;
    when sh7 => nextregister <= sh6;
    when sh6 => nextregister <= sh5;
    when sh5 => nextregister <= sh4;
    when sh4 => nextregister <= sh3;
    when sh3 => nextregister <= sh2;
    when sh2 => nextregister <= sh1;
    when sh1 => nextregister <= sh0;
    when others => nextregister <= sh15;
   
    end case;
end process;

outputlogic: process(currentregister)
begin
    case (currentregister) is
    when sh15 => output <= outputvec(127 downto 120);
    when sh14 => output <= outputvec(119 downto 112);
    when sh13 => output <= outputvec(111 downto 104);
    when sh12 => output <= outputvec(103 downto 96);
    when sh11 => output <= outputvec(95 downto 88);
    when sh10 => output <= outputvec(87 downto 80);
    when sh9 => output <= outputvec(79 downto 72);
    when sh8 => output <= outputvec(71 downto 64);
    when sh7 => output <= outputvec(63 downto 56);
    when sh6 => output <= outputvec(55 downto 48);
    when sh5 => output <= outputvec(47 downto 40);
    when sh4 => output <= outputvec(39 downto 32);
    when sh3 => output <= outputvec(31 downto 24);
    when sh2 => output <= outputvec(23 downto 16);
    when sh1 => output <= outputvec(15 downto 8);
    when sh0 => output <= outputvec(7 downto 0);
    when others => output <= outputvec(127 downto 120);
   
    end case;    
end process;

end Behavioral;
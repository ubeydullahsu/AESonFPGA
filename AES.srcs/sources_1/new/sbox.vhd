----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.12.2019 18:16:59
-- Design Name: 
-- Module Name: sbox - Behavioral
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

entity sbox is
    Port ( inbox : in STD_LOGIC_VECTOR (7 downto 0);
           outbox : out STD_LOGIC_VECTOR (7 downto 0));
end sbox;

architecture Behavioral of sbox is

begin

uut : process(inbox)
begin

    case inbox is
            when "00000000"=>outbox<=x"63";
			when "00000001"=>outbox<=x"7c";
			when "00000010"=>outbox<=x"77";
			when "00000011"=>outbox<=x"7b";
			when "00000100"=>outbox<=x"f2";
			when "00000101"=>outbox<=x"6b";
			when "00000110"=>outbox<=x"6f";
			when "00000111"=>outbox<=x"c5";
			when "00001000"=>outbox<=x"30";
			when "00001001"=>outbox<=x"01";
			when "00001010"=>outbox<=x"67";
			when "00001011"=>outbox<=x"2b";
			when "00001100"=>outbox<=x"fe";
			when "00001101"=>outbox<=x"d7";
			when "00001110"=>outbox<=x"ab";
			when "00001111"=>outbox<=x"76";
			when "00010000"=>outbox<=x"ca";
			when "00010001"=>outbox<=x"82";
			when "00010010"=>outbox<=x"c9";
			when "00010011"=>outbox<=x"7d";
			when "00010100"=>outbox<=x"fa";
			when "00010101"=>outbox<=x"59";
			when "00010110"=>outbox<=x"47";
			when "00010111"=>outbox<=x"f0";
			when "00011000"=>outbox<=x"ad";
			when "00011001"=>outbox<=x"d4";
			when "00011010"=>outbox<=x"a2";
			when "00011011"=>outbox<=x"af";
			when "00011100"=>outbox<=x"9c";
			when "00011101"=>outbox<=x"a4";
			when "00011110"=>outbox<=x"72";
			when "00011111"=>outbox<=x"c0";
			when "00100000"=>outbox<=x"b7";
			when "00100001"=>outbox<=x"fd";
			when "00100010"=>outbox<=x"93";
			when "00100011"=>outbox<=x"26";
			when "00100100"=>outbox<=x"36";
			when "00100101"=>outbox<=x"3f";
			when "00100110"=>outbox<=x"f7";
			when "00100111"=>outbox<=x"cc";
			when "00101000"=>outbox<=x"34";
			when "00101001"=>outbox<=x"a5";
			when "00101010"=>outbox<=x"e5";
			when "00101011"=>outbox<=x"f1";
			when "00101100"=>outbox<=x"71";
			when "00101101"=>outbox<=x"d8";
			when "00101110"=>outbox<=x"31";
			when "00101111"=>outbox<=x"15";
			when "00110000"=>outbox<=x"04";
			when "00110001"=>outbox<=x"c7";
			when "00110010"=>outbox<=x"23";
			when "00110011"=>outbox<=x"c3";
			when "00110100"=>outbox<=x"18";
			when "00110101"=>outbox<=x"96";				
			when "00110110"=>outbox<=x"05";
			when "00110111"=>outbox<=x"9a";
			when "00111000"=>outbox<=x"07";
			when "00111001"=>outbox<=x"12";
			when "00111010"=>outbox<=x"80";
			when "00111011"=>outbox<=x"e2";
			when "00111100"=>outbox<=x"eb";
			when "00111101"=>outbox<=x"27";
			when "00111110"=>outbox<=x"b2";
			when "00111111"=>outbox<=x"75";
			when "01000000"=>outbox<=x"09";
			when "01000001"=>outbox<=x"83";
			when "01000010"=>outbox<=x"2c";
			when "01000011"=>outbox<=x"1a";
			when "01000100"=>outbox<=x"1b";
			when "01000101"=>outbox<=x"6e";
			when "01000110"=>outbox<=x"5a";
            when "01000111"=>outbox<=x"a0";
			when "01001000"=>outbox<=x"52";
			when "01001001"=>outbox<=x"3b";
			when "01001010"=>outbox<=x"d6";
			when "01001011"=>outbox<=x"b3";
			when "01001100"=>outbox<=x"29";
			when "01001101"=>outbox<=x"e3";
			when "01001110"=>outbox<=x"2f";
		    when "01001111"=>outbox<=x"84";
			when "01010000"=>outbox<=x"53";
			when "01010001"=>outbox<=x"d1";
			when "01010010"=>outbox<=x"00";
			when "01010011"=>outbox<=x"ed";
			when "01010100"=>outbox<=x"20";
			when "01010101"=>outbox<=x"fc";
			when "01010110"=>outbox<=x"b1";
			when "01010111"=>outbox<=x"5b";
			when "01011000"=>outbox<=x"6a";
			when "01011001"=>outbox<=x"cb";
			when "01011010"=>outbox<=x"be";
			when "01011011"=>outbox<=x"39";
			when "01011100"=>outbox<=x"4a";
			when "01011101"=>outbox<=x"4c";
			when "01011110"=>outbox<=x"58";
			when "01011111"=>outbox<=x"cf";
			when "01100000"=>outbox<=x"d0";
			when "01100001"=>outbox<=x"ef";
			when "01100010"=>outbox<=x"aa";
			when "01100011"=>outbox<=x"fb";
			when "01100100"=>outbox<=x"43";
			when "01100101"=>outbox<=x"4d";
			when "01100110"=>outbox<=x"33";
			when "01100111"=>outbox<=x"85";
			when "01101000"=>outbox<=x"45";
			when "01101001"=>outbox<=x"f9";
		    when "01101010"=>outbox<=x"02";
			when "01101011"=>outbox<=x"7f";
			when "01101100"=>outbox<=x"50";
			when "01101101"=>outbox<=x"3c";
			when "01101110"=>outbox<=x"9f";
			when "01101111"=>outbox<=x"a8";
			when "01110000"=>outbox<=x"51";
			when "01110001"=>outbox<=x"a3";
			when "01110010"=>outbox<=x"40";
			when "01110011"=>outbox<=x"8f";
			when "01110100"=>outbox<=x"92";
			when "01110101"=>outbox<=x"9d";
			when "01110110"=>outbox<=x"38";
		    when "01110111"=>outbox<=x"f5";
			when "01111000"=>outbox<=x"bc";
			when "01111001"=>outbox<=x"b6";
			when "01111010"=>outbox<=x"da";
			when "01111011"=>outbox<=x"21";
			when "01111100"=>outbox<=x"10";
			when "01111101"=>outbox<=x"ff";
			when "01111110"=>outbox<=x"f3";
			when "01111111"=>outbox<=x"d2";
			when "10000000"=>outbox<=x"cd";
			when "10000001"=>outbox<=x"0c";
			when "10000010"=>outbox<=x"13";
			when "10000011"=>outbox<=x"ec";
			when "10000100"=>outbox<=x"5f";
			when "10000101"=>outbox<=x"97";
			when "10000110"=>outbox<=x"44";
			when "10000111"=>outbox<=x"17";
			when "10001000"=>outbox<=x"c4";
			when "10001001"=>outbox<=x"a7";
			when "10001010"=>outbox<=x"7e";
			when "10001011"=>outbox<=x"3d";
			when "10001100"=>outbox<=x"64";
			when "10001101"=>outbox<=x"5d";
			when "10001110"=>outbox<=x"19";
			when "10001111"=>outbox<=x"73";
			when "10010000"=>outbox<=x"60";
			when "10010001"=>outbox<=x"81";
			when "10010010"=>outbox<=x"4f";
			when "10010011"=>outbox<=x"dc";
			when "10010100"=>outbox<=x"22";
			when "10010101"=>outbox<=x"2a";
			when "10010110"=>outbox<=x"90";
			when "10010111"=>outbox<=x"88";
			when "10011000"=>outbox<=x"46";
			when "10011001"=>outbox<=x"ee";
			when "10011010"=>outbox<=x"b8";
			when "10011011"=>outbox<=x"14";
			when "10011100"=>outbox<=x"de";
			when "10011101"=>outbox<=x"5e";
			when "10011110"=>outbox<=x"0b";
			when "10011111"=>outbox<=x"db";
			when "10100000"=>outbox<=x"e0";
			when "10100001"=>outbox<=x"32";
			when "10100010"=>outbox<=x"3a";
			when "10100011"=>outbox<=x"0a";
			when "10100100"=>outbox<=x"49";
			when "10100101"=>outbox<=x"06";
			when "10100110"=>outbox<=x"24";
			when "10100111"=>outbox<=x"5c";
			when "10101000"=>outbox<=x"c2";
			when "10101001"=>outbox<=x"d3";
			when "10101010"=>outbox<=x"ac";
			when "10101011"=>outbox<=x"62";
			when "10101100"=>outbox<=x"91";
			when "10101101"=>outbox<=x"95";
			when "10101110"=>outbox<=x"e4";
			when "10101111"=>outbox<=x"79";
			when "10110000"=>outbox<=x"e7";
			when "10110001"=>outbox<=x"c8";
			when "10110010"=>outbox<=x"37";
			when "10110011"=>outbox<=x"6d";
			when "10110100"=>outbox<=x"8d";
			when "10110101"=>outbox<=x"d5";
			when "10110110"=>outbox<=x"4e";
			when "10110111"=>outbox<=x"a9";
			when "10111000"=>outbox<=x"6c";
			when "10111001"=>outbox<=x"56";
			when "10111010"=>outbox<=x"f4";
			when "10111011"=>outbox<=x"ea";
			when "10111100"=>outbox<=x"65";
			when "10111101"=>outbox<=x"7a";
			when "10111110"=>outbox<=x"ae";
			when "10111111"=>outbox<=x"08";
			when "11000000"=>outbox<=x"ba";
			when "11000001"=>outbox<=x"78";
			when "11000010"=>outbox<=x"25";
			when "11000011"=>outbox<=x"2e";
			when "11000100"=>outbox<=x"1c";
			when "11000101"=>outbox<=x"a6";
			when "11000110"=>outbox<=x"b4";
			when "11000111"=>outbox<=x"c6";
			when "11001000"=>outbox<=x"e8";
			when "11001001"=>outbox<=x"dd";
			when "11001010"=>outbox<=x"74";
			when "11001011"=>outbox<=x"1f";
			when "11001100"=>outbox<=x"4b";
			when "11001101"=>outbox<=x"bd";
			when "11001110"=>outbox<=x"8b";
			when "11001111"=>outbox<=x"8a";
			when "11010000"=>outbox<=x"70";
			when "11010001"=>outbox<=x"3e";
			when "11010010"=>outbox<=x"b5";
			when "11010011"=>outbox<=x"66";
			when "11010100"=>outbox<=x"48";
			when "11010101"=>outbox<=x"03";
			when "11010110"=>outbox<=x"f6";
		    when "11010111"=>outbox<=x"0e";
			when "11011000"=>outbox<=x"61";
			when "11011001"=>outbox<=x"35";
			when "11011010"=>outbox<=x"57";
			when "11011011"=>outbox<=x"b9";
			when "11011100"=>outbox<=x"86";
			when "11011101"=>outbox<=x"c1";
			when "11011110"=>outbox<=x"1d";
			when "11011111"=>outbox<=x"9e";
			when "11100000"=>outbox<=x"e1";
			when "11100001"=>outbox<=x"f8";
			when "11100010"=>outbox<=x"98";
			when "11100011"=>outbox<=x"11";
			when "11100100"=>outbox<=x"69";
			when "11100101"=>outbox<=x"d9";
			when "11100110"=>outbox<=x"8e";
			when "11100111"=>outbox<=x"94";
			when "11101000"=>outbox<=x"9b";
			when "11101001"=>outbox<=x"1e";
			when "11101010"=>outbox<=x"87";
			when "11101011"=>outbox<=x"e9";
			when "11101100"=>outbox<=x"ce";
			when "11101101"=>outbox<=x"55";
			when "11101110"=>outbox<=x"28";
			when "11101111"=>outbox<=x"df";
			when "11110000"=>outbox<=x"8c";
			when "11110001"=>outbox<=x"a1";
			when "11110010"=>outbox<=x"89";
			when "11110011"=>outbox<=x"0d";
			when "11110100"=>outbox<=x"bf";
			when "11110101"=>outbox<=x"e6";
			when "11110110"=>outbox<=x"42";
			when "11110111"=>outbox<=x"68";
			when "11111000"=>outbox<=x"41";
			when "11111001"=>outbox<=x"99";
			when "11111010"=>outbox<=x"2d";
			when "11111011"=>outbox<=x"0f";
			when "11111100"=>outbox<=x"b0";
			when "11111101"=>outbox<=x"54";
			when "11111110"=>outbox<=x"bb";
			when "11111111"=>outbox<=x"16";
			
			when others=>outbox<= x"00";

        end case;

end process;


end Behavioral;

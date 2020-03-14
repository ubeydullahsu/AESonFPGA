----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2019 04:33:26
-- Design Name: 
-- Module Name: encryption - Behavioral
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

entity encryption is
    Port ( plaintext : in STD_LOGIC_VECTOR (127 downto 0);
           key : in STD_LOGIC_VECTOR (127 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           run : in STD_LOGIC;
           done : out STD_LOGIC;
           ciphertext : out STD_LOGIC_VECTOR (127 downto 0));
           --lastkey : inout std_logic_vector (127 downto 0));
end encryption;

architecture Behavioral of encryption is

component pre is
    Port ( prein : in STD_LOGIC_VECTOR (127 downto 0);
           prekey : in STD_LOGIC_VECTOR (127 downto 0);
           preout : out STD_LOGIC_VECTOR (127 downto 0));
end component;

component rounds is
    Port ( roundin : in STD_LOGIC_VECTOR (127 downto 0);
           keyin : in STD_LOGIC_VECTOR (127 downto 0);
           keyout : inout STD_LOGIC_VECTOR (127 downto 0);
           rcon : in STD_LOGIC_VECTOR (7 downto 0);
           roundout : out STD_LOGIC_VECTOR (127 downto 0));
end component;

component lastround is
    Port ( lastin : in STD_LOGIC_VECTOR (127 downto 0);
           lastkey : in STD_LOGIC_VECTOR (127 downto 0);
           rcon : in STD_LOGIC_VECTOR (7 downto 0);
           ciphertext : out STD_LOGIC_VECTOR (127 downto 0));
           --keyout: inout std_logic_vector(127 downto 0));
end component;

--signal i : std_logic_vector (3 downto 0) := "0000";
signal preout, roundout1, roundout2, roundout3, roundout4, roundout5, roundout6, roundout7, roundout8, roundout9, lastout : std_logic_vector (127 downto 0);
signal key1,key2,key3,key4,key5,key6,key7,key8,key9: std_logic_vector (127 downto 0);

type StateType is (initial, roundpre, firstround, secondround, thirdround, fourthround, fifthround, sixthround, seventhround, eighthround, ninthround, tenthround);
signal currentstate, nextstate : StateType;

begin
preround: pre port map (prein => plaintext,
                        prekey => key,
                        preout => preout);

round1: rounds port map(roundin => preout,
                        keyin => key,
                        keyout => key1,
                        rcon => x"01",
                        roundout => roundout1);

round2: rounds port map(roundin => roundout1,
                        keyin => key1,
                        keyout => key2,
                        rcon => x"02",
                        roundout => roundout2);

round3: rounds port map(roundin => roundout2,
                        keyin => key2,
                        keyout => key3,
                        rcon => x"04",
                        roundout => roundout3);

round4: rounds port map(roundin => roundout3,
                        keyin => key3,
                        keyout => key4,
                        rcon => x"08",
                        roundout => roundout4);

round5: rounds port map(roundin => roundout4,
                        keyin => key4,
                        keyout => key5,
                        rcon => x"10",
                        roundout => roundout5);

round6: rounds port map(roundin => roundout5,
                        keyin => key5,
                        keyout => key6,
                        rcon => x"20",
                        roundout => roundout6);

round7: rounds port map(roundin => roundout6,
                        keyin => key6,
                        keyout => key7,
                        rcon => x"40",
                        roundout => roundout7);

round8: rounds port map(roundin => roundout7,
                        keyin => key7,
                        keyout => key8,
                        rcon => x"80",
                        roundout => roundout8);

round9: rounds port map(roundin => roundout8,
                        keyin => key8,
                        keyout => key9,
                        rcon => x"1b",
                        roundout => roundout9);

round10: lastround port map(lastin => roundout9,
                            lastkey => key9,
                            rcon => x"36",
                            ciphertext => lastout);
                          --keyout => lastkey);

memorylogic : process (reset,clk)
--variable  i : integer range 0 to 10;
begin


if(reset = '0') then
    currentstate <= initial;
elsif (clk'event and clk = '1') then
    currentstate <= nextstate;
end if;

end process;

nextstatelogic : process (currentstate, run)
begin
case (currentstate) is
    when initial => if(run = '1') then
                        nextstate <= roundpre;
                       
                     else
                        nextstate <= initial;
                        done <= '0';
                     end if;
    when roundpre => if(run = '1') then
                        nextstate <= firstround;
                        
                     else
                        nextstate <= initial;
                        done <= '0';
                     end if;
                            
   when firstround => if(run = '1') then
                        nextstate <= secondround;
                       
                     else
                        nextstate <= initial;
                        done <= '0';
                     end if;
                     
   when secondround => if(run = '1') then
                        nextstate <= thirdround;
                        
                     else
                        nextstate <= initial;
                        done <= '0';
                     end if;
                     
   when thirdround => if(run = '1') then
                        nextstate <= fourthround;
                        
                     else
                        nextstate <= initial;
                        done <= '0';
                     end if;
                     
   when fourthround => if(run = '1') then
                        nextstate <= fifthround;
                        
                     else
                        nextstate <= initial;
                        done <= '0';
                     end if;
                     
   when fifthround => if(run = '1') then
                        nextstate <= sixthround;
                        
                     else
                        nextstate <= initial;
                        done <= '0';
                     end if;
                     
   when sixthround => if(run = '1') then
                        nextstate <= seventhround;
                                             

                     else
                        nextstate <= initial;
                        done <= '0';
                     end if;
                     
    when seventhround => if(run = '1') then
                        nextstate <= eighthround;
                        
                     else
                        nextstate <= initial;
                        done <= '0';
                     end if; 
                     
   when eighthround => if(run = '1') then
                        nextstate <= ninthround;
                        
                     else
                        nextstate <= initial;
                        done <= '0';
                     end if;
                     
   when ninthround => if(run = '1') then
                        nextstate <= tenthround;
                        
                     else
                        nextstate <= initial;
                        done <= '0';
                     end if;
    when tenthround => if(run = '1') then
                        done <= '1';
                        
                     else
                        done <= '0';
                     end if;
                                        
   when others => nextstate <= initial;
   
   end case;
   end process;
   
   outputlogic : process (currentstate, run)
   begin
   case (currentstate) is
   when initial => ciphertext <= plaintext;
   
   when roundpre => if( run = '1') then
                        ciphertext <= preout;
                    else
                        ciphertext <= plaintext;
                    end if;
                    
   when firstround => if( run = '1') then
                        ciphertext <= roundout1;
                    else
                        ciphertext <= plaintext;
                    end if;
                    
   when secondround => if( run = '1') then
                        ciphertext <= roundout2;
                    else
                        ciphertext <= plaintext;
                    end if;
                    
   when thirdround => if( run = '1') then
                        ciphertext <= roundout3;
                    else
                        ciphertext <= plaintext;
                    end if;
   
   when fourthround => if( run = '1') then
                        ciphertext <= roundout4;
                    else
                        ciphertext <= plaintext;
                    end if;                   
   
   when fifthround => if( run = '1') then
                        ciphertext <= roundout5;
                    else
                        ciphertext <= plaintext;
                    end if;  
   
   when sixthround => if( run = '1') then
                        ciphertext <= roundout6;
                    else
                        ciphertext <= plaintext;
                    end if;  
   
   when seventhround => if( run = '1') then
                        ciphertext <= roundout7;
                    else
                        ciphertext <= plaintext;
                    end if;  
   
   when eighthround => if( run = '1') then
                        ciphertext <= roundout8;
                    else
                        ciphertext <= plaintext;
                    end if;  
   
   when ninthround => if( run = '1') then
                        ciphertext <= roundout9;
                    else
                        ciphertext <= plaintext;
                    end if;  
   
   when tenthround => if (run = '1') then
                        ciphertext <= lastout;
                      else
                        ciphertext <= plaintext;
                      end if;
                     
   when others => ciphertext <= plaintext;
 
  end case;
  end process;
                           


end Behavioral;

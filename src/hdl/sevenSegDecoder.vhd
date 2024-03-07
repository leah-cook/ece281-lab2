----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/19/2024 05:23:59 PM
-- Design Name: 
-- Module Name: sevenSegDecoder - Behavioral
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

entity sevenSegDecoder is
    Port ( i_D : in STD_LOGIC_VECTOR (3 downto 0);
           o_S : out STD_LOGIC_VECTOR (6 downto 0));
end sevenSegDecoder;

architecture Behavioral of sevenSegDecoder is
signal c_Sa, c_Sb, c_Sc, c_Sd, c_Se, c_Sf, c_Sg : std_logic;

begin
o_S(0) <= c_Sa;
o_S(1) <= c_Sb;
o_S(2) <= c_Sc;
o_S(3) <= c_Sd;
o_S(4) <= c_Se;
o_S(5) <= c_Sf;
o_S(6) <= c_Sg;

c_Sa <=  (not i_D(3) and not i_D(2) and not i_D(1) and i_D(0))
         or (i_D(3) and not i_D(2) and i_D(1) and i_D(0))
         or (i_D(2) and not i_D(1) and not i_D(0))
         or (i_D(3) and i_D(2) and not i_D(1));
         

c_Sb <= (i_D(3) and i_D(2) and not i_D(0)) 
        or (not i_D(3) and i_D(2) and not i_D(1) and i_D(0))
        or (i_D(3) and i_D(1) and i_D(0))
        or (i_D(2) and i_D(1) and not i_D(0));

c_Sc <= (i_D(3) and i_D(2) and not i_D(0))
        or (not i_D(3) and not i_D(2) and i_D(1) and not i_D(0))
        or (i_D(3) and i_D(2) and i_D(1)); 

c_Sd <= '1' when ( (i_D=x"1") or
                   (i_D=x"4") or  
                   (i_D=x"7") or
                   (i_D=x"F") or
                   (i_D=x"9") or
                   (i_D=x"A") ) else '0';
                   
c_Se <= '1' when ( (i_D=x"1") or
                   (i_D=x"3") or  
                   (i_D=x"4") or
                   (i_D=x"5") or
                   (i_D=x"9") or
                   (i_D=x"7") ) else '0';                   

c_Sf <= '1' when ( (i_D=x"1") or
                   (i_D=x"2") or  
                   (i_D=x"3") or
                   (i_D=x"7") or
                   (i_D=x"C") or
                   (i_D=x"D") ) else '0';                   

c_Sg <= '1' when ( (i_D=x"0") or
                   (i_D=x"1") or                   
                   (i_D=x"7") ) else '0';
                   
                   
end Behavioral;
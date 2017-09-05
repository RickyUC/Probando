----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.08.2017 01:07:30
-- Design Name: 
-- Module Name: restador16bits - Behavioral
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

entity restador16bits is
    Port ( a : in std_logic_vector(15 to 0);
           b : in std_logic_vector(15 to 0);
           s : inout std_logic_vector(15 to 0);
           c_out : out STD_LOGIC;
           z_out : out STD_LOGIC;
           n_out : inout STD_LOGIC);

end restador16bits;

architecture Behavioral of restador16bits is
    component sumador16bits is
    --  Port ( );
    Port ( a : in std_logic_vector(15 to 0);
           b : in std_logic_vector(15 to 0);
           cin : in STD_LOGIC;
           s : inout std_logic_vector(15 to 0);
           c_out : out STD_LOGIC;
           z_out : out STD_LOGIC;
           n_out : out STD_LOGIC);
    end component;
    
signal one_value: std_logic := '1';
signal two_value: std_logic := '1';
signal three_value: std_logic := '1';

signal b_neg: std_logic_vector(15 to 0);
signal g: std_logic_vector(15 to 0);
signal e: std_logic_vector(15 to 0);
signal l: std_logic_vector(15 to 0);

begin
    b_neg <= not(b);
    u0 : sumador16bits port map (a,b_neg, one_value, s, c_out, two_value, three_value);
   

    g <= a and not(b);   -- A > B
    e <= not(a xor b);    -- A = B
    l <= not(a) and b;   -- A < B
    
    with s select z_out <=
        '1' when "0000000000000000",
        '0' when others;
            
    with l(0) select n_out <=
        '1' when '1',
         n_out when others;
         
    with g(0) select n_out <=
         '0' when '1',
          n_out when others;
    
    with l(1) select n_out <=
        '1' when '1',
         n_out when others;
         
    with g(1) select n_out <=
         '0' when '1',
          n_out when others;
    
    with l(2) select n_out <=
        '1' when '1',
         n_out when others;
         
    with g(2) select n_out <=
         '0' when '1',
          n_out when others;
    
    with l(3) select n_out <=
        '1' when '1',
         n_out when others;
         
    with g(3) select n_out <=
         '0' when '1',
          n_out when others;
    
    with l(4) select n_out <=
        '1' when '1',
         n_out when others;
         
    with g(4) select n_out <=
         '0' when '1',
          n_out when others;
    
    with l(5) select n_out <=
        '1' when '1',
         n_out when others;
         
    with g(5) select n_out <=
         '0' when '1',
          n_out when others;
     
    with l(6) select n_out <=
         '1' when '1',
          n_out when others;
               
    with g(6) select n_out <=
          '0' when '1',
           n_out when others;
    
    with l(7) select n_out <=
        '1' when '1',
         n_out when others;
         
    with g(7) select n_out <=
         '0' when '1',
          n_out when others;
    
    with l(8) select n_out <=
        '1' when '1',
         n_out when others;
         
    with g(8) select n_out <=
         '0' when '1',
          n_out when others;
    
    with l(9) select n_out <=
        '1' when '1',
         n_out when others;
         
    with g(9) select n_out <=
         '0' when '1',
          n_out when others;
    
    with l(10) select n_out <=
        '1' when '1',
         n_out when others;
         
    with g(10) select n_out <=
         '0' when '1',
          n_out when others;
    
    with l(11) select n_out <=
        '1' when '1',
         n_out when others;
         
    with g(11) select n_out <=
         '0' when '1',
          n_out when others;
    
    with l(12) select n_out <=
        '1' when '1',
         n_out when others;
         
    with g(12) select n_out <=
         '0' when '1',
          n_out when others;
     
    with l(13) select n_out <=
         '1' when '1',
          n_out when others;
               
    with g(13) select n_out <=
         '0' when '1',
          n_out when others;
    
    with l(14) select n_out <=
        '1' when '1',
         n_out when others;
         
    with g(14) select n_out <=
         '0' when '1',
          n_out when others;
     
    with l(15) select n_out <=
         '1' when '1',
          n_out when others;
               
    with g(15) select n_out <=
        '0' when '1',
         n_out when others;  
end Behavioral;
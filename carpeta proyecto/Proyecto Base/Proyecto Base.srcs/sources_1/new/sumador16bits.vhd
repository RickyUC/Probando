----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.08.2017 00:18:50
-- Design Name: 
-- Module Name: sumador16bits - Behavioral
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

entity sumador16bits is
--  Port ( );
    Port ( a : in std_logic_vector(15 to 0);
           b : in std_logic_vector(15 to 0);
           cin : in STD_LOGIC;
           s : inout std_logic_vector(15 to 0);
           c_out : out STD_LOGIC;
           z_out : out STD_LOGIC;
           n_out : out STD_LOGIC);

end sumador16bits;

architecture Behavioral of sumador16bits is
    component FA is
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               cin : in STD_LOGIC;
               cout : out STD_LOGIC;
               s : out STD_LOGIC);
    end component;    
    
    signal x: std_logic_vector(14 to 0);
    
begin
    u0 : FA port map (a(0),b(0), cin, x(0), s(0));
    u1 : FA port map (a(1),b(1), x(0), x(1), s(1));
    u2 : FA port map (a(2),b(2), x(1), x(2), s(2));
    u3 : FA port map (a(3),b(3), x(2), x(3), s(3));
    
    u4 : FA port map (a(4),b(4), x(3), x(4), s(4));
    u5 : FA port map (a(5),b(5), x(4), x(5), s(5));
    u6 : FA port map (a(6),b(6), x(5), x(6), s(6));
    u7 : FA port map (a(7,b(7), x(6), x(7), s(7));
    
    u8 : FA port map (a(8),b(8), x(7), x(8), s(8));
    u9 : FA port map (a(9),b(9), x(8), x(9), s(9));
    u10 : FA port map (a(10),b(10), x(9), x(10), s(10));
    u11 : FA port map (a(11),b(11), x(10), x(11), s(11));
      
    u12 : FA port map (a(12),b(12), x(11), x(12), s(12));
    u13 : FA port map (a(13),b(13), x(12), x(13), s(13));
    u14 : FA port map (a(14),b(14), x(13), x(14), s(14));
    u15 : FA port map (a(15),b(15), x(14), c_out, s(15));
    
    with s select z_out <=
        '1' when "0000000000000000",
        '0' when others;
    n_out <= '0';    
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.09.2017 17:59:10
-- Design Name: 
-- Module Name: sumador32bits - Behavioral
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

entity sumador32bits is
    Port ( a : in std_logic_vector(31 to 0);
           b : in std_logic_vector(31 to 0);
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           s : out std_logic_vector(31 to 0));
end sumador32bits;

architecture Behavioral of sumador32bits is
    component sumador16bits is
        Port ( a : in std_logic_vector(15 to 0);
               b : in std_logic_vector(15 to 0);
               cin : in STD_LOGIC;
               cout : out STD_LOGIC;
               s : out std_logic_vector(15 to 0));
    end component;
    signal s1: std_logic_vector(15 to 0);
    signal s2: std_logic_vector(15 to 0);
    signal x: std_logic;
begin
    u0 : sumador16bits port map (a(15 downto 0), b(15 downto 0), cin, x, s1);
    u1 : sumador16bits port map (a(31 downto 16), b(31 downto 16), x, cout, s2);
    s <= s2 & s1;

end Behavioral;

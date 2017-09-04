----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.08.2017 22:43:09
-- Design Name: 
-- Module Name: FA - Behavioral
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

entity FA is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           s : out STD_LOGIC);
end FA;

architecture Behavioral of FA is
    component HA is
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               s : out STD_LOGIC;
               c : out STD_LOGIC);
    end component;
    
    component OR_GATE is
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               c : out STD_LOGIC);
    end component;
    
    signal x0: std_logic;
    signal x1: std_logic;
    signal x2: std_logic;
begin
    u0 : HA port map (a,b, x0, x1);
    u1 : HA port map (x0, cin, s, x2);
    u2 : OR_GATE port map (x1, x2, cout);

end Behavioral;

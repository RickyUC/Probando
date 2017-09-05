----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.09.2017 23:28:54
-- Design Name: 
-- Module Name: AND_GATE16bits - Behavioral
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

entity AND_GATE16bits is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           c : inout  STD_LOGIC_VECTOR (15 downto 0);
           c_out : inout std_logic;
           z_out : inout std_logic;
           n_out : inout std_logic);
           
end AND_GATE16bits;

architecture Behavioral of AND_GATE16bits is

begin

c <= a and b;
c_out <= '0';
with c select z_out <=
    '1' when "0000000000000000",
    '0' when others;
n_out <= '0';


end Behavioral;

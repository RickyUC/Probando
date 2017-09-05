----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.09.2017 23:31:30
-- Design Name: 
-- Module Name: NOT_GATE16bits - Behavioral
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

entity NOT_GATE16bits is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : inout  STD_LOGIC_VECTOR (15 downto 0);
           c_out: out std_logic;
           z_out: out std_logic;
           n_out: out std_logic);
           
end NOT_GATE16bits;

architecture Behavioral of NOT_GATE16bits is

begin

b <= not(a);
c_out <= '0';
with b select z_out <=
    '1' when "0000000000000000",
    '0' when others;
n_out <= '0';

end Behavioral;

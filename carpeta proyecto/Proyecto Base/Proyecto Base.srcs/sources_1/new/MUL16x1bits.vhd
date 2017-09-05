----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.09.2017 00:39:11
-- Design Name: 
-- Module Name: MUL16x1bits - Behavioral
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

entity MUL16x1bits is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
       b : in  STD_LOGIC;
       c : out  STD_LOGIC_VECTOR (15 downto 0));
end MUL16x1bits;

architecture Behavioral of MUL16x1bits is

begin
with b select

   c <= a when '1',
   "0000000000000000" when others;

end Behavioral;

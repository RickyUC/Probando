----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.09.2017 17:38:21
-- Design Name: 
-- Module Name: muxer16bits - Behavioral
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxer16bits is
    Port ( SEL : in  STD_LOGIC_VECTOR (3 downto 0);     -- select input
           add   : in  STD_LOGIC_VECTOR (15 downto 0);     -- inputs
           add_c : in std_logic;
           add_z : in std_logic;
           add_n : in std_logic;
           
           sub   : in  STD_LOGIC_VECTOR (15 downto 0);     -- inputs
           sub_c : in std_logic;
           sub_z : in std_logic;
           sub_n : in std_logic;
           
           and_operator   : in  STD_LOGIC_VECTOR (15 downto 0);     -- inputs
           and_c : in std_logic;
           and_z : in std_logic;
           and_n : in std_logic;
           
           or_operator   : in  STD_LOGIC_VECTOR (15 downto 0);     -- inputs
           or_c : in std_logic;
           or_z : in std_logic;
           or_n : in std_logic;
           
           xor_operator   : in  STD_LOGIC_VECTOR (15 downto 0);     -- inputs
           xor_c : in std_logic;
           xor_z : in std_logic;
           xor_n : in std_logic;
           
           mul   : in  STD_LOGIC_VECTOR (15 downto 0);     -- inputs
           mul_c : in std_logic;
           mul_z : in std_logic;
           mul_n : in std_logic;
           
           not_operator   : in  STD_LOGIC_VECTOR (15 downto 0);     -- inputs
           not_c : in std_logic;
           not_z : in std_logic;
           not_n : in std_logic;
           shr_operator   : in  STD_LOGIC_VECTOR (15 downto 0);     -- inputs
           shr_c : in std_logic;
           shr_z : in std_logic;
           shr_n : in std_logic;
           shl_operator   : in  STD_LOGIC_VECTOR (15 downto 0);     -- inputs
           shl_c : in std_logic;
           shl_z : in std_logic;
           shl_n : in std_logic;
           
           output   : out  STD_LOGIC_VECTOR (15 downto 0);     -- inputs
           c_output : out std_logic;
           z_output : out std_logic;
           n_output : out std_logic);
end muxer16bits;

architecture Behavioral of muxer16bits is
begin
with SEL select

   output <= add when "0000",
          sub when "0001",
          and_operator when "0010",
          or_operator when "0011",
          xor_operator when "0100",
          mul when "0101",
          not_operator when "0110",
          shr_operator when "0111",
          shl_operator when "1000",
   "0000000000000000" when others;
  
with SEL select
    c_output <= add_c when "0000",
          sub_c when "0001",
          and_c when "0010",
          or_c when "0011",
          xor_c when "0100",
          mul_c when "0101",
          not_c when "0110",
          shr_c when "0111",
          shl_c when "1000",
   '0' when others;

with SEL select
       z_output <= add_z when "0000",
             sub_z when "0001",
             and_z when "0010",
             or_z when "0011",
             xor_z when "0100",
             mul_z when "0101",
             not_z when "0110",
             shr_z when "0111",
             shl_z when "1000",
      '0' when others;

with SEL select
    n_output <= add_n when "0000",
          sub_n when "0001",
          and_n when "0010",
          or_n when "0011",
          xor_n when "0100",
          mul_n when "0101",
          not_n when "0110",
          shr_n when "0111",
          shl_n when "1000",
   '0' when others;

end Behavioral;

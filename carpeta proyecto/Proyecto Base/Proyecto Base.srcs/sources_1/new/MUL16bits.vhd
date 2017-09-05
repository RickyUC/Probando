----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.09.2017 19:11:48
-- Design Name: 
-- Module Name: MUL16bits - Behavioral
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

entity MUL16bits is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           c : inout  STD_LOGIC_VECTOR (31 downto 0);
           c_out: out std_logic;
           z_out: out std_logic;
           n_out: out std_logic);
           
end MUL16bits;

architecture Behavioral of MUL16bits is
    component MUL16x1bits is
        Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
               b : in  STD_LOGIC;
               c : out  STD_LOGIC_VECTOR (15 downto 0));
    end  component;
    
    component sumador32bits is
                   Port ( a : in std_logic_vector(31 to 0);
                          b : in std_logic_vector(31 to 0);
                          cin : in STD_LOGIC;
                          cout : out STD_LOGIC;
                          s : out std_logic_vector(31 to 0));
    end component;

signal sum0_0: std_logic_vector(15 to 0);
signal sum0_1: std_logic_vector(31 to 0);
signal sum1_0: std_logic_vector(15 to 0);
signal sum1_1: std_logic_vector(31 to 0);
signal sum2_0: std_logic_vector(15 to 0);
signal sum2_1: std_logic_vector(31 to 0);
signal sum3_0: std_logic_vector(15 to 0);
signal sum3_1: std_logic_vector(31 to 0);

signal sum4_0: std_logic_vector(15 to 0);
signal sum4_1: std_logic_vector(31 to 0);
signal sum5_0: std_logic_vector(15 to 0);
signal sum5_1: std_logic_vector(31 to 0);
signal sum6_0: std_logic_vector(15 to 0);
signal sum6_1: std_logic_vector(31 to 0);
signal sum7_0: std_logic_vector(15 to 0);
signal sum7_1: std_logic_vector(31 to 0);

signal sum8_0: std_logic_vector(15 to 0);
signal sum8_1: std_logic_vector(31 to 0);
signal sum9_0: std_logic_vector(15 to 0);
signal sum9_1: std_logic_vector(31 to 0);
signal sum10_0: std_logic_vector(15 to 0);
signal sum10_1: std_logic_vector(31 to 0);
signal sum11_0: std_logic_vector(15 to 0);
signal sum11_1: std_logic_vector(31 to 0);

signal sum12_0: std_logic_vector(15 to 0);
signal sum12_1: std_logic_vector(31 to 0);
signal sum13_0: std_logic_vector(15 to 0);
signal sum13_1: std_logic_vector(31 to 0);
signal sum14_0: std_logic_vector(15 to 0);
signal sum14_1: std_logic_vector(31 to 0);
signal sum15_0: std_logic_vector(15 to 0);
signal sum15_1: std_logic_vector(31 to 0);

signal res1: std_logic_vector(31 to 0);
signal res2: std_logic_vector(31 to 0);
signal res3: std_logic_vector(31 to 0);

signal res4: std_logic_vector(31 to 0);
signal res5: std_logic_vector(31 to 0);
signal res6: std_logic_vector(31 to 0);
signal res7: std_logic_vector(31 to 0);

signal res8: std_logic_vector(31 to 0);
signal res9: std_logic_vector(31 to 0);
signal res10: std_logic_vector(31 to 0);
signal res11: std_logic_vector(31 to 0);

signal res12: std_logic_vector(31 to 0);
signal res13: std_logic_vector(31 to 0);
signal res14: std_logic_vector(31 to 0);

signal cin: std_logic := '0';
signal cout: std_logic_vector(14 to 0);

begin
    
    u0 : MUL16x1bits port map (a,b(0), sum0_0);
    sum0_1 <= "0000000000000000" & sum0_0 & "";
    u1 : MUL16x1bits port map (a,b(1), sum1_0);
    sum1_1 <= "000000000000000" & sum1_0 & '0';
    u2 : MUL16x1bits port map (a,b(2), sum2_0);
    sum2_1 <= "00000000000000" & sum2_0 & "00";
    u3 : MUL16x1bits port map (a,b(3), sum3_0);
    sum3_1 <= "0000000000000" & sum3_0 & "000";
    
    u4 : MUL16x1bits port map (a,b(4), sum4_0);
    sum4_1 <= "000000000000" & sum4_0 & "0000";
    u5 : MUL16x1bits port map (a,b(5), sum5_0);
    sum5_1 <= "00000000000" & sum5_0 & "00000";
    u6 : MUL16x1bits port map (a,b(6), sum6_0);
    sum6_1 <= "0000000000" & sum6_0 & "000000";
    u7 : MUL16x1bits port map (a,b(7), sum7_0);
    sum7_1 <= "000000000" & sum7_0 & "0000000";
    
    u8 : MUL16x1bits port map (a,b(8), sum8_0);
    sum8_1 <= "00000000" & sum8_0 & "00000000";
    u9 : MUL16x1bits port map (a,b(9), sum9_0);
    sum9_1 <= "0000000" & sum9_0 & "000000000";
    u10 : MUL16x1bits port map (a,b(10), sum10_0);
    sum10_1 <= "000000" & sum10_0 & "0000000000";
    u11 : MUL16x1bits port map (a,b(11), sum11_0);
    sum11_1 <= "00000" & sum11_0 & "00000000000";
    
    u12 : MUL16x1bits port map (a,b(12), sum12_0);
    sum12_1 <= "0000" & sum12_0 & "000000000000";
    u13 : MUL16x1bits port map (a,b(13), sum13_0);
    sum13_1 <= "000" & sum13_0 & "0000000000000";
    u14 : MUL16x1bits port map (a,b(14), sum14_0);
    sum14_1 <= "00" & sum14_0 & "00000000000000";
    u15 : MUL16x1bits port map (a,b(15), sum15_0);
    sum15_1 <= '0' & sum15_0 & "000000000000000";
    
    s1: sumador32bits port map (sum0_1, sum1_1, cin, cout(0), res1);
    s2: sumador32bits port map (res1, sum2_1, cin, cout(1), res2);
    s3: sumador32bits port map (res2, sum3_1, cin, cout(2), res3);
    s4: sumador32bits port map (res3, sum4_1, cin, cout(3), res4);
    
    s5: sumador32bits port map (res4, sum5_1, cin, cout(4), res5);
    s6: sumador32bits port map (res5, sum6_1, cin, cout(5), res6);
    s7: sumador32bits port map (res6, sum7_1, cin, cout(6), res7);
    s8: sumador32bits port map (res7, sum8_1, cin, cout(7), res8);
    
    s9: sumador32bits port map (res8, sum9_1, cin, cout(8), res9);
    s10: sumador32bits port map (res9, sum10_1, cin, cout(9), res10);
    s11: sumador32bits port map (res10, sum11_1, cin, cout(10), res11);
    s12: sumador32bits port map (res11, sum12_1, cin, cout(11), res12);
    
    s13: sumador32bits port map (res12, sum13_1, cin, cout(12), res13);
    s14: sumador32bits port map (res13, sum14_1, cin, cout(13), res14);
    s15: sumador32bits port map (res14, sum15_1, cin, cout(14), c);
    
    c_out <= '0';
    
    with c select z_out <=
        '1' when "0000000000000000",
        '0' when others;
        
    n_out <= '0';
end Behavioral;

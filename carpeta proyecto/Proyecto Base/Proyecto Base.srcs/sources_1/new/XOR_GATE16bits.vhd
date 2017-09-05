library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity XOR_GATE16bits is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           c : inout  STD_LOGIC_VECTOR (15 downto 0);
           c_out: out std_logic;
           z_out: out std_logic;
           n_out: out std_logic);
           
end XOR_GATE16bits;

architecture Behavioral of XOR_GATE16bits is

begin

c <= a xor b;
c_out <= '0';
with c select z_out <=
    '1' when "0000000000000000",
    '0' when others;
n_out <= '0';

end Behavioral;
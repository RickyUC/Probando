library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SHR16bits is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : inout  STD_LOGIC_VECTOR (15 downto 0);
           c_out: out std_logic;
           z_out: out std_logic;
           n_out: out std_logic);
end SHR16bits;

architecture Behavioral of SHR16bits is

begin
    b <= '0' & a(15 downto 1);
    c_out <= a(0);
    with b select z_out <=
         '1' when "0000000000000000",
         '0' when others;
    n_out <= '0';
end Behavioral;
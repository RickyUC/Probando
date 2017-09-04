library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port ( a        : in  std_logic_vector (15 downto 0);   -- Primer operando.
           b        : in  std_logic_vector (15 downto 0);   -- Segundo operando.
           sop      : in  std_logic_vector (2 downto 0);    -- Selector de la operación.
           c        : out std_logic;                        -- Señal de 'carry'.
           z        : out std_logic;                        -- Señal de 'zero'.
           n        : out std_logic;                        -- Señal de 'nagative'.
           result   : out std_logic_vector (15 downto 0));  -- Resultado de la operación.
end ALU;

architecture Behavioral of ALU is

component sumador16bits
--  Port ( );
    Port ( a : in std_logic_vector(15 to 0);
       b : in std_logic_vector(15 to 0);
       cin : in STD_LOGIC;
       s : inout std_logic_vector(15 to 0);
       c_out : out STD_LOGIC;
       z_out : out STD_LOGIC;
       n_out : out STD_LOGIC);
    end component;

component restador16bits 
    Port ( a : in std_logic_vector(15 to 0);
       b : in std_logic_vector(15 to 0);
       s : inout std_logic_vector(15 to 0);
       c_out : out STD_LOGIC;
       z_out : out STD_LOGIC;
       n_out : inout STD_LOGIC);
    end component;

component AND_GATE16bits 
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
       b : in  STD_LOGIC_VECTOR (15 downto 0);
       c : inout  STD_LOGIC_VECTOR (15 downto 0);
       c_out : inout std_logic;
       z_out : inout std_logic;
       n_out : inout std_logic);
    end component;

component OR_GATE16bits
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
       b : in  STD_LOGIC_VECTOR (15 downto 0);
       c : inout  STD_LOGIC_VECTOR (15 downto 0);
       c_out: out std_logic;
       z_out: out std_logic;
       n_out: out std_logic);
    end component;

component XOR_GATE16bits 
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
       b : in  STD_LOGIC_VECTOR (15 downto 0);
       c : inout  STD_LOGIC_VECTOR (15 downto 0);
       c_out: out std_logic;
       z_out: out std_logic;
       n_out: out std_logic);
    end component;

component MUL16bits 
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
       b : in  STD_LOGIC_VECTOR (15 downto 0);
       c : inout  STD_LOGIC_VECTOR (31 downto 0);
       c_out: out std_logic;
       z_out: out std_logic;
       n_out: out std_logic);
    end component;

component NOT_GATE16bits 
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
       b : inout  STD_LOGIC_VECTOR (15 downto 0);
       c_out: out std_logic;
       z_out: out std_logic;
       n_out: out std_logic);
    end component;

component SHR16bits 
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
       b : inout  STD_LOGIC_VECTOR (15 downto 0);
       c_out: out std_logic;
       z_out: out std_logic;
       n_out: out std_logic);
    end component;

component SHL16bits 
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
       b : inout  STD_LOGIC_VECTOR (15 downto 0);
       c_out: out std_logic;
       z_out: out std_logic;
       n_out: out std_logic);
    end component;

component muxer16bits
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
    end component;



signal sum: std_logic_vector(15 to 0);
signal sum_signals: std_logic_vector(2 to 0);

signal resta: std_logic_vector(15 to 0);
signal resta_signals: std_logic_vector(2 to 0);

signal mul: std_logic_vector(15 to 0);
signal mul_signals: std_logic_vector(2 to 0);

signal op_and: std_logic_vector(15 to 0);
signal and_signals: std_logic_vector(2 to 0);
                                      
signal op_or: std_logic_vector(15 to 0);
signal or_signals: std_logic_vector(2 to 0);
signal op_xor: std_logic_vector(15 to 0);
signal xor_signals: std_logic_vector(2 to 0);

signal op_not: std_logic_vector(15 to 0);
signal not_signals: std_logic_vector(2 to 0);
signal op_shl: std_logic_vector(15 to 0);
signal shl_signals: std_logic_vector(2 to 0);
signal op_shr: std_logic_vector(15 to 0);
signal shr_signals: std_logic_vector(2 to 0);

signal cin: std_logic := '0';
signal cout: std_logic;
begin
    u0: sumador16bits  port map (a,b, cin, sum, sum_signals(0),sum_signals(1),sum_signals(2));
    u1: restador16bits  port map (a,b, resta, resta_signals(0),resta_signals(1),resta_signals(2));
    u2: MUL16bits  port map (a,b, mul, mul_signals(0),mul_signals(1),mul_signals(2));
    u3: AND_GATE16bits  port map (a,b, op_and, and_signals(0),and_signals(1),and_signals(2));
    
    u4: OR_GATE16bits  port map (a,b, op_or, or_signals(0),or_signals(1),or_signals(2));
    u5: XOR_GATE16bits  port map (a,b, op_xor, xor_signals(0),xor_signals(1),xor_signals(2));
    u6: NOT_GATE16bits  port map (a, op_not, not_signals(0),not_signals(1),not_signals(2));
    u7: SHL16bits  port map (a, op_shl, shl_signals(0), shl_signals(1), shl_signals(2));
    
    u8: SHR16bits  port map (a, op_shr, shr_signals(0),shr_signals(1),shr_signals(2));
    
    u9: muxer16bits port map(
    sop,
    sum,sum_signals(0),sum_signals(1),sum_signals(2),
    resta,resta_signals(0),resta_signals(1),resta_signals(2),
    mul,mul_signals(0),mul_signals(1),mul_signals(2),
    op_and,and_signals(0),and_signals(1),and_signals(2),
    op_or,or_signals(0),or_signals(1),or_signals(2),
    op_xor,xor_signals(0),xor_signals(1),xor_signals(2),
    op_not,not_signals(0),not_signals(1),not_signals(2),
    op_shl,shl_signals(0),shl_signals(1),shl_signals(2),
    op_shr,shr_signals(0),shr_signals(1),shr_signals(2),
    result,c,z,n);
    
    
end Behavioral;

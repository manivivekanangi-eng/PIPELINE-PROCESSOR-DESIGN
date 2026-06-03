library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pipeline_cpu is
    Port (
        clk       : in STD_LOGIC;
        PC_out    : out std_logic_vector(15 downto 0);
        IF_ID_out : out std_logic_vector(15 downto 0);
        ID_EX_out : out std_logic_vector(15 downto 0);
        EX_res_out: out std_logic_vector(15 downto 0)
    );
end pipeline_cpu;

architecture Behavioral of pipeline_cpu is

type reg_array is array(0 to 7) of integer;
signal reg_file : reg_array := (10, 5, 0, 0, 0, 0, 0, 0);

type mem_array is array(0 to 7) of std_logic_vector(15 downto 0);
signal instr_mem : mem_array :=
(
    0 => "0001001100010010", -- ADD  R3, R1, R2  (10 + 5 = 15)
    1 => "0010010000010010", -- SUB  R4, R1, R2  (10 - 5 = 5)
    2 => "0011000100000000", -- LOAD R1, Immediate
    others => (others => '0')
);

signal PC : integer := 0;
signal IF_ID : std_logic_vector(15 downto 0) := (others => '0');
signal ID_EX : std_logic_vector(15 downto 0) := (others => '0');
signal EX_result : integer := 0;
signal WB_dest   : integer := 0;

begin

-- Map internal signals to top-level external pins
PC_out     <= std_logic_vector(to_unsigned(PC, 16));
IF_ID_out  <= IF_ID;
ID_EX_out  <= ID_EX;
EX_res_out <= std_logic_vector(to_unsigned(EX_result, 16));

process(clk)
variable opcode : std_logic_vector(3 downto 0);
variable rd : integer;
variable rs : integer;
variable rt : integer;
begin
    if rising_edge(clk) then
        -------------------------------------------------
        -- Stage 1 : Instruction Fetch (IF)
        -------------------------------------------------
        IF_ID <= instr_mem(PC);
        if PC < 7 then
            PC <= PC + 1;
        end if;

        -------------------------------------------------
        -- Stage 2 : Instruction Decode (ID)
        -------------------------------------------------
        ID_EX <= IF_ID;

        -------------------------------------------------
        -- Stage 3 : Execute (EX)
        -------------------------------------------------
        opcode := ID_EX(15 downto 12);
        rd := to_integer(unsigned(ID_EX(11 downto 8)));
        rs := to_integer(unsigned(ID_EX(7 downto 4)));
        rt := to_integer(unsigned(ID_EX(3 downto 0)));
        WB_dest <= rd;

        case opcode is
            when "0001" =>
                EX_result <= reg_file(rs) + reg_file(rt);
            when "0010" =>
                EX_result <= reg_file(rs) - reg_file(rt);
            when "0011" =>
                EX_result <= 25;
            when others =>
                EX_result <= 0;
        end case;

        -------------------------------------------------
        -- Stage 4 : Write Back (WB)
        -------------------------------------------------
        if WB_dest >= 0 and WB_dest <= 7 then
            reg_file(WB_dest) <= EX_result;
        end if;
    end if;
end process;
end Behavioral;

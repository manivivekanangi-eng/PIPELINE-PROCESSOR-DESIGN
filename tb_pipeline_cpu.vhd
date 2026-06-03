library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_pipeline_cpu is
end tb_pipeline_cpu;

architecture Behavioral of tb_pipeline_cpu is
    component pipeline_cpu
        Port (
            clk       : in STD_LOGIC;
            PC_out    : out std_logic_vector(15 downto 0);
            IF_ID_out : out std_logic_vector(15 downto 0);
            ID_EX_out : out std_logic_vector(15 downto 0);
            EX_res_out: out std_logic_vector(15 downto 0)
        );
    end component;

    signal clk        : STD_LOGIC := '0';
    signal PC_out     : std_logic_vector(15 downto 0);
    signal IF_ID_out  : std_logic_vector(15 downto 0);
    signal ID_EX_out  : std_logic_vector(15 downto 0);
    signal EX_res_out : std_logic_vector(15 downto 0);

    constant clk_period : time := 10 ns;
begin
    uut: pipeline_cpu Port Map (
          clk        => clk,
          PC_out     => PC_out,
          IF_ID_out  => IF_ID_out,
          ID_EX_out  => ID_EX_out,
          EX_res_out => EX_res_out
        );

    clk_process : process
    begin
        clk <= '0'; wait for clk_period/2;
        clk <= '1'; wait for clk_period/2;
    end process;

    stim_proc: process
    begin		
        wait for 100 ns;
        wait;
    end process;
end Behavioral;

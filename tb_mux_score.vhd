LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY tb_mux_score IS
END tb_mux_score;

ARCHITECTURE testbench OF tb_mux_score IS

    COMPONENT mux_score IS
        PORT (
            CLK : IN std_logic;
            RST : IN std_logic; 
            J_WIN : IN std_logic; 

            J_COUNT : OUT std_logic; 
            S_COUNT_1 : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
            S_COUNT_2 : OUT STD_LOGIC_VECTOR (2 DOWNTO 0) 
        );
    END COMPONENT;

    SIGNAL CLK, RST, J_WIN, J_COUNT : STD_LOGIC;
    SIGNAL S_COUNT_1, S_COUNT_2 : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN

    DUT0 : mux_score PORT MAP(
        CLK => CLK,
        RST => RST,
        J_WIN => J_WIN,
        J_COUNT => J_COUNT,
        S_COUNT_1 => S_COUNT_1,
        S_COUNT_2 => S_COUNT_2
    );

    stimulus0 : PROCESS
    BEGIN
        J_WIN <= '1';
        WAIT FOR 10 ns;
        J_WIN <= '0';
        WAIT;
    END PROCESS stimulus0;

    RST_0 : PROCESS
    BEGIN
        RST <= '1';
        WAIT FOR 50 ns;
        RST <= '0';
        WAIT;
    END PROCESS RST_0;

    CLK_0 : PROCESS
    BEGIN
        CLK <= '0';
        WAIT FOR 10 ns;
        CLK <= '1';
        WAIT FOR 10 ns;
    END PROCESS CLK_0;

END testbench;
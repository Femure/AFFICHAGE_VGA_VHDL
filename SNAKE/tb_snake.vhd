LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY tb_snake IS
END tb_snake;

ARCHITECTURE testbench OF tb_snake IS

    COMPONENT snake IS
    PORT (
        CLK, RST : IN STD_LOGIC;
        PB_G, PB_H, PB_D, PB_B : IN STD_LOGIC;
        HS, VS : OUT STD_LOGIC;
        RED, GREEN, BLUE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
    END COMPONENT;

    SIGNAL CLK, RST, HS, VS : STD_LOGIC;
    SIGNAL PB_G, PB_H, PB_D, PB_B : STD_LOGIC;
    SIGNAL RED, GREEN, BLUE : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

    DUT0 : snake PORT MAP(
        CLK => CLK,
        RST => RST,
        PB_G => PB_G, 
        PB_H => PB_H,
        PB_D => PB_D, 
        PB_B => PB_B, 
        HS => HS,
        VS => VS,
        RED => RED,
        GREEN => GREEN,
        BLUE => BLUE
    );

    stimulus0 : PROCESS
    BEGIN
        RST <= '1';
        WAIT FOR 50 ns;
        RST <= '0';
        WAIT;
    END PROCESS stimulus0;

    CLK_0 : PROCESS
    BEGIN
        CLK <= '0';
        WAIT FOR 10 ns;
        CLK <= '1';
        WAIT FOR 10 ns;
    END PROCESS CLK_0;

END testbench;
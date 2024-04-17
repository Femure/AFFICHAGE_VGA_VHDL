LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ps2_controller IS
    PORT (
        RST, CLK, PS2_CLK_INT : IN STD_LOGIC;
        ERROR : IN STD_LOGIC;
        KEYCODE : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        PS2_CODE : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        PS2_CODE_FLAG : OUT STD_LOGIC
    );
END ps2_controller;

ARCHITECTURE rtl OF ps2_controller IS
    CONSTANT clk_freq : INTEGER := 100_000_000;
    SIGNAL count_idle : INTEGER RANGE 0 TO clk_freq/18_000; --counter to determine PS/2 is idle
    SIGNAL temp_ps2_code : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL temp_ps2_flag : STD_LOGIC := '0';
BEGIN
    PROCESS (RST, CLK)
    BEGIN
        IF (RST = '1') THEN
            count_idle <= 0;
            temp_ps2_flag <= '0';
            temp_ps2_code <= (OTHERS => '0');
        ELSIF (CLK'EVENT AND CLK = '1') THEN --rising edge of system clock
            IF (PS2_CLK_INT = '0') THEN --low PS2 clock, PS/2 is active
                count_idle <= 0; --reset idle counter
            ELSIF (count_idle /= CLK_freq/18_000) THEN --PS2 clock has been high less than a half clock period (<55us)
                count_idle <= count_idle + 1; --continue counting
            END IF;

            IF (count_idle = CLK_freq/18_000 AND ERROR = '0') THEN --idle threshold reached and no errors detected
                temp_ps2_flag <= '1'; --set flag that new PS/2 code is available
                temp_ps2_code <= KEYCODE; --output new PS/2 code
            ELSE --PS/2 port active or error detected
                temp_ps2_flag <= '0'; --set flag that PS/2 transaction is in progress
            END IF;
        END IF;
    END PROCESS;
    PS2_CODE <= temp_ps2_code;
    PS2_CODE_FLAG <= temp_ps2_flag;
END rtl;
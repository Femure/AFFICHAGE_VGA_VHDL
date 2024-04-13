LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ps2_receiver IS
    PORT (
        CLK, PS2_CLK_INT, PS2_DATA_INT : IN STD_LOGIC;
        KEYCODE : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        OFLAG : OUT STD_LOGIC
    );
END ps2_receiver;

ARCHITECTURE rtl OF ps2_receiver IS
    SIGNAL ps2_word : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '0');
BEGIN
    PROCESS (PS2_CLK_INT) BEGIN
        IF (PS2_CLK_INT'EVENT AND PS2_CLK_INT = '0') THEN --falling edge of PS2 clock
            ps2_word <= PS2_DATA_INT & ps2_word(10 DOWNTO 1); --shift in PS2 data bit
        END IF;
    END PROCESS;

    --verify that parity, start, and stop bits are all correct
    ERROR <= NOT (NOT ps2_word(0) AND ps2_word(10) AND (ps2_word(9) XOR ps2_word(8) XOR
        ps2_word(7) XOR ps2_word(6) XOR ps2_word(5) XOR ps2_word(4) XOR ps2_word(3) XOR
        ps2_word(2) XOR ps2_word(1)));

    PROCESS (CLK)
    BEGIN
        IF (CLK'EVENT AND CLK = '1') THEN --rising edge of system clock

            IF (ps2_CLK_int = '0') THEN --low PS2 clock, PS/2 is active
                count_idle <= 0; --reset idle counter
            ELSIF (count_idle /= CLK_freq/18_000) THEN --PS2 clock has been high less than a half clock period (<55us)
                count_idle <= count_idle + 1; --continue counting
            END IF;

            IF (count_idle = CLK_freq/18_000 AND error = '0') THEN --idle threshold reached and no errors detected
                ps2_code_new <= '1'; --set flag that new PS/2 code is available
                ps2_code <= ps2_word(8 DOWNTO 1); --output new PS/2 code
            ELSE --PS/2 port active or error detected
                ps2_code_new <= '0'; --set flag that PS/2 transaction is in progress
            END IF;

        END IF;
    END PROCESS;
END rtl;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ps2_receiver IS
    PORT (
        PS2_CLK_INT, PS2_DATA_INT : IN STD_LOGIC;
        KEYCODE : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        ERROR : OUT STD_LOGIC
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

    KEYCODE <= ps2_word(8 DOWNTO 1);
END rtl;
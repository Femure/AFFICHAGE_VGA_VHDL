
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ps2_keyboard IS
    PORT (
        CLK : IN STD_LOGIC; --system clock
        PS2_CLK : IN STD_LOGIC; --clock signal from PS/2 keyboard
        PS2_DATA : IN STD_LOGIC; --data signal from PS/2 keyboard
        PS2_CODE_FLAG : OUT STD_LOGIC; --flag that new PS/2 code is available on ps2_code bus
        PS2_CODE : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); --code received from PS/2
END ps2_keyboard;

ARCHITECTURE structural OF ps2_keyboard IS

    COMPONENT debounce IS
        PORT (
            CLK : IN STD_LOGIC;
            I : IN STD_LOGIC;
            O : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT ps2_receiver IS
        PORT (
            CLK, PS2_CLK_INT, PS2_DATA_INT : IN STD_LOGIC;
            KEYCODE : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            OFLAG : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL ps2_clk_int : STD_LOGIC; --debounced clock signal from PS/2 keyboard
    SIGNAL ps2_data_int : STD_LOGIC; --debounced data signal from PS/2 keyboard
    SIGNAL ps2_word : STD_LOGIC_VECTOR(10 DOWNTO 0); --stores the ps2 data word
    SIGNAL error : STD_LOGIC; --validate parity, start, and stop bits
    SIGNAL count_idle : INTEGER RANGE 0 TO clk_freq/18_000; --counter to determine PS/2 is idle
BEGIN

    -- Debounce clock
    D0 : debounce PORT MAP(CLK => CLK, I => PS2_CLK, O => ps2_clk_int);
    D1 : debounce PORT MAP(CLK => CLK, I => PS2_DATA, O => ps2_data_int);

END structural;
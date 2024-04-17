LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY tb_ps2_keyboard IS
END tb_ps2_keyboard;

ARCHITECTURE testbench OF tb_ps2_keyboard IS

    COMPONENT ps2_decode IS
        PORT (
            RST, CLK : IN STD_LOGIC;
            PS2_CLK : IN STD_LOGIC; 
            PS2_DATA : IN STD_LOGIC; 
            DECODE_FLAG : OUT STD_LOGIC;
            DECODE_CODE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) 
        );
    END COMPONENT;

    SIGNAL RST, CLK, PS2_CLK, PS2_DATA, DECODE_FLAG : STD_LOGIC;
    SIGNAL DECODE_CODE : STD_LOGIC_VECTOR(3 DOWNTO 0);

    PROCEDURE print_key(CONSTANT KEY : IN STD_LOGIC_VECTOR(7 DOWNTO 0); SIGNAL PS2_DATA : OUT STD_LOGIC; SIGNAL PS2_CLK : OUT STD_LOGIC; CONSTANT CLK_DELAY : IN INTEGER) IS
    BEGIN

        PS2_CLK <= '1';
        WAIT FOR 500 us;

        PS2_CLK <= '0';
        WAIT FOR 40 us;
        PS2_CLK <= '1';
        WAIT FOR 40 us;

        -- start bit
        PS2_DATA <= '0';
        PS2_CLK <= '0';
        WAIT FOR 40 us;
        PS2_CLK <= '1';
        WAIT FOR 40 us;

        PS2_DATA <= KEY(0);
        PS2_CLK <= '0';
        WAIT FOR 40 us;
        PS2_CLK <= '1';
        WAIT FOR 40 us;
        WAIT FOR CLK_DELAY * 1 us;
        PS2_DATA <= KEY(1);
        PS2_CLK <= '0';
        WAIT FOR 40 us;
        PS2_CLK <= '1';
        WAIT FOR 40 us;

        PS2_DATA <= KEY(2);
        PS2_CLK <= '0';
        WAIT FOR 40 us;
        PS2_CLK <= '1';
        WAIT FOR 40 us;

        PS2_DATA <= KEY(3);
        PS2_CLK <= '0';
        WAIT FOR 40 us;
        PS2_CLK <= '1';
        WAIT FOR 40 us;

        PS2_DATA <= KEY(4);
        PS2_CLK <= '0';
        WAIT FOR 40 us;
        PS2_CLK <= '1';
        WAIT FOR 40 us;

        PS2_DATA <= KEY(5);
        PS2_CLK <= '0';
        WAIT FOR 40 us;
        PS2_CLK <= '1';
        WAIT FOR 40 us;

        PS2_DATA <= KEY(6);
        PS2_CLK <= '0';
        WAIT FOR 40 us;
        PS2_CLK <= '1';
        WAIT FOR 40 us;

        PS2_DATA <= KEY(7);
        PS2_CLK <= '0';
        WAIT FOR 40 us;
        PS2_CLK <= '1';
        WAIT FOR 40 us;

        -- parity
        PS2_DATA <= NOT (KEY(0) XOR KEY(1) XOR KEY(2) XOR KEY(3) XOR KEY(4) XOR KEY(5) XOR KEY(6) XOR KEY(7));
        PS2_CLK <= '0';
        WAIT FOR 40 us;
        PS2_CLK <= '1';
        WAIT FOR 40 us;

        -- stop bit
        PS2_DATA <= '1';
        PS2_CLK <= '0';
        WAIT FOR 40 us;
        PS2_CLK <= '1';
        WAIT FOR 500 us;

    END print_key;

BEGIN

    DUT0 : ps2_decode PORT MAP(
        RST => RST,
        CLK => CLK,
        PS2_CLK => PS2_CLK,
        PS2_DATA => PS2_DATA,
        DECODE_FLAG => DECODE_FLAG,
        DECODE_CODE => DECODE_CODE
    );

    CLK_0 : PROCESS
    BEGIN
        CLK <= '0';
        WAIT FOR 10 ns;
        CLK <= '1';
        WAIT FOR 10 ns;
    END PROCESS CLK_0;

    stimulus0 : PROCESS
    BEGIN
        RST <= '1';
        WAIT FOR 50 ns;
        RST <= '0';
        WAIT;
    END PROCESS stimulus0;

    wave : PROCESS
    BEGIN

        PS2_DATA <= '1';
        PS2_CLK <= '1';
                
        -- UP ARROW
        print_key("11100000", PS2_DATA, PS2_CLK, 0); -- E0

        WAIT FOR 1000 us;
        print_key("11110000", PS2_DATA, PS2_CLK, 2500); -- F0

        WAIT FOR 1000 us;
        print_key("01110101", PS2_DATA, PS2_CLK, 0); -- 75

        -- DOWN ARROW
        WAIT FOR 1000 us;
        print_key("11100000", PS2_DATA, PS2_CLK, 0); -- E0

        WAIT FOR 1000 us;
        print_key("11110000", PS2_DATA, PS2_CLK, 2500); -- F0

        WAIT FOR 1000 us;
        print_key("01110010", PS2_DATA, PS2_CLK, 0); -- 72

        -- A
        WAIT FOR 1000 us;
        print_key(x"F0", PS2_DATA, PS2_CLK, 2500); -- F0

        WAIT FOR 1000 us;
        print_key(x"1A", PS2_DATA, PS2_CLK, 0); -- 1A


        WAIT;

    END PROCESS;

END testbench;
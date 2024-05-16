
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ps2_keyboard IS
    PORT (
        RST, CLK : IN STD_LOGIC;
        PS2_CLK : IN STD_LOGIC; -- signal d'horloge provenant du clavier PS/2
        PS2_DATA : IN STD_LOGIC; -- signal de données provenant du clavier PS/2
        PS2_CODE_FLAG : OUT STD_LOGIC; -- indicateur qu'un nouveau code PS/2 est disponible sur le bus ps2_code
        PS2_CODE : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- code reçu depuis le clavier PS/2
    );
END ps2_keyboard;

ARCHITECTURE structural OF ps2_keyboard IS

    COMPONENT debouncer IS
        PORT (
            RST, CLK : IN STD_LOGIC;
            I : IN STD_LOGIC;
            O : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT ps2_receiver IS
        PORT (
            RST, PS2_CLK_INT, PS2_DATA_INT : IN STD_LOGIC;
            KEYCODE : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            ERROR : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT ps2_controller IS
        PORT (
            RST, CLK, PS2_CLK_INT : IN STD_LOGIC;
            ERROR : IN STD_LOGIC;
            KEYCODE : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            PS2_CODE : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            PS2_CODE_FLAG : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL ps2_clk_int : STD_LOGIC := '0';
    SIGNAL ps2_data_int : STD_LOGIC := '0';
    SIGNAL keycode : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '1');
    SIGNAL error : STD_LOGIC := '0';
BEGIN

    -- Debouncer d'horloge
    D0 : debouncer PORT MAP(RST => RST, CLK => CLK, I => PS2_CLK, O => ps2_clk_int);
    D1 : debouncer PORT MAP(RST => RST, CLK => CLK, I => PS2_DATA, O => ps2_data_int);

    -- Parser le code pour récupérer le code du clavier
    R0 : ps2_receiver PORT MAP(RST => RST, PS2_CLK_INT => ps2_clk_int, PS2_DATA_INT => ps2_data_int, KEYCODE => keycode, ERROR => error);

    -- Récupérer le code du clavier à chaque période et vérifie qu'il ne contient pas d'erreur
    C0 : ps2_controller PORT MAP(RST => RST, CLK => CLK, PS2_CLK_INT => ps2_clk_int, ERROR => error, KEYCODE => keycode, PS2_CODE => PS2_CODE, PS2_CODE_FLAG => PS2_CODE_FLAG);

END structural;
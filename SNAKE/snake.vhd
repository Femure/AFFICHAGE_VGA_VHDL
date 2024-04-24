LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY snake IS
    PORT (
        CLK, RST : IN STD_LOGIC;
        PS2_CLK, PS2_DATA : IN STD_LOGIC;
        PB_G, PB_H, PB_D, PB_B : IN STD_LOGIC;
        HS, VS : OUT STD_LOGIC;
        RED, GREEN, BLUE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END snake;

ARCHITECTURE structural OF snake IS

    COMPONENT reset IS
        PORT (
            CLK, END_GAME, RST : IN STD_LOGIC;
            G_RESET : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT ps2_decode IS
        PORT (
            RST, CLK : IN STD_LOGIC;
            PS2_CLK : IN STD_LOGIC;
            PS2_DATA : IN STD_LOGIC;
            DECODE_FLAG : OUT STD_LOGIC;
            DECODE_CODE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT div_25MHz IS
        PORT (
            CLK, RST : IN STD_LOGIC;
            PIXEL_CLK : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT vga_controller_640_60 IS
        PORT (
            PIXEL_CLK, RST : IN STD_LOGIC;
            HS, VS, BLANK, FRAME : OUT STD_LOGIC;
            HCOUNT, VCOUNT : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT clk_snake IS
        PORT (
            CLK, RST : IN STD_LOGIC;
            SNAKE_CLK : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT snake_move IS
        PORT (
            SNAKE_CLK, RST, FRAME : IN STD_LOGIC;
            HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            LENGHT_SNAKE : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
            DECODE_CODE : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            PB_D, PB_G, PB_H, PB_B : IN STD_LOGIC;
            IS_SNAKE, END_GAME : OUT STD_LOGIC;
            X_SNAKE, Y_SNAKE : OUT INTEGER
        );
    END COMPONENT;

    COMPONENT cnt_rand IS
        PORT (
            CLK, RST : IN STD_LOGIC;
            RAND_OUT : OUT INTEGER
        );
    END COMPONENT;

    COMPONENT clk_food IS
        PORT (
            CLK, RST : IN STD_LOGIC;
            FOOD_CLK : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT food_spawn IS
        PORT (
            RST, FOOD_CLK, FRAME : IN STD_LOGIC;
            X_SNAKE, Y_SNAKE : IN INTEGER;
            SEED1, SEED2 : IN INTEGER;
            HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            IS_EATEN, IS_FOOD : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT cnt_lenght_snake IS
        PORT (
            CLK, RST, FLAG : IN STD_LOGIC;
            LENGHT_SNAKE : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT aff_score IS
        PORT (
            RST : IN STD_LOGIC;
            HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            SCORE : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
            IS_NUMBER : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT image IS
        PORT (
            RST, BLANK : IN STD_LOGIC;
            IS_SNAKE, IS_FOOD, IS_NUMBER : IN STD_LOGIC;
            RED, GREEN, BLUE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL reset_g, pixel_clk, snake_clk, food_clk : STD_LOGIC;
    SIGNAL blank, frame : STD_LOGIC;
    SIGNAL decode_code : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL is_snake, is_eaten, is_food, is_number : STD_LOGIC;
    SIGNAL end_game : STD_LOGIC;
    SIGNAL hcount, vcount : STD_LOGIC_VECTOR(10 DOWNTO 0);
    SIGNAL seed1, seed2 : INTEGER;
    SIGNAL lenght_snake : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL x_snake, y_snake : INTEGER;

BEGIN

    -- Gestion du reset généralisé en cas d'appuye sur le bouton reset ou de fin de partie
    RE0 : reset PORT MAP(CLK => CLK, END_GAME => end_game, RST => RST, G_RESET => reset_g);

    -- Gestion de l'entrée au clavier
    K0 : ps2_decode PORT MAP(RST => reset_g, CLK => CLK, PS2_CLK => PS2_CLK, PS2_DATA => PS2_DATA, DECODE_CODE => decode_code);

    -- Gestion de l'affichage sur l'écran
    A0 : div_25MHz PORT MAP(CLK => CLK, RST => RST, PIXEL_CLK => pixel_clk);
    A1 : vga_controller_640_60 PORT MAP(PIXEL_CLK => pixel_clk, RST => RST, HS => HS, VS => VS, BLANK => blank, FRAME => frame, HCOUNT => hcount, VCOUNT => vcount);

    -- Gestion corps serpent 
    S0 : clk_snake PORT MAP(CLK => CLK, RST => reset_g, SNAKE_CLK => snake_clk);
    S1 : snake_move PORT MAP(SNAKE_CLK => snake_clk, RST => reset_g, FRAME => frame, HCOUNT => hcount, VCOUNT => vcount, DECODE_CODE => decode_code, PB_G => PB_G, PB_H => PB_H, PB_D => PB_D, PB_B => PB_B, LENGHT_SNAKE => lenght_snake, IS_SNAKE => is_snake, END_GAME => end_game, X_SNAKE => x_snake, Y_SNAKE => y_snake);

    -- Gestion des cubes de nourriture
    N1 : cnt_rand PORT MAP(CLK => CLK, RST => reset_g, RAND_OUT => seed1);
    N2 : cnt_rand PORT MAP(CLK => pixel_clk, RST => reset_g, RAND_OUT => seed2);
    N3 : clk_food PORT MAP(CLK => CLK, RST => reset_g, FOOD_CLK => food_clk);
    N4 : food_spawn PORT MAP(RST => reset_g, FOOD_CLK => food_clk, FRAME => frame, X_SNAKE => x_snake, Y_SNAKE => y_snake, SEED1 => seed1, SEED2 => seed2, HCOUNT => hcount, VCOUNT => vcount, IS_EATEN => is_eaten, IS_FOOD => is_food);

    -- Agrandi le corps quand il mange de la food
    G0 : cnt_lenght_snake PORT MAP(CLK => CLK, RST => reset_g, FLAG => is_eaten, LENGHT_SNAKE => lenght_snake);

    -- Gestion du score
    SC0 : aff_score PORT MAP(RST => reset_g, HCOUNT => hcount, VCOUNT => vcount, SCORE => lenght_snake, IS_NUMBER => is_number);

    -- Rendu final sur l'écran
    A2 : image PORT MAP(RST => reset_g, BLANK => blank, IS_SNAKE => is_snake, IS_FOOD => is_food, IS_NUMBER => is_number, RED => RED, GREEN => GREEN, BLUE => BLUE);

END structural;
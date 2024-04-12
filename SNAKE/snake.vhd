LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY snake IS
    PORT (
        CLK, RST : IN STD_LOGIC;
        PB_G, PB_H, PB_D, PB_B : IN STD_LOGIC;
        HS, VS : OUT STD_LOGIC;
        RED, GREEN, BLUE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END snake;

ARCHITECTURE structural OF snake IS

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
        CLK, RST, FRAME : IN STD_LOGIC;
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        IS_SNAKE, SNAKE_LOSE : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT clk_food_respawn IS
        PORT (
            FRAME, RST : IN STD_LOGIC;
            CLK_RESPAWN : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT cnt_rand IS
        PORT (
            CLK, RST : IN STD_LOGIC;
            RAND_OUT : OUT INTEGER
        );
    END COMPONENT;

    COMPONENT food_spawn IS
        PORT (
            RST, CLK_RESPAWN, FRAME : IN STD_LOGIC;
            X_SNAKE, Y_SNAKE : IN INTEGER;
            SEED1, SEED2 : IN INTEGER;
            HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            IS_EATEN, IS_FOOD : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT image IS
        PORT (
            RST, BLANK : IN STD_LOGIC;
            IS_SNAKE : IN STD_LOGIC;
            IS_FOOD : IN STD_LOGIC;
            RED, GREEN, BLUE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL pixel_clk, snake_clk, clk_respawn : STD_LOGIC;
    SIGNAL blank, frame : STD_LOGIC;
    SIGNAL is_snake, is_eaten, is_food : STD_LOGIC;
    SIGNAL snake_lose : STD_LOGIC;
    SIGNAL hcount, vcount : STD_LOGIC_VECTOR(10 DOWNTO 0);
    SIGNAL seed1, seed2 : INTEGER;
    SIGNAL x_snake, y_snake : INTEGER;

BEGIN

    -- Gestion de l'affichage sur l'écran
    A0 : div_25MHz PORT MAP(CLK => CLK, RST => RST, PIXEL_CLK => pixel_clk);
    A1 : vga_controller_640_60 PORT MAP(PIXEL_CLK => pixel_clk, RST => RST, HS => HS, VS => VS, BLANK => blank, FRAME => frame, HCOUNT => hcount, VCOUNT => vcount);

    -- Gestion corps serpent 
    S0 : clk_snake PORT MAP(CLK => CLK, RST => RST, SNAKE_CLK => snake_clk);
    S1 : snake_move PORT MAP(CLK => snake_clk, RST => RST, FRAME => frame, HCOUNT => hcount, VCOUNT => vcount, IS_SNAKE => is_snake, SNAKE_LOSE => snake_lose);

    -- Gestion des cubes de nourriture
    N0 : clk_food_respawn PORT MAP(FRAME => frame, RST => RST, CLK_RESPAWN => clk_respawn);
    N1 : cnt_rand PORT MAP(CLK => CLK, RST => RST, RAND_OUT => seed1);
    N2 : cnt_rand PORT MAP(CLK => pixel_clk, RST => RST, RAND_OUT => seed2);
    N3 : food_spawn PORT MAP(RST => RST, CLK_RESPAWN => clk_respawn, FRAME => frame, X_SNAKE => x_snake, Y_SNAKE => y_snake, SEED1 => seed1, SEED2 => seed2, HCOUNT => hcount, VCOUNT => vcount, IS_EATEN => is_eaten, IS_FOOD => is_food);

    -- Rendu final sur l'écran
    A2 : image PORT MAP(RST => RST, BLANK => blank, IS_SNAKE => is_snake, IS_FOOD => is_food, RED => RED, GREEN => GREEN, BLUE => BLUE);

END structural;
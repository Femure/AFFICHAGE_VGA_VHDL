LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY pong IS
    PORT (
        CLK, RST : IN STD_LOGIC;
        HS, VS : OUT STD_LOGIC;
        RED, GREEN, BLUE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END pong;

ARCHITECTURE structural OF pong IS

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

    COMPONENT div_6MHz IS
        PORT (
            CLK, RST : IN STD_LOGIC;
            BALLE_CLK : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT balle_move IS
        PORT (
            BALLE_CLK, RST, FRAME : IN STD_LOGIC;
            HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            IS_BALLE : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT mux_score IS
        PORT (
            CLK, RST, J_WIN : IN STD_LOGIC;
            J1_SCORE, J2_SCORE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT score_aff IS
        PORT (
            RST : IN STD_LOGIC;
            HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            J1_SCORE, J2_SCORE : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            IS_NUMBER : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT image IS
        PORT (
            RST, BLANK, IS_BALLE, IS_NUMBER : IN STD_LOGIC;
            RED, GREEN, BLUE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL pixel_clk, balle_clk : STD_LOGIC;
    SIGNAL blank, frame : STD_LOGIC;
    SIGNAL is_balle, is_number : STD_LOGIC;
    SIGNAL j1_score, j2_score : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL hcount, vcount : STD_LOGIC_VECTOR(10 DOWNTO 0);

BEGIN

    -- Gestion de l'affichage sur l'écran
    A0 : div_25MHz PORT MAP(CLK => CLK, RST => RST, PIXEL_CLK => pixel_clk);
    A1 : vga_controller_640_60 PORT MAP(PIXEL_CLK => pixel_clk, RST => RST, HS => HS, VS => VS, BLANK => blank, FRAME => frame, HCOUNT => hcount, VCOUNT => vcount);

    -- Gestion des raquettes
    -- Gestion de la balle
    B0 : div_6MHz PORT MAP(CLK => CLK, RST => RST, BALLE_CLK => balle_clk);
    B1 : balle_move PORT MAP(BALLE_CLK => balle_clk, RST => RST, FRAME => frame, HCOUNT => hcount, VCOUNT => vcount, IS_BALLE => is_balle);

    -- Gestion des scores
    S0 : mux_score PORT MAP(CLK => CLK, RST => RST, J_WIN => '0', J1_SCORE => j1_score, J2_SCORE => j2_score);
    S1 : score_aff PORT MAP(RST => RST, HCOUNT => hcount, VCOUNT => vcount, J1_SCORE => j1_score, J2_SCORE => j2_score, IS_NUMBER => is_number);

    -- Rendu final sur l'écran
    A2 : image PORT MAP(RST => RST, BLANK => blank, IS_BALLE => is_balle, IS_NUMBER => is_number, RED => RED, GREEN => GREEN, BLUE => BLUE);

END structural;
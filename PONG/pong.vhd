LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY pong IS
    PORT (
        CLK, RST : IN STD_LOGIC;
        PS2_CLK, PS2_DATA : IN STD_LOGIC;
        PB_Haut_G, PB_Bas_G, PB_Haut_D, PB_Bas_D : IN STD_LOGIC;
        HS, VS : OUT STD_LOGIC;
        RED, GREEN, BLUE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END pong;

ARCHITECTURE structural OF pong IS

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

    COMPONENT terrain_aff IS
        PORT (
            HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            IS_TERRAIN : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT raquette_move IS
        PORT (
            FRAME, RST : IN STD_LOGIC;
            DECODE_CODE : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            PB_Haut_G, PB_Bas_G, PB_Haut_D, PB_Bas_D : IN STD_LOGIC;
            J_WIN : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            IS_RAQUETTE_G, IS_RAQUETTE_D : OUT STD_LOGIC;
            Y_RAQUETTE_G, Y_RAQUETTE_D : OUT INTEGER
        );
    END COMPONENT;

    COMPONENT acc_balle_clk IS
        PORT (
            FRAME, RST : IN STD_LOGIC;
            J_WIN : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            ACC_BALLE : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT balle_move IS
        PORT (
            CLK, FRAME, RST, ACC_BALLE : IN STD_LOGIC;
            HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            Y_RAQUETTE_G, Y_RAQUETTE_D : IN INTEGER;
            IS_BALLE : OUT STD_LOGIC;
            J_WIN : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT score_cnt IS
        PORT (
            CLK, RST : IN STD_LOGIC;
            J_WIN : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            J1_SCORE, J2_SCORE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT score_aff IS
        PORT (
            RST : IN STD_LOGIC;
            HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            J1_SCORE, J2_SCORE : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            IS_NUMBER, END_GAME : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT image IS
        PORT (
            RST, BLANK, IS_TERRAIN, IS_RAQUETTE_G, IS_RAQUETTE_D, IS_BALLE, IS_NUMBER : IN STD_LOGIC;
            RED, GREEN, BLUE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL g_reset, end_game : STD_LOGIC;
    SIGNAL decode_code : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL pixel_clk : STD_LOGIC;
    SIGNAL blank, frame, acc_balle : STD_LOGIC;
    SIGNAL is_terrain, is_raquette_g, is_raquette_d, is_balle, is_number : STD_LOGIC;
    SIGNAL y_raquette_g, y_raquette_d : INTEGER;
    SIGNAL j1_score, j2_score : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL hcount, vcount : STD_LOGIC_VECTOR(10 DOWNTO 0);
    SIGNAL j_win : STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN

    -- Gestion du reset généralisé en cas d'appuye sur le bouton reset ou de fin de partie
    RE0 : reset PORT MAP(CLK => CLK, END_GAME => end_game, RST => RST, G_RESET => g_reset);

    -- Gestion de l'entrée au clavier
    K0 : ps2_decode PORT MAP(RST => g_reset, CLK => CLK, PS2_CLK => PS2_CLK, PS2_DATA => PS2_DATA, DECODE_CODE => decode_code);

    -- Gestion de l'affichage sur l'écran
    A0 : div_25MHz PORT MAP(CLK => CLK, RST => RST, PIXEL_CLK => pixel_clk);
    A1 : vga_controller_640_60 PORT MAP(PIXEL_CLK => pixel_clk, RST => RST, HS => HS, VS => VS, BLANK => blank, FRAME => frame, HCOUNT => hcount, VCOUNT => vcount);

    -- Gestion du terrain
    T0 : terrain_aff PORT MAP(HCOUNT => hcount, VCOUNT => vcount, IS_TERRAIN => is_terrain);

    -- Gestion des raquettes
    R0 : raquette_move PORT MAP(FRAME => frame, RST => g_reset, J_WIN => j_win, DECODE_CODE => decode_code, PB_Haut_G => PB_Haut_G, PB_Bas_G => PB_Bas_G, PB_Haut_D => PB_Haut_D, PB_Bas_D => PB_Bas_D, HCOUNT => hcount, VCOUNT => vcount, Y_RAQUETTE_G => y_raquette_g, Y_RAQUETTE_D => y_raquette_d, IS_RAQUETTE_G => is_raquette_g, IS_RAQUETTE_D => is_raquette_d);

    -- Gestion de la balle
    B0 : acc_balle_clk PORT MAP(FRAME => frame, RST => g_reset, J_WIN => j_win, ACC_BALLE => acc_balle);
    B1 : balle_move PORT MAP(CLK => CLK, FRAME => frame, RST => g_reset, ACC_BALLE => acc_balle, HCOUNT => hcount, VCOUNT => vcount, Y_RAQUETTE_G => y_raquette_g, Y_RAQUETTE_D => y_raquette_d, IS_BALLE => is_balle, J_WIN => j_win);

    -- Gestion des scores
    S0 : score_cnt PORT MAP(CLK => CLK, RST => g_reset, J_WIN => j_win, J1_SCORE => j1_score, J2_SCORE => j2_score);
    S1 : score_aff PORT MAP(RST => g_reset, HCOUNT => hcount, VCOUNT => vcount, J1_SCORE => j1_score, J2_SCORE => j2_score, IS_NUMBER => is_number, END_GAME => end_game);

    -- Rendu final sur l'écran
    A2 : image PORT MAP(RST => g_reset, BLANK => blank, IS_TERRAIN => is_terrain, IS_RAQUETTE_G => is_raquette_g, IS_RAQUETTE_D => is_raquette_d, IS_BALLE => is_balle, IS_NUMBER => is_number, RED => RED, GREEN => GREEN, BLUE => BLUE);

END structural;
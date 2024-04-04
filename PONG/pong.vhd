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

    COMPONENT score_aff IS
        PORT (
            RST : IN STD_LOGIC;
            HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            J1COUNT, J2COUNT : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            IS_NUMBER : OUT STD_LOGIC

        );
    END COMPONENT;

    COMPONENT image IS
        PORT (
            RST, BLANK, IS_BALLE : IN STD_LOGIC;
            RED, GREEN, BLUE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL pixel_clk, balle_clk, blank, frame, is_balle, is_number : STD_LOGIC;
    SIGNAL j1count, j2count : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL hcount, vcount : STD_LOGIC_VECTOR(10 DOWNTO 0);

BEGIN

    U0 : div_25MHz PORT MAP(CLK => CLK, RST => RST, PIXEL_CLK => pixel_clk);
    U1 : vga_controller_640_60 PORT MAP(PIXEL_CLK => pixel_clk, RST => RST, HS => HS, VS => VS, BLANK => blank, FRAME => frame, HCOUNT => hcount, VCOUNT => vcount);
    U2 : div_6MHz PORT MAP(CLK => CLK, RST => RST, BALLE_CLK => balle_clk);
    U3 : balle_move PORT MAP(BALLE_CLK => balle_clk, RST => RST, FRAME => frame, HCOUNT => hcount, VCOUNT => vcount, IS_BALLE => is_balle);
    U4 : score_aff PORT MAP(RST => RST, HCOUNT => hcount, VCOUNT => vcount, J1COUNT => j1count, J2COUNT => j2count, IS_NUMBER = is_number);
    U5 : image PORT MAP(RST => RST, BLANK => blank, IS_BALLE => is_balle, RED => RED, GREEN => GREEN, BLUE => BLUE);

END structural;
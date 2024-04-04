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
            HS, VS, BLANK : OUT STD_LOGIC;
            HCOUNT, VCOUNT : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT image IS
        PORT (
            RST, BLANK : IN STD_LOGIC;
            HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            RED, GREEN, BLUE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL pixel_clk, blank : STD_LOGIC;
    SIGNAL hcount, vcount : STD_LOGIC_VECTOR(10 DOWNTO 0);

BEGIN

    U0 : div_25MHz PORT MAP(CLK => CLK, RST => RST, PIXEL_CLK => pixel_clk);
    U1 : vga_controller_640_60 PORT MAP(PIXEL_CLK => pixel_clk, RST => RST, HS => HS, VS => VS, BLANK => blank, HCOUNT => hcount, VCOUNT => vcount);
    U2 : image PORT MAP(RST => RST, BLANK => blank, HCOUNT => hcount, VCOUNT => vcount, RED => RED, GREEN => GREEN, BLUE => BLUE);

END structural;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY vga_controller_640_60 IS
    PORT (
        PIXEL_CLK, RST : IN STD_LOGIC;
        HS, VS, BLANK, FRAME : OUT STD_LOGIC;
        HCOUNT, VCOUNT : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
    );
END vga_controller_640_60;

ARCHITECTURE rtl OF vga_controller_640_60 IS
    SIGNAL countX, countY : STD_LOGIC_VECTOR(10 DOWNTO 0);
    -- Horizontal config
    CONSTANT hpixels : INTEGER := 800; -- nombre de pixels par ligne
    CONSTANT hpulse : INTEGER := 96; -- largeur d'impulsion du signal HSYNC
    CONSTANT hfp : INTEGER := 16; -- horizontal front porch
    CONSTANT hbp : INTEGER := 48; -- horizontal back porch
    -- Vetical config
    CONSTANT vlines : INTEGER := 525; -- nombre de pixel par colonne
    CONSTANT vpulse : INTEGER := 2; -- largeur d'impulsion du signal VSYNC
    CONSTANT vfp : INTEGER := 10; -- vertical front porch
    CONSTANT vbp : INTEGER := 33; -- vertical back porch

BEGIN
    PROCESS (PIXEL_CLK, RST)
    BEGIN
        IF (RST = '1') THEN
            countX <= (OTHERS => '0');
            countY <= (OTHERS => '0');
        ELSIF (PIXEL_CLK'EVENT AND PIXEL_CLK = '1') THEN
            IF (countX < hpixels - 1) THEN
                countX <= countX + 1;
            ELSE
                countX <= (OTHERS => '0');
                IF (countY < vlines - 1) THEN
                    countY <= countY + 1;
                ELSE
                    countY <= (OTHERS => '0');
                END IF;
            END IF;
        END IF;
    END PROCESS;

    HS <= '0' WHEN ((countX >= hpixels - hbp - hpulse) AND (countX < hpixels - hbp)) ELSE
        '1';
    VS <= '0' WHEN ((countY >= vlines - vbp - vpulse) AND (countY < vlines - vbp)) ELSE
        '1';

    -- Affichage sur l'écran
    BLANK <= '1' WHEN ((countX < hpixels - hbp - hfp - hpulse) AND (countY < vlines - vbp - vfp - vpulse)) ELSE
        '0';
    HCOUNT <= countX;
    VCOUNT <= countY;


    -- 
    FRAME <= '1' WHEN ((countX = 0) AND (countY = vlines - vbp - vfp - vpulse)) ELSE
        '0';

END rtl;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY terrain_aff IS
    PORT (
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        IS_TERRAIN : OUT STD_LOGIC
    );
END terrain_aff;

ARCHITECTURE rtl OF terrain_aff IS
    CONSTANT SCREEN_WIDTH : INTEGER := 640; -- Largeur de l'écran en pixels
    CONSTANT SCREEN_HEIGHT : INTEGER := 480; -- Hauteur de l'écran en pixels 
BEGIN
    PROCESS (HCOUNT, VCOUNT)
    BEGIN
        IS_TERRAIN <= '0';
        FOR i IN 0 TO 25 LOOP
            -- Tracer la ligne du milieu qui sépare le terrain
            IF ((HCOUNT > SCREEN_WIDTH/2 - 2 AND HCOUNT < SCREEN_WIDTH/2 + 2)
                AND (VCOUNT > 20 * i AND VCOUNT < 20 * i + 10)) THEN
                IS_TERRAIN <= '1';
            END IF;
        END LOOP;
    END PROCESS;

END rtl;
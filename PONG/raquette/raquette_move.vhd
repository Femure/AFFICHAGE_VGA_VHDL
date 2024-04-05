LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY raquette_move IS
    PORT (
        RAQUETTE_CLK, RST, FRAME : IN STD_LOGIC;
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        IS_RAQUETTE_G, IS_RAQUETTE_D : OUT STD_LOGIC;
        Y_RAQUETTE_G, Y_RAQUETTE_D : OUT INTEGER
    );
END raquette_move;

ARCHITECTURE rtl OF raquette_move IS
    CONSTANT RAQUETTE_WIDTH : INTEGER := 10; -- largeur de la raquette en pixels
    CONSTANT RAQUETTE_HEIGHT : INTEGER := 50; -- hauteur de la raquette en pixels 
    CONSTANT SCREEN_WIDTH : INTEGER := 640; -- largeur de l'écran en pixels
    CONSTANT SCREEN_HEIGHT : INTEGER := 480; -- hauteur de l'écran en pixels 
    CONSTANT xRaquetteG : INTEGER := 20;
    CONSTANT xRaquetteD : INTEGER := SCREEN_WIDTH - 20;

    SIGNAL yRaquetteG, yRaquetteD : INTEGER; -- position des raquettes
    SIGNAL dirRaquetteG, dirRaquetteD : INTEGER := 5; -- direction des raquettes

BEGIN
    -- Calcul de la position 
    PROCESS (RAQUETTE_CLK, RST, FRAME, HCOUNT, VCOUNT)
    BEGIN
        IF (RST = '1') THEN
            yRaquetteG <= SCREEN_HEIGHT/2;
            dirRaquetteG <= 5;

            yRaquetteD <= SCREEN_HEIGHT/2;
            dirRaquetteD <= 5;
        ELSIF (RAQUETTE_CLK'event AND RAQUETTE_CLK = '1') THEN
            IF (FRAME = '1') THEN
                -- Mouvement raquette gauche
                yRaquetteG <= yRaquetteG + dirRaquetteG;
                IF (yRaquetteG > SCREEN_HEIGHT - RAQUETTE_HEIGHT / 2) THEN -- rebond sur bord bas
                    dirRaquetteG <= dirRaquetteG * (-1);
                    yRaquetteG <= SCREEN_HEIGHT - RAQUETTE_HEIGHT / 2;
                ELSIF yRaquetteG < RAQUETTE_HEIGHT / 2 THEN -- rebond sur bord haut
                    dirRaquetteG <= dirRaquetteG * (-1);
                    yRaquetteG <= RAQUETTE_HEIGHT / 2;
                END IF;

                -- Mouvement raquette droite
                yRaquetteD <= yRaquetteD - dirRaquetteD;
                IF (yRaquetteD > SCREEN_HEIGHT - RAQUETTE_HEIGHT / 2) THEN -- rebond sur bord bas
                    dirRaquetteD <= dirRaquetteD * (-1);
                    yRaquetteD <= SCREEN_HEIGHT - RAQUETTE_HEIGHT / 2;
                ELSIF yRaquetteD < RAQUETTE_HEIGHT / 2 THEN -- rebond sur bord haut
                    dirRaquetteD <= dirRaquetteD * (-1);
                    yRaquetteD <= RAQUETTE_HEIGHT / 2;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    IS_RAQUETTE_G <= '1' WHEN (HCOUNT > xRaquetteG - RAQUETTE_WIDTH / 2) AND (HCOUNT < xRaquetteG + RAQUETTE_WIDTH / 2)
        AND (VCOUNT > yRaquetteG - RAQUETTE_HEIGHT / 2) AND (VCOUNT < yRaquetteG + RAQUETTE_HEIGHT / 2)
        ELSE
        '0';
    IS_RAQUETTE_D <= '1' WHEN (HCOUNT > xRaquetteD - RAQUETTE_WIDTH / 2) AND (HCOUNT < xRaquetteD + RAQUETTE_WIDTH / 2)
        AND (VCOUNT > yRaquetteD - RAQUETTE_HEIGHT / 2) AND (VCOUNT < yRaquetteD + RAQUETTE_HEIGHT / 2)
        ELSE
        '0';
        
    Y_RAQUETTE_G <= yRaquetteG;
    Y_RAQUETTE_D <= yRaquetteD;

END rtl;
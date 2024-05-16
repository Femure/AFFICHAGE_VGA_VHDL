LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY raquette_move IS
    PORT (
        RAQUETTE_CLK, RST, FRAME : IN STD_LOGIC;
        DECODE_CODE : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        PB_Haut_G, PB_Bas_G, PB_Haut_D, PB_Bas_D : IN STD_LOGIC;
        J_WIN : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        IS_RAQUETTE_G, IS_RAQUETTE_D : OUT STD_LOGIC;
        Y_RAQUETTE_G, Y_RAQUETTE_D : OUT INTEGER
    );
END raquette_move;

ARCHITECTURE rtl OF raquette_move IS
    CONSTANT RAQUETTE_WIDTH : INTEGER := 10; -- Largeur de la raquette en pixels
    CONSTANT RAQUETTE_HEIGHT : INTEGER := 50; -- Hauteur de la raquette en pixels 
    CONSTANT SCREEN_WIDTH : INTEGER := 640; -- Largeur de l'écran en pixels
    CONSTANT SCREEN_HEIGHT : INTEGER := 480; -- Hauteur de l'écran en pixels 
    CONSTANT dirRaquettes : INTEGER := 5; -- Direction des raquettes
    CONSTANT xRaquetteG : INTEGER := 20; -- Position de la raquette gauche en x
    CONSTANT xRaquetteD : INTEGER := SCREEN_WIDTH - 20; -- Position de la raquette droite en x

    SIGNAL yRaquetteG, yRaquetteD : INTEGER := SCREEN_HEIGHT/2; -- Position des raquettes en y

BEGIN
    PROCESS (RAQUETTE_CLK, RST, FRAME, HCOUNT, VCOUNT, J_WIN)
    BEGIN
        IF (RST = '1' OR J_WIN > 0) THEN
            -- Replacement des raquettes après un reset ou un point gagné
            yRaquetteG <= SCREEN_HEIGHT/2;
            yRaquetteD <= SCREEN_HEIGHT/2;
        ELSIF (RAQUETTE_CLK'event AND RAQUETTE_CLK = '1') THEN
            IF (FRAME = '1') THEN
                -- Mouvement raquette gauche
                IF (PB_Haut_G = '1' OR DECODE_CODE = "0101") THEN -- Pression sur le bouton associé ou sur la touche Z
                    IF (yRaquetteG > RAQUETTE_HEIGHT / 2) THEN -- Rebond sur bord haut
                        yRaquetteG <= yRaquetteG - dirRaquettes;
                    END IF;
                ELSIF (PB_Bas_G = '1' OR DECODE_CODE = "0111") THEN -- Pression sur le bouton associé ou sur la touche S
                    IF (yRaquetteG < SCREEN_HEIGHT - RAQUETTE_HEIGHT / 2) THEN -- Rebond sur bord bas
                        yRaquetteG <= yRaquetteG + dirRaquettes;
                    END IF;
                END IF;

                -- Mouvement raquette droite
                IF (PB_Haut_D = '1' OR DECODE_CODE = "0001") THEN -- Pression sur le bouton associé ou sur la touche ARROW UP
                    IF (yRaquetteD > RAQUETTE_HEIGHT / 2) THEN -- Rebond sur bord haut
                        yRaquetteD <= yRaquetteD - dirRaquettes;
                    END IF;
                ELSIF (PB_Bas_D = '1' OR DECODE_CODE = "0011") THEN -- Pression sur le bouton associé ou sur la touche ARROW DOWN
                    IF (yRaquetteD < SCREEN_HEIGHT - RAQUETTE_HEIGHT / 2) THEN -- Rebond sur bord bas
                        yRaquetteD <= yRaquetteD + dirRaquettes;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- Regarde si le pixel en cours de balayage est à l'intérieur de la raquette gauche ou de la raquette droite
    IS_RAQUETTE_G <= '1' WHEN (HCOUNT > xRaquetteG - RAQUETTE_WIDTH / 2) AND (HCOUNT < xRaquetteG + RAQUETTE_WIDTH / 2)
        AND (VCOUNT > yRaquetteG - RAQUETTE_HEIGHT / 2) AND (VCOUNT < yRaquetteG + RAQUETTE_HEIGHT / 2)
        ELSE
        '0';
    IS_RAQUETTE_D <= '1' WHEN (HCOUNT > xRaquetteD - RAQUETTE_WIDTH / 2) AND (HCOUNT < xRaquetteD + RAQUETTE_WIDTH / 2)
        AND (VCOUNT > yRaquetteD - RAQUETTE_HEIGHT / 2) AND (VCOUNT < yRaquetteD + RAQUETTE_HEIGHT / 2)
        ELSE
        '0';

    -- Revoie la position en y de la raquette gauche et de la raquette droite
    Y_RAQUETTE_G <= yRaquetteG;
    Y_RAQUETTE_D <= yRaquetteD;

END rtl;
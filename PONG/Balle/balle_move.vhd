LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY balle_move IS
    PORT (
        BALLE_CLK, RST, FRAME : IN STD_LOGIC;
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        IS_BALLE : OUT STD_LOGIC
    );
END balle_move;

ARCHITECTURE rtl OF balle_move IS
    CONSTANT BALLE_WIDTH : INTEGER := 10; -- taille du carré (balle) en pixels
    CONSTANT SCREEN_WIDTH : INTEGER := 640; -- largeur de l'écran en pixels 
    CONSTANT SCREEN_HEIGHT : INTEGER := 480; -- hauteur de l'écran en pixels 

    SIGNAL xBalle : INTEGER := SCREEN_WIDTH / 2;
    SIGNAL yBalle : INTEGER := SCREEN_HEIGHT / 2;
    SIGNAL VxBalle, VyBalle : INTEGER := 2; -- déplacement en diagonale vers le bas à droite de l'écran 
BEGIN
    PROCESS (BALLE_CLK, RST, FRAME, HCOUNT, VCOUNT)
    BEGIN
        IF (RST = '1') THEN -- Réinitialisation si appui sur bouton Reset
            xBalle <= SCREEN_WIDTH / 2;
            yBalle <= SCREEN_HEIGHT / 2;
            VxBalle <= 2;
            VyBalle <= 2;
        ELSIF (BALLE_CLK'EVENT AND BALLE_CLK = '1') THEN
            IF (FRAME = '1') THEN -- calcul de la position de la balle en dehors de la zone d'affichage active
                xBalle <= xBalle + VxBalle;
                yBalle <= yBalle + VyBalle;

                IF (xBalle > SCREEN_WIDTH - BALLE_WIDTH / 2) THEN -- rebond sur bord droit
                    VxBalle <= VxBalle * (-1);
                    xBalle <= SCREEN_WIDTH - BALLE_WIDTH / 2;
                ELSIF (xBalle < BALLE_WIDTH / 2) THEN -- rebond sur bord gauche
                    VxBalle <= VxBalle * (-1);
                    xBalle <= BALLE_WIDTH / 2;
                END IF;

                IF (yBalle > SCREEN_HEIGHT - BALLE_WIDTH / 2) THEN -- rebond sur bord bas
                    VyBalle <= VyBalle * (-1);
                    yBalle <= SCREEN_HEIGHT - BALLE_WIDTH / 2;
                ELSIF (yBalle < BALLE_WIDTH / 2) THEN -- rebond sur bord haut
                    VyBalle <= VyBalle * (-1);
                    yBalle <= BALLE_WIDTH / 2;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    -- IS_BALLE=1 si le pixel (HCOUNT, VCOUNT) en cours de balayage est à l'intérieur du carré (balle), IS_BALLE=0 sinon
    IS_BALLE <= '1' WHEN (HCOUNT > xBalle - BALLE_WIDTH / 2) AND (HCOUNT < xBalle + BALLE_WIDTH / 2) AND
        (VCOUNT > yBalle - BALLE_WIDTH / 2) AND (VCOUNT < yBalle + BALLE_WIDTH / 2) ELSE
        '0';
END rtl;
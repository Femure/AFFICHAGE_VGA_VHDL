LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY balle_move IS
    PORT (
        BALLE_CLK, RST, FRAME, ACC_BALLE : IN STD_LOGIC;
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        Y_RAQUETTE_G, Y_RAQUETTE_D : IN INTEGER;
        IS_BALLE : OUT STD_LOGIC;
        J_WIN : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
    );
END balle_move;

ARCHITECTURE rtl OF balle_move IS
    CONSTANT BALLE_WIDTH : INTEGER := 10; -- taille du carré (balle) en pixels
    CONSTANT SCREEN_WIDTH : INTEGER := 640; -- largeur de l'écran en pixels 

    CONSTANT RAQUETTE_WIDTH : INTEGER := 10; -- largeur de la raquette en pixels
    CONSTANT RAQUETTE_HEIGHT : INTEGER := 50; -- hauteur de la raquette en pixels 
    CONSTANT X_RAQUETTE_G : INTEGER := 20;
    CONSTANT X_RAQUETTE_D : INTEGER := SCREEN_WIDTH - 20;
    CONSTANT SCREEN_HEIGHT : INTEGER := 480; -- hauteur de l'écran en pixels 

    SIGNAL xBalle : INTEGER := SCREEN_WIDTH / 2;
    SIGNAL yBalle : INTEGER := SCREEN_HEIGHT / 2;
    SIGNAL VxBalle, VyBalle : INTEGER := 2;
    SIGNAL delay : INTEGER := 0; -- La vitesse du serpent max
    SIGNAL count : INTEGER := 0; -- Compteur pour la vitesse du serpent
    SIGNAL jwin : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
    PROCESS (BALLE_CLK, RST, FRAME, HCOUNT, VCOUNT)
    BEGIN
        IF (RST = '1') THEN
            xBalle <= SCREEN_WIDTH / 2;
            yBalle <= SCREEN_HEIGHT / 2;
            jwin <= "00";
            delay <= 10;
        ELSIF (BALLE_CLK'EVENT AND BALLE_CLK = '1') THEN
            IF (FRAME = '1') THEN
                IF (jwin = "01") THEN
                    xBalle <= SCREEN_WIDTH / 2;
                    yBalle <= SCREEN_HEIGHT / 2;
                    VxBalle <= - 2;
                    VyBalle <= - 2;
                    jwin <= "00";
                    delay <= 8;
                ELSIF (jwin >= "10") THEN
                    xBalle <= SCREEN_WIDTH / 2;
                    yBalle <= SCREEN_HEIGHT / 2;
                    jwin <= "00";
                    delay <= 10;
                ELSE
                    count <= count + 1;
                    IF (count >= delay) THEN
                        IF (ACC_BALLE = '1') THEN
                            delay <= delay - 1;
                        ELSE
                            xBalle <= xBalle + VxBalle;
                            yBalle <= yBalle + VyBalle;

                            IF (xBalle > SCREEN_WIDTH - BALLE_WIDTH / 2) THEN -- Rebond sur le bord droit
                                jwin <= "01"; -- J1 gagne si car touche chez J2
                            ELSIF (xBalle < BALLE_WIDTH / 2) THEN -- Rebond sur le bord gauche
                                jwin <= "10"; -- J2 gagne si car touche chez J1
                            ELSIF ((xBalle > (X_RAQUETTE_D - RAQUETTE_WIDTH/2) - (BALLE_WIDTH / 2))) THEN -- Raquette droite
                                IF (yBalle > ((Y_RAQUETTE_D - RAQUETTE_HEIGHT/2) - (BALLE_WIDTH / 2))
                                    AND (yBalle < (Y_RAQUETTE_D - RAQUETTE_HEIGHT/3) - (BALLE_WIDTH / 2))) THEN -- Rebond sur le haut de la raquette
                                    VyBalle <= - ABS(VyBalle); -- Angle de rebond vers le haut
                                    VxBalle <= - VxBalle; -- Changement de direction
                                    xBalle <= (X_RAQUETTE_D - RAQUETTE_WIDTH/2) - (BALLE_WIDTH / 2);
                                ELSIF (yBalle > ((Y_RAQUETTE_D - RAQUETTE_HEIGHT/3) - (BALLE_WIDTH / 2))
                                    AND (yBalle < (Y_RAQUETTE_D + RAQUETTE_HEIGHT/3) - (BALLE_WIDTH / 2))) THEN -- Rebond au milieu de la raquette
                                    -- Aucun changement d'angle
                                    VxBalle <= - VxBalle; -- Changement de direction
                                    xBalle <= (X_RAQUETTE_D - RAQUETTE_WIDTH/2) - (BALLE_WIDTH / 2);
                                ELSIF (yBalle > ((Y_RAQUETTE_D + RAQUETTE_HEIGHT/3) - (BALLE_WIDTH / 2))
                                    AND (yBalle < (Y_RAQUETTE_D + RAQUETTE_HEIGHT/2) - (BALLE_WIDTH / 2))) THEN -- Rebond sur le bas de la raquette
                                    VyBalle <= ABS(VyBalle); -- Angle de rebond vers le bas
                                    VxBalle <= - VxBalle; -- Changement de direction
                                    xBalle <= (X_RAQUETTE_D - RAQUETTE_WIDTH/2) - (BALLE_WIDTH / 2);
                                END IF;
                            ELSIF ((xBalle < (X_RAQUETTE_G + RAQUETTE_WIDTH/2) + (BALLE_WIDTH / 2))) THEN -- Raquette gauche
                                IF (yBalle > ((Y_RAQUETTE_G - RAQUETTE_HEIGHT/2) - (BALLE_WIDTH / 2))
                                    AND (yBalle < (Y_RAQUETTE_G - RAQUETTE_HEIGHT/3) - (BALLE_WIDTH / 2))) THEN -- Rebond sur le haut de la raquette
                                    VyBalle <= - ABS(VyBalle); -- Angle de rebond vers le haut
                                    VxBalle <= - VxBalle; -- Changement de direction
                                    xBalle <= (X_RAQUETTE_G + RAQUETTE_WIDTH/2) + (BALLE_WIDTH / 2);
                                ELSIF (yBalle > ((Y_RAQUETTE_G - RAQUETTE_HEIGHT/3) - (BALLE_WIDTH / 2))
                                    AND (yBalle < (Y_RAQUETTE_G + RAQUETTE_HEIGHT/3) - (BALLE_WIDTH / 2))) THEN -- Rebond au milieu de la raquette
                                    -- Aucun changement d'angle
                                    VxBalle <= - VxBalle; -- Changement de direction
                                    xBalle <= (X_RAQUETTE_G + RAQUETTE_WIDTH/2) + (BALLE_WIDTH / 2);
                                ELSIF (yBalle > ((Y_RAQUETTE_G + RAQUETTE_HEIGHT/3) - (BALLE_WIDTH / 2))
                                    AND (yBalle < (Y_RAQUETTE_G + RAQUETTE_HEIGHT/2) - (BALLE_WIDTH / 2))) THEN -- Rebond sur le bas de la raquette
                                    VyBalle <= ABS(VyBalle); -- Angle de rebond vers le bas
                                    VxBalle <= - VxBalle; -- Changement de direction
                                    xBalle <= (X_RAQUETTE_G + RAQUETTE_WIDTH/2) + (BALLE_WIDTH / 2);
                                END IF;
                            ELSIF (yBalle > SCREEN_HEIGHT - BALLE_WIDTH / 2) THEN -- Rebond sur le bord en bas
                                VyBalle <= VyBalle * (-1);
                                yBalle <= SCREEN_HEIGHT - BALLE_WIDTH / 2;
                            ELSIF (yBalle < BALLE_WIDTH / 2) THEN -- Rebond sur le bord en haut
                                VyBalle <= VyBalle * (-1);
                                yBalle <= BALLE_WIDTH / 2;
                            END IF;
                        END IF;
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    -- IS_BALLE=1 si le pixel en cours de balayage est à l'intérieur du carré balle, IS_BALLE=0 sinon
    IS_BALLE <= '1' WHEN (HCOUNT > xBalle - BALLE_WIDTH / 2) AND (HCOUNT < xBalle + BALLE_WIDTH / 2) AND
        (VCOUNT > yBalle - BALLE_WIDTH / 2) AND (VCOUNT < yBalle + BALLE_WIDTH / 2) ELSE
        '0';
    J_WIN <= jwin;
END rtl;
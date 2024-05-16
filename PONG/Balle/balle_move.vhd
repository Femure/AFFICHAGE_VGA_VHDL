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
    CONSTANT BALLE_WIDTH : INTEGER := 10; -- Taille du carré (balle) en pixels
    CONSTANT SCREEN_WIDTH : INTEGER := 640; -- Largeur de l'écran en pixels 

    CONSTANT RAQUETTE_WIDTH : INTEGER := 10; -- Largeur de la raquette en pixels
    CONSTANT RAQUETTE_HEIGHT : INTEGER := 50; -- Hauteur de la raquette en pixels 
    CONSTANT X_RAQUETTE_G : INTEGER := 20; -- Position de la raquette gauche en x
    CONSTANT X_RAQUETTE_D : INTEGER := SCREEN_WIDTH - 20; -- Position de la raquette droite en y
    CONSTANT SCREEN_HEIGHT : INTEGER := 480; -- Hauteur de l'écran en pixels 

    SIGNAL xBalle : INTEGER := SCREEN_WIDTH / 4; -- Position initiale de la balle en x
    SIGNAL yBalle : INTEGER := SCREEN_HEIGHT / 4; -- Position initiale de la balle en y
    SIGNAL VxBalle, VyBalle : INTEGER := 2; -- Vitesse initiale de la balle
    SIGNAL delay : INTEGER := 1; -- La vitesse de la balle max
    SIGNAL count : INTEGER := 0; -- Compteur pour la vitesse de la balle
    SIGNAL acc_balle_tmp : STD_LOGIC := '0'; -- Variable temporelle qui garde en mémoire lorsque la balle doit accélérée
    SIGNAL jwin : STD_LOGIC_VECTOR(1 DOWNTO 0); -- Indique quel joueur a gagné
BEGIN
    PROCESS (BALLE_CLK, RST, FRAME, HCOUNT, VCOUNT)
    BEGIN
        IF (RST = '1') THEN
            xBalle <= SCREEN_WIDTH / 4;
            yBalle <= SCREEN_HEIGHT / 4;
            VxBalle <= 2;
            VyBalle <= 2;
            jwin <= "00";
            delay <= 1;
        ELSIF (BALLE_CLK'EVENT AND BALLE_CLK = '1') THEN
            IF (FRAME = '1') THEN -- Vérifie si tous les pixels de l'écran ont été parcourus
                IF (jwin = "01") THEN -- Si le joueur de droite a gagné, on réinitialise les valeurs de la balle en conséquence
                    xBalle <= SCREEN_WIDTH / 2;
                    yBalle <= SCREEN_HEIGHT / 2;
                    VxBalle <= - 2;
                    VyBalle <= - 2;
                    jwin <= "00";
                    delay <= 1;
                ELSIF (jwin = "10") THEN -- Si le joueur de gauche a gagné, on réinitialise les valeurs de la balle en conséquence
                    xBalle <= SCREEN_WIDTH / 2;
                    yBalle <= SCREEN_HEIGHT / 2;
                    VxBalle <= 2;
                    VyBalle <= 2;
                    jwin <= "00";
                    delay <= 1;
                ELSE
                    count <= count + 1;
                    IF (ACC_BALLE = '1') THEN -- Accélération de la balle a bout de 10 sec 
                        acc_balle_tmp <= '1';
                    ELSE
                        -- Calcul des nouvelles positions de la balle en fonction des conditions de rebond et de vitesse
                        IF (count >= delay) THEN -- Vérifie si le compteur atteint le delay ce qui définit la vitesse de la balle
                            -- Modification de la position de la balle suivant sa direction en x et en y 
                            xBalle <= xBalle + VxBalle;
                            yBalle <= yBalle + VyBalle;

                            IF (xBalle > SCREEN_WIDTH - BALLE_WIDTH / 2) THEN -- Rebond sur le bord droit
                                jwin <= "01"; -- J1 gagne si car touche chez J2
                            ELSIF (xBalle < BALLE_WIDTH / 2) THEN -- Rebond sur le bord gauche
                                jwin <= "10"; -- J2 gagne si car touche chez J1
                            ELSIF ((xBalle > (X_RAQUETTE_D - RAQUETTE_WIDTH/2) - (BALLE_WIDTH / 2))
                                AND (xBalle < (X_RAQUETTE_D + RAQUETTE_WIDTH/2) - (BALLE_WIDTH / 2))) THEN -- Raquette droite
                                IF (acc_balle_tmp = '1' AND delay >= 0) THEN -- Accélération de la balle seulement lors d'un renvoie 
                                    delay <= delay - 1;
                                    acc_balle_tmp <= '0';
                                END IF;
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
                            ELSIF ((xBalle < (X_RAQUETTE_G + RAQUETTE_WIDTH/2) + (BALLE_WIDTH / 2))
                                AND (xBalle > (X_RAQUETTE_G - RAQUETTE_WIDTH/2) + (BALLE_WIDTH / 2))) THEN -- Raquette gauche
                                IF (acc_balle_tmp = '1' AND delay >= 0) THEN -- Accélération de la balle seulement lors d'un renvoie 
                                    delay <= delay - 1;
                                    acc_balle_tmp <= '0';
                                END IF;
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
                            count <= 0;
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
    -- Renvoie quel joueur a gagné 
    J_WIN <= jwin;
END rtl;
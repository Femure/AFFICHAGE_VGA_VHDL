LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY score_aff IS
    PORT (
        RST : IN STD_LOGIC;
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        J1_SCORE, J2_SCORE : IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- Score J1 et J2
        IS_NUMBER, END_GAME : OUT STD_LOGIC -- Retour pour l'affichage et pour savoir si la partie est terminé
    );
END score_aff;

ARCHITECTURE rtl OF score_aff IS
    CONSTANT SCREEN_WIDTH : INTEGER := 640; -- Largeur de l'écran en pixels
BEGIN
    PROCESS (RST, HCOUNT, VCOUNT, J1_SCORE, J2_SCORE)
    BEGIN
        IF (RST = '1') THEN
            IS_NUMBER <= '0';
            END_GAME <= '0';
        ELSE
            IS_NUMBER <= '0';
            END_GAME <= '0';
            -- Joueur 1 à gauche 
            CASE J1_SCORE IS
                WHEN "000" =>
                    -- Affichage de 0
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 35 AND HCOUNT >= SCREEN_WIDTH/2 - 40) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment E
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 35 AND HCOUNT >= SCREEN_WIDTH/2 - 40) AND (VCOUNT <= 35 AND VCOUNT >= 15)) THEN-- segment F
                        IS_NUMBER <= '1';
                    END IF;

                WHEN "001" =>
                    -- Affichage de 1
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 22 AND HCOUNT >= SCREEN_WIDTH/2 - 28) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 22 AND HCOUNT >= SCREEN_WIDTH/2 - 28) AND (VCOUNT <= 60 AND VCOUNT >= 40)) THEN-- segment C
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "010" =>
                    -- Affichage de 2
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 35 AND HCOUNT >= SCREEN_WIDTH/2 - 40) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment E
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "011" =>
                    -- Affichage de 3
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "100" =>
                    -- Affichage de 4
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 35 AND HCOUNT >= SCREEN_WIDTH/2 - 40) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "101" =>
                    -- Affichage de 5
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 35 AND HCOUNT >= SCREEN_WIDTH/2 - 40) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "110" =>
                    -- Fin de partie si on atteint 6 
                    END_GAME <= '1';
                WHEN OTHERS =>
                    NULL;
            END CASE;

            -- Joueur 2 à  droite
            CASE J2_SCORE IS
                WHEN "000" =>
                    -- Affichage de 0
                    IF ((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 15 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment E
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 15 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 35 AND VCOUNT >= 15)) THEN-- segment F
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "001" =>
                    -- Affichage de 1
                    IF ((HCOUNT <= SCREEN_WIDTH/2 + 28 AND HCOUNT >= SCREEN_WIDTH/2 + 22) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 28 AND HCOUNT >= SCREEN_WIDTH/2 + 22) AND (VCOUNT <= 60 AND VCOUNT >= 40)) THEN-- segment C
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "010" =>
                    -- Affichage de 2
                    IF ((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 15 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment E
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "011" =>
                    -- Affichage de 3
                    IF ((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "100" =>
                    -- Affichage de 4
                    IF ((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 15 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "101" =>
                    -- Affichage de 5
                    IF (((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 15 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 40 AND VCOUNT >= 35))) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "110" =>
                    -- Fin de partie si on atteint 6 
                    END_GAME <= '1';
                WHEN OTHERS =>
                    NULL;
            END CASE;
        END IF;

    END PROCESS;

END rtl;
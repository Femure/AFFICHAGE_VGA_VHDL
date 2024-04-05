LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY score_aff IS
    PORT (
        RST : IN STD_LOGIC;
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        J1_SCORE, J2_SCORE : IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- Score J1 et J2
        IS_NUMBER, END_GAME : OUT STD_LOGIC -- Retour pour l'affichage et pour savoir si la partie est terminée
    );
END score_aff;

ARCHITECTURE rtl OF score_aff IS
    CONSTANT SCREEN_WIDTH : INTEGER := 640; -- largeur de l    
BEGIN
    PROCESS (RST, HCOUNT, VCOUNT, J1_SCORE, J2_SCORE)
    BEGIN
        IF (RST = '1') THEN
            IS_NUMBER <= '0';
            END_GAME <= '0';
        ELSE
            -- Joueur 1 à gauche 
            CASE J1_SCORE IS
                WHEN "000" =>
                    -- affichage de 0
                    IF (HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 15 AND VCOUNT >= 10) THEN -- segment A
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 35 AND VCOUNT >= 15) THEN -- segment B
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 60 AND VCOUNT >= 40) THEN -- segment C
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 65 AND VCOUNT >= 60) THEN -- segment D
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 35 AND HCOUNT >= SCREEN_WIDTH/2 - 40) AND (VCOUNT <= 60 AND VCOUNT >= 40) THEN -- segment E
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 35 AND HCOUNT >= SCREEN_WIDTH/2 - 40) AND (VCOUNT <= 35 AND VCOUNT >= 15) THEN -- segment F
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "001" =>
                    -- affichage de 1
                    IF (HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 35 AND VCOUNT >= 15) THEN -- segment B
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 60 AND VCOUNT >= 40) THEN -- segment C
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "010" =>
                    -- affichage de 2
                    IF (HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 15 AND VCOUNT >= 10) THEN -- segment A
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 35 AND VCOUNT >= 15) THEN -- segment B
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 65 AND VCOUNT >= 60) THEN -- segment D
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 35 AND HCOUNT >= SCREEN_WIDTH/2 - 40) AND (VCOUNT <= 60 AND VCOUNT >= 40) THEN -- segment E
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 40 AND VCOUNT >= 35) THEN -- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "011" =>
                    -- affichage de 3
                    IF (HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 15 AND VCOUNT >= 10) THEN -- segment A
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 35 AND VCOUNT >= 15) THEN -- segment B
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 60 AND VCOUNT >= 40) THEN -- segment C
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 65 AND VCOUNT >= 60) THEN -- segment D
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 40 AND VCOUNT >= 35) THEN -- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "100" =>
                    -- affichage de 4
                    IF (HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 35 AND VCOUNT >= 15) THEN -- segment B
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 60 AND VCOUNT >= 40) THEN -- segment C
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 35 AND HCOUNT >= SCREEN_WIDTH/2 - 40) AND (VCOUNT <= 35 AND VCOUNT >= 15) THEN -- segment F
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 40 AND VCOUNT >= 35) THEN -- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "101" =>
                    -- affichage de 5
                    IF (HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 15 AND VCOUNT >= 10) THEN -- segment A
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 60 AND VCOUNT >= 40) THEN -- segment C
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 65 AND VCOUNT >= 60) THEN -- segment D
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 35 AND HCOUNT >= SCREEN_WIDTH/2 - 40) AND (VCOUNT <= 35 AND VCOUNT >= 15) THEN -- segment F
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 40 AND VCOUNT >= 35) THEN -- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN OTHERS =>
                    END_GAME <= '1';
            END CASE;

            -- Joueur 2 à droite
            CASE J2_SCORE IS
                WHEN "000" =>
                    -- affichage de 0
                    IF (HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 15 AND VCOUNT >= 10) THEN -- segment A
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 35 AND VCOUNT >= 15) THEN -- segment B
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 60 AND VCOUNT >= 40) THEN -- segment C
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 65 AND VCOUNT >= 60) THEN -- segment D
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 15 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 60 AND VCOUNT >= 40) THEN -- segment E
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 15 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 35 AND VCOUNT >= 15) THEN -- segment F
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "001" =>
                    -- affichage de 1
                    IF (HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 35 AND VCOUNT >= 15) THEN -- segment B
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 60 AND VCOUNT >= 40) THEN -- segment C
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "010" =>
                    -- affichage de 2
                    IF (HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 15 AND VCOUNT >= 10) THEN -- segment A
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 35 AND VCOUNT >= 15) THEN -- segment B
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 65 AND VCOUNT >= 60) THEN -- segment D
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 15 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 60 AND VCOUNT >= 40) THEN -- segment E
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 40 AND VCOUNT >= 35) THEN -- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "011" =>
                    -- affichage de 3
                    IF (HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 15 AND VCOUNT >= 10) THEN -- segment A
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 35 AND VCOUNT >= 15) THEN -- segment B
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 60 AND VCOUNT >= 40) THEN -- segment C
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 65 AND VCOUNT >= 60) THEN -- segment D
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 40 AND VCOUNT >= 35) THEN -- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "100" =>
                    -- affichage de 4
                    IF (HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 35 AND VCOUNT >= 15) THEN -- segment B
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 60 AND VCOUNT >= 40) THEN -- segment C
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 15 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 35 AND VCOUNT >= 15) THEN -- segment F
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 40 AND VCOUNT >= 35) THEN -- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "101" =>
                    -- affichage de 5
                    IF (HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 15 AND VCOUNT >= 10) THEN -- segment A
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 60 AND VCOUNT >= 40) THEN -- segment C
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 65 AND VCOUNT >= 60) THEN -- segment D
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 15 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 35 AND VCOUNT >= 15) THEN -- segment F
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 40 AND VCOUNT >= 35) THEN -- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN OTHERS =>
                    END_GAME <= '1';
            END CASE;
        END IF;

    END PROCESS;

END rtl;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY score_aff IS
    PORT (
        RST : IN STD_LOGIC;
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        J1COUNT, J2COUNT : IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- Score J1 et J2
        IS_NUMBER : OUT STD_LOGIC -- Retour pour l'affichage 

    );
END score_aff;

ARCHITECTURE rtl OF score_aff IS
    CONSTANT SCREEN_WIDTH : INTEGER := 640; -- largeur de l    
BEGIN
    PROCESS (RST, BLANK, HCOUNT, VCOUNT)
    BEGIN
        IF (RST = '1') THEN
            IS_NUMBER <= '0';
        ELSE
            -- Joueur 1 à gauche 
            CASE J1COUNT IS
                WHEN "000" =>
                    -- affichage de 0
                    IF (HCOUNT <= SCREEN_WIDTH/2 - 60 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 105 AND VCOUNT >= 100) THEN -- segment A
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 65 AND HCOUNT >= SCREEN_WIDTH/2 - 60) AND (VCOUNT <= 135 AND VCOUNT >= 105) THEN -- segment B
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 65 AND HCOUNT >= SCREEN_WIDTH/2 - 60) AND (VCOUNT <= 170 AND VCOUNT >= 140) THEN -- segment C
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 60 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 175 AND VCOUNT >= 170) THEN -- segment D
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 95 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 170 AND VCOUNT >= 140) THEN -- segment E
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 95 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 135 AND VCOUNT >= 105) THEN -- segment F
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "001" =>
                    -- affichage de 1
                    IF (HCOUNT <= SCREEN_WIDTH/2 - 65 AND HCOUNT >= SCREEN_WIDTH/2 - 60) AND (VCOUNT <= 135 AND VCOUNT >= 105) THEN -- segment B
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 65 AND HCOUNT >= SCREEN_WIDTH/2 - 60) AND (VCOUNT <= 170 AND VCOUNT >= 140) THEN -- segment C
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "010" =>
                    -- affichage de 2
                    IF (HCOUNT <= SCREEN_WIDTH/2 - 60 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 105 AND VCOUNT >= 100) THEN -- segment A
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 65 AND HCOUNT >= SCREEN_WIDTH/2 - 60) AND (VCOUNT <= 135 AND VCOUNT >= 105) THEN -- segment B
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 60 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 175 AND VCOUNT >= 170) THEN -- segment D
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 95 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 170 AND VCOUNT >= 140) THEN -- segment E
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 60 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 140 AND VCOUNT >= 135) THEN -- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "011" =>
                    -- affichage de 3
                    IF (HCOUNT <= SCREEN_WIDTH/2 - 60 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 105 AND VCOUNT >= 100) THEN -- segment A
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 65 AND HCOUNT >= SCREEN_WIDTH/2 - 60) AND (VCOUNT <= 135 AND VCOUNT >= 105) THEN -- segment B
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 65 AND HCOUNT >= SCREEN_WIDTH/2 - 60) AND (VCOUNT <= 170 AND VCOUNT >= 140) THEN -- segment C
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 60 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 175 AND VCOUNT >= 170) THEN -- segment D
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 60 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 140 AND VCOUNT >= 135) THEN -- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "100" =>
                    -- affichage de 4
                    IF (HCOUNT <= SCREEN_WIDTH/2 - 65 AND HCOUNT >= SCREEN_WIDTH/2 - 60) AND (VCOUNT <= 135 AND VCOUNT >= 105) THEN -- segment B
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 65 AND HCOUNT >= SCREEN_WIDTH/2 - 60) AND (VCOUNT <= 170 AND VCOUNT >= 140) THEN -- segment C
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 95 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 135 AND VCOUNT >= 105) THEN -- segment F
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 60 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 140 AND VCOUNT >= 135) THEN -- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "101" =>
                    -- affichage de 5
                    IF (HCOUNT <= SCREEN_WIDTH/2 - 60 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 105 AND VCOUNT >= 100) THEN -- segment A
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 65 AND HCOUNT >= SCREEN_WIDTH/2 - 60) AND (VCOUNT <= 170 AND VCOUNT >= 140) THEN -- segment C
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 60 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 175 AND VCOUNT >= 170) THEN -- segment D
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 95 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 135 AND VCOUNT >= 105) THEN -- segment F
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 60 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 140 AND VCOUNT >= 135) THEN -- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN OTHERS =>
                    -- affichage 7 segment
                    IS_NUMBER <= '0';
                    -- IF (HCOUNT <= SCREEN_WIDTH/2 - 60 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 105 AND VCOUNT >= 100) THEN -- segment A
                    --     IS_NUMBER <= '1';
                    -- ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 65 AND HCOUNT >= SCREEN_WIDTH/2 - 60) AND (VCOUNT <= 135 AND VCOUNT >= 105) THEN -- segment B
                    --     IS_NUMBER <= '1';
                    -- ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 65 AND HCOUNT >= SCREEN_WIDTH/2 - 60) AND (VCOUNT <= 170 AND VCOUNT >= 140) THEN -- segment C
                    --     IS_NUMBER <= '1';
                    -- ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 60 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 175 AND VCOUNT >= 170) THEN -- segment D
                    --     IS_NUMBER <= '1';
                    -- ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 95 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 170 AND VCOUNT >= 140) THEN -- segment E
                    --     IS_NUMBER <= '1';
                    -- ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 95 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 135 AND VCOUNT >= 105) THEN -- segment F
                    --     IS_NUMBER <= '1';
                    -- ELSIF (HCOUNT <= SCREEN_WIDTH/2 - 60 AND HCOUNT >= SCREEN_WIDTH/2 - 90) AND (VCOUNT <= 140 AND VCOUNT >= 135) THEN -- segment G
                    --     IS_NUMBER <= '1';
                    -- END IF;
            END CASE;

            -- Joueur 2 à droite
            CASE J2COUNT IS
                WHEN "000" =>
                    -- affichage de 0
                    IF (HCOUNT <= SCREEN_WIDTH/2 + 90 AND HCOUNT >= SCREEN_WIDTH/2 + 60) AND (VCOUNT <= 105 AND VCOUNT >= 100) THEN -- segment A
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 95 AND HCOUNT >= SCREEN_WIDTH/2 + 90) AND (VCOUNT <= 135 AND VCOUNT >= 105) THEN -- segment B
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 95 AND HCOUNT >= SCREEN_WIDTH/2 + 90) AND (VCOUNT <= 170 AND VCOUNT >= 140) THEN -- segment C
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 90 AND HCOUNT >= SCREEN_WIDTH/2 + 60) AND (VCOUNT <= 175 AND VCOUNT >= 170) THEN -- segment D
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 60 AND HCOUNT >= SCREEN_WIDTH/2 + 55) AND (VCOUNT <= 170 AND VCOUNT >= 140) THEN -- segment E
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 60 AND HCOUNT >= SCREEN_WIDTH/2 + 55) AND (VCOUNT <= 135 AND VCOUNT >= 105) THEN -- segment F
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "001" =>
                    -- affichage de 1
                    IF (HCOUNT <= SCREEN_WIDTH/2 + 95 AND HCOUNT >= SCREEN_WIDTH/2 + 90) AND (VCOUNT <= 135 AND VCOUNT >= 105) THEN -- segment B
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 95 AND HCOUNT >= SCREEN_WIDTH/2 + 90) AND (VCOUNT <= 170 AND VCOUNT >= 140) THEN -- segment C
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "010" =>
                    -- affichage de 2
                    IF (HCOUNT <= SCREEN_WIDTH/2 + 90 AND HCOUNT >= SCREEN_WIDTH/2 + 60) AND (VCOUNT <= 105 AND VCOUNT >= 100) THEN -- segment A
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 95 AND HCOUNT >= SCREEN_WIDTH/2 + 90) AND (VCOUNT <= 135 AND VCOUNT >= 105) THEN -- segment B
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 90 AND HCOUNT >= SCREEN_WIDTH/2 + 60) AND (VCOUNT <= 175 AND VCOUNT >= 170) THEN -- segment D
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 60 AND HCOUNT >= SCREEN_WIDTH/2 + 55) AND (VCOUNT <= 170 AND VCOUNT >= 140) THEN -- segment E
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 90 AND HCOUNT >= SCREEN_WIDTH/2 + 60) AND (VCOUNT <= 140 AND VCOUNT >= 135) THEN -- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "011" =>
                    -- affichage de 3
                    IF (HCOUNT <= SCREEN_WIDTH/2 + 90 AND HCOUNT >= SCREEN_WIDTH/2 + 60) AND (VCOUNT <= 105 AND VCOUNT >= 100) THEN -- segment A
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 95 AND HCOUNT >= SCREEN_WIDTH/2 + 90) AND (VCOUNT <= 135 AND VCOUNT >= 105) THEN -- segment B
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 95 AND HCOUNT >= SCREEN_WIDTH/2 + 90) AND (VCOUNT <= 170 AND VCOUNT >= 140) THEN -- segment C
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 90 AND HCOUNT >= SCREEN_WIDTH/2 + 60) AND (VCOUNT <= 175 AND VCOUNT >= 170) THEN -- segment D
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 90 AND HCOUNT >= SCREEN_WIDTH/2 + 60) AND (VCOUNT <= 140 AND VCOUNT >= 135) THEN -- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "100" =>
                    -- affichage de 4
                    IF (HCOUNT <= SCREEN_WIDTH/2 + 95 AND HCOUNT >= SCREEN_WIDTH/2 + 90) AND (VCOUNT <= 135 AND VCOUNT >= 105) THEN -- segment B
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 95 AND HCOUNT >= SCREEN_WIDTH/2 + 90) AND (VCOUNT <= 170 AND VCOUNT >= 140) THEN -- segment C
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 60 AND HCOUNT >= SCREEN_WIDTH/2 + 55) AND (VCOUNT <= 135 AND VCOUNT >= 105) THEN -- segment F
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 90 AND HCOUNT >= SCREEN_WIDTH/2 + 60) AND (VCOUNT <= 140 AND VCOUNT >= 135) THEN -- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "101" =>
                    -- affichage de 5
                    IF (HCOUNT <= SCREEN_WIDTH/2 + 90 AND HCOUNT >= SCREEN_WIDTH/2 + 60) AND (VCOUNT <= 105 AND VCOUNT >= 100) THEN -- segment A
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 95 AND HCOUNT >= SCREEN_WIDTH/2 + 90) AND (VCOUNT <= 170 AND VCOUNT >= 140) THEN -- segment C
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 90 AND HCOUNT >= SCREEN_WIDTH/2 + 60) AND (VCOUNT <= 175 AND VCOUNT >= 170) THEN -- segment D
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 60 AND HCOUNT >= SCREEN_WIDTH/2 + 55) AND (VCOUNT <= 135 AND VCOUNT >= 105) THEN -- segment F
                        IS_NUMBER <= '1';
                    ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 90 AND HCOUNT >= SCREEN_WIDTH/2 + 60) AND (VCOUNT <= 140 AND VCOUNT >= 135) THEN -- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN OTHERS =>
                    -- affichage 7 segment
                    IS_NUMBER <= '0';
                    -- IF (HCOUNT <= SCREEN_WIDTH/2 + 90 AND HCOUNT >= SCREEN_WIDTH/2 + 60) AND (VCOUNT <= 105 AND VCOUNT >= 100) THEN -- segment A
                    --     IS_NUMBER <= '1';
                    -- ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 95 AND HCOUNT >= SCREEN_WIDTH/2 + 90) AND (VCOUNT <= 135 AND VCOUNT >= 105) THEN -- segment B
                    --     IS_NUMBER <= '1';
                    -- ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 95 AND HCOUNT >= SCREEN_WIDTH/2 + 90) AND (VCOUNT <= 170 AND VCOUNT >= 140) THEN -- segment C
                    --     IS_NUMBER <= '1';
                    -- ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 90 AND HCOUNT >= SCREEN_WIDTH/2 + 60) AND (VCOUNT <= 175 AND VCOUNT >= 170) THEN -- segment D
                    --     IS_NUMBER <= '1';
                    -- ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 60 AND HCOUNT >= SCREEN_WIDTH/2 + 55) AND (VCOUNT <= 170 AND VCOUNT >= 140) THEN -- segment E
                    --     IS_NUMBER <= '1';
                    -- ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 60 AND HCOUNT >= SCREEN_WIDTH/2 + 55) AND (VCOUNT <= 135 AND VCOUNT >= 105) THEN -- segment F
                    --     IS_NUMBER <= '1';
                    -- ELSIF (HCOUNT <= SCREEN_WIDTH/2 + 90 AND HCOUNT >= SCREEN_WIDTH/2 + 60) AND (VCOUNT <= 140 AND VCOUNT >= 135) THEN -- segment G
                    --     IS_NUMBER <= '1';
                    -- END IF;

            END CASE;
        END IF;

    END PROCESS;

END rtl;
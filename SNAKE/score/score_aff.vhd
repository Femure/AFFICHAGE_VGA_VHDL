LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY score_aff IS
    PORT (
        RST : IN STD_LOGIC;
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        SCORE : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
        IS_NUMBER : OUT STD_LOGIC
    );
END score_aff;

ARCHITECTURE rtl OF score_aff IS
    CONSTANT SCREEN_WIDTH : INTEGER := 640; -- Largeur de l'écran en pixels
    SIGNAL dizaine, unite : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Le score est séparé en dizaine et unité
BEGIN
    -- Sépare le score en dizaine et unité
    dizaine <= STD_LOGIC_VECTOR(to_unsigned(to_integer(IEEE.NUMERIC_STD.unsigned(SCORE)) / 10, dizaine'length));
    unite <= STD_LOGIC_VECTOR(to_unsigned(to_integer(IEEE.NUMERIC_STD.unsigned(SCORE)) MOD 10, unite'length));

    PROCESS (RST, HCOUNT, VCOUNT, dizaine, unite)
    BEGIN
        IF (RST = '1') THEN
            IS_NUMBER <= '0';
        ELSE
            IS_NUMBER <= '0';
            CASE dizaine IS
                WHEN "0000" =>
                    -- Affichage de 0
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 5 AND HCOUNT >= SCREEN_WIDTH/2 - 10) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 5 AND HCOUNT >= SCREEN_WIDTH/2 - 10) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 30 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment E
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 30 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 35 AND VCOUNT >= 15)) THEN-- segment F
                        IS_NUMBER <= '1';
                    END IF;

                WHEN "0001" =>
                    -- Affichage de 1
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 18 AND HCOUNT >= SCREEN_WIDTH/2 - 23) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 18 AND HCOUNT >= SCREEN_WIDTH/2 - 23) AND (VCOUNT <= 60 AND VCOUNT >= 40)) THEN-- segment C
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0010" =>
                    -- Affichage de 2
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 5 AND HCOUNT >= SCREEN_WIDTH/2 - 10) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 30 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment E
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0011" =>
                    -- Affichage de 3
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 5 AND HCOUNT >= SCREEN_WIDTH/2 - 10) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 5 AND HCOUNT >= SCREEN_WIDTH/2 - 10) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0100" =>
                    -- Affichage de 4
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 5 AND HCOUNT >= SCREEN_WIDTH/2 - 10) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 5 AND HCOUNT >= SCREEN_WIDTH/2 - 10) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 30 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0101" =>
                    -- Affichage de 5
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 5 AND HCOUNT >= SCREEN_WIDTH/2 - 10) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 30 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0110" =>
                    -- Affichage de 6
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 5 AND HCOUNT >= SCREEN_WIDTH/2 - 10) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 30 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment E
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 30 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0111" =>
                    -- Affichage de 7
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 5 AND HCOUNT >= SCREEN_WIDTH/2 - 10) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 5 AND HCOUNT >= SCREEN_WIDTH/2 - 10) AND (VCOUNT <= 60 AND VCOUNT >= 40)) THEN -- segment C
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "1000" =>
                    -- Affichage de 8
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR ((HCOUNT <= SCREEN_WIDTH/2 - 5 AND HCOUNT >= SCREEN_WIDTH/2 - 10) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 5 AND HCOUNT >= SCREEN_WIDTH/2 - 10) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 30 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment E
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 30 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "1001" =>
                    -- Affichage de 9
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR ((HCOUNT <= SCREEN_WIDTH/2 - 5 AND HCOUNT >= SCREEN_WIDTH/2 - 10) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 5 AND HCOUNT >= SCREEN_WIDTH/2 - 10) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 30 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 30) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN OTHERS =>
                    NULL;
            END CASE;

            CASE unite IS
                WHEN "0000" =>
                    -- Affichage de 0
                    IF ((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 30) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 30) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 10 AND HCOUNT >= SCREEN_WIDTH/2 + 5) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment E
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 10 AND HCOUNT >= SCREEN_WIDTH/2 + 5) AND (VCOUNT <= 35 AND VCOUNT >= 15)) THEN-- segment F
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0001" =>
                    -- Affichage de 1
                    IF ((HCOUNT <= SCREEN_WIDTH/2 + 23 AND HCOUNT >= SCREEN_WIDTH/2 + 18) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 23 AND HCOUNT >= SCREEN_WIDTH/2 + 18) AND (VCOUNT <= 60 AND VCOUNT >= 40)) THEN-- segment C
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0010" =>
                    -- Affichage de 2
                    IF ((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 30) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 10 AND HCOUNT >= SCREEN_WIDTH/2 + 5) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment E
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0011" =>
                    -- Affichage de 3
                    IF ((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 30) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 30) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0100" =>
                    -- Affichage de 4
                    IF ((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 30) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 30) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 10 AND HCOUNT >= SCREEN_WIDTH/2 + 5) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0101" =>
                    -- Affichage de 5
                    IF (((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 30) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 10 AND HCOUNT >= SCREEN_WIDTH/2 + 5) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 40 AND VCOUNT >= 35))) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0110" =>
                    -- Affichage de 6
                    IF (((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 30) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 10 AND HCOUNT >= SCREEN_WIDTH/2 + 5) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment E
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 10 AND HCOUNT >= SCREEN_WIDTH/2 + 5) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 40 AND VCOUNT >= 35))) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0111" =>
                    -- Affichage de 7
                    IF (((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR ((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 30) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 30) AND (VCOUNT <= 60 AND VCOUNT >= 40))) THEN-- segment C
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "1000" =>
                    -- Affichage de 8
                    IF (((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR ((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 30) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 30) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 10 AND HCOUNT >= SCREEN_WIDTH/2 + 5) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment E
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 10 AND HCOUNT >= SCREEN_WIDTH/2 + 5) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 40 AND VCOUNT >= 35))) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "1001" =>
                    -- Affichage de 8
                    IF (((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR ((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 30) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 30) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 10 AND HCOUNT >= SCREEN_WIDTH/2 + 5) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 30 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 40 AND VCOUNT >= 35))) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN OTHERS =>
                    NULL;
            END CASE;
        END IF;
    END PROCESS;
END rtl;
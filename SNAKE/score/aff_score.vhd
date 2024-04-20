LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY aff_score IS
    PORT (
        RST : IN STD_LOGIC;
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        SCORE : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
        IS_NUMBER : OUT STD_LOGIC
    );
END aff_score;

ARCHITECTURE rtl OF aff_score IS
    CONSTANT SCREEN_WIDTH : INTEGER := 640;
    SIGNAL dizaine, unite : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
        dizaine <= std_logic_vector(to_unsigned(to_integer(IEEE.NUMERIC_STD.unsigned(SCORE)) / 10, dizaine'length));
        unite <= std_logic_vector(to_unsigned(to_integer(IEEE.NUMERIC_STD.unsigned(SCORE)) mod 10, unite'length));

    PROCESS (RST, HCOUNT, VCOUNT, SCORE)
    BEGIN
        IF (RST = '1') THEN
            IS_NUMBER <= '0';
        ELSE
            IS_NUMBER <= '0';
            CASE dizaine IS
                WHEN "0000" =>
                    -- affichage de 0
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 35 AND HCOUNT >= SCREEN_WIDTH/2 - 40) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment E
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 35 AND HCOUNT >= SCREEN_WIDTH/2 - 40) AND (VCOUNT <= 35 AND VCOUNT >= 15)) THEN-- segment F
                        IS_NUMBER <= '1';
                    END IF;

                WHEN "0001" =>
                    -- affichage de 1
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 60 AND VCOUNT >= 40)) THEN-- segment C
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0010" =>
                    -- affichage de 2
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 35 AND HCOUNT >= SCREEN_WIDTH/2 - 40) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment E
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0011" =>
                    -- affichage de 3
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0100" =>
                    -- affichage de 4
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 35 AND HCOUNT >= SCREEN_WIDTH/2 - 40) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0101" =>
                    -- affichage de 5
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 35 AND HCOUNT >= SCREEN_WIDTH/2 - 40) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0110" =>
                    -- affichage de 6
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 35 AND HCOUNT >= SCREEN_WIDTH/2 - 40) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment E
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 35 AND HCOUNT >= SCREEN_WIDTH/2 - 40) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0111" =>
                    -- affichage de 7
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 60 AND VCOUNT >= 40)) THEN -- segment C
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "1000" =>
                    -- affichage de 8
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR ((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 35 AND HCOUNT >= SCREEN_WIDTH/2 - 40) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment E
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 35 AND HCOUNT >= SCREEN_WIDTH/2 - 40) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "1001" =>
                    -- affichage de 9
                    IF ((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR ((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 10 AND HCOUNT >= SCREEN_WIDTH/2 - 15) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 35 AND HCOUNT >= SCREEN_WIDTH/2 - 40) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 - 15 AND HCOUNT >= SCREEN_WIDTH/2 - 35) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN OTHERS =>
                    NULL;
            END CASE;

            CASE unite IS
                WHEN "0000" =>
                    -- affichage de 0
                    IF ((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 15 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment E
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 15 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 35 AND VCOUNT >= 15)) THEN-- segment F
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0001" =>
                    -- affichage de 1
                    IF ((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 60 AND VCOUNT >= 40)) THEN-- segment C
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0010" =>
                    -- affichage de 2
                    IF ((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 15 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment E
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0011" =>
                    -- affichage de 3
                    IF ((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0100" =>
                    -- affichage de 4
                    IF ((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 15 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 40 AND VCOUNT >= 35)) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0101" =>
                    -- affichage de 5
                    IF (((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 15 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 40 AND VCOUNT >= 35))) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0110" =>
                    -- affichage de 6
                    IF (((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 15 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment E
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 15 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 40 AND VCOUNT >= 35))) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "0111" =>
                    -- affichage de 7
                    IF (((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR ((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 60 AND VCOUNT >= 40))) THEN-- segment C
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "1000" =>
                    -- affichage de 8
                    IF (((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR ((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 15 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment E
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 15 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 40 AND VCOUNT >= 35))) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN "1001" =>
                    -- affichage de 8
                    IF (((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 15 AND VCOUNT >= 10)) -- segment A
                        OR ((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment B
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 40 AND HCOUNT >= SCREEN_WIDTH/2 + 35) AND (VCOUNT <= 60 AND VCOUNT >= 40)) -- segment C
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 65 AND VCOUNT >= 60)) -- segment D
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 15 AND HCOUNT >= SCREEN_WIDTH/2 + 10) AND (VCOUNT <= 35 AND VCOUNT >= 15)) -- segment F
                        OR((HCOUNT <= SCREEN_WIDTH/2 + 35 AND HCOUNT >= SCREEN_WIDTH/2 + 15) AND (VCOUNT <= 40 AND VCOUNT >= 35))) THEN-- segment G
                        IS_NUMBER <= '1';
                    END IF;
                WHEN OTHERS =>
                    NULL;
            END CASE;
        END IF;
    END PROCESS;
END rtl;
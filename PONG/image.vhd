LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY image IS
    PORT (
        RST, BLANK, IS_TERRAIN, IS_RAQUETTE_G, IS_RAQUETTE_D, IS_BALLE, IS_NUMBER : IN STD_LOGIC;
        RED, GREEN, BLUE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END image;

ARCHITECTURE rtl OF image IS
BEGIN
    PROCESS (RST, BLANK, IS_TERRAIN, IS_RAQUETTE_G, IS_RAQUETTE_D, IS_BALLE, IS_NUMBER)
    BEGIN
        IF (RST = '1') THEN
            RED <= (OTHERS => '0');
            GREEN <= (OTHERS => '0');
            BLUE <= (OTHERS => '0');
        ELSE
            IF (BLANK = '1') THEN
                IF (IS_NUMBER = '1') THEN -- Le score est en blanc
                    RED <= "1111";
                    GREEN <= "1111";
                    BLUE <= "1111";
                ELSIF (IS_RAQUETTE_G = '1') THEN -- La raquette gauche est en cyan
                    RED <= "0000";
                    GREEN <= "0101";
                    BLUE <= "1100";
                ELSIF (IS_RAQUETTE_D = '1') THEN -- La raquette droite est en magenta
                    RED <= "1100";
                    GREEN <= "0000";
                    BLUE <= "0101";
                ELSIF (IS_BALLE = '1') THEN -- La balle est en jaune
                    RED <= "1111";
                    GREEN <= "1111";
                    BLUE <= "0000";
                ELSIF (IS_TERRAIN = '1') THEN -- La ligne au milieu du terrain est en blanc
                    RED <= "1111";
                    GREEN <= "1111";
                    BLUE <= "1111";
                ELSE -- Le terrain est en noir
                    RED <= "0000";
                    GREEN <= "0000";
                    BLUE <= "0000";
                END IF;
            ELSE -- Le terrain est en noir
                RED <= "0000";
                GREEN <= "0000";
                BLUE <= "0000";
            END IF;
        END IF;
    END PROCESS;
END rtl;
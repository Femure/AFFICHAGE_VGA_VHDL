LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY image IS
    PORT (
        RST, BLANK, IS_BALLE : IN STD_LOGIC;
        RED, GREEN, BLUE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END image;

ARCHITECTURE rtl OF image IS
BEGIN
    PROCESS (RST, BLANK, IS_BALLE)
    BEGIN
        IF (RST = '1') THEN
            RED <= (OTHERS => '0');
            GREEN <= (OTHERS => '0');
            BLUE <= (OTHERS => '0');
        ELSE
            IF (BLANK = '1') THEN
                IF (IS_BALLE = '1') THEN
                    RED <= "1111";
                    GREEN <= "1111";
                    BLUE <= "1111";
                ELSE
                    RED <= "0000";
                    GREEN <= "0000";
                    BLUE <= "0000";
                END IF;
            ELSE
                RED <= "0000";
                GREEN <= "0000";
                BLUE <= "0000";
            END IF;
        END IF;
    END PROCESS;
END rtl;
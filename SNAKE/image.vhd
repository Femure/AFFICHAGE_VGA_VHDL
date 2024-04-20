LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY image IS
    PORT (
        RST, BLANK : IN STD_LOGIC;
        IS_SNAKE, IS_FOOD, IS_NUMBER : IN STD_LOGIC;
        RED, GREEN, BLUE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END image;

ARCHITECTURE rtl OF image IS
BEGIN
    PROCESS (RST, BLANK, IS_SNAKE, IS_FOOD, IS_NUMBER)
    BEGIN
        IF (RST = '1') THEN
            RED <= (OTHERS => '0');
            GREEN <= (OTHERS => '0');
            BLUE <= (OTHERS => '0');
        ELSE
            IF (BLANK = '1') THEN
                IF (IS_NUMBER = '1') THEN -- Blanc
                    RED <= "1111";
                    GREEN <= "1111";
                    BLUE <= "1111";
                ELSIF (IS_SNAKE = '1') THEN --Bleu
                    RED <= "0000";
                    GREEN <= "0000";
                    BLUE <= "1111";
                ELSIF (IS_FOOD = '1') THEN -- Rouge
                    RED <= "1111";
                    GREEN <= "0000";
                    BLUE <= "0000";
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
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY image IS
    PORT (
        RST, BLANK : IN STD_LOGIC;
        IS_SNAKE_BODY, IS_SNAKE_HEAD, IS_FOOD, IS_NUMBER : IN STD_LOGIC;
        RED, GREEN, BLUE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END image;

ARCHITECTURE rtl OF image IS
BEGIN
    PROCESS (RST, BLANK, IS_SNAKE_BODY, IS_SNAKE_HEAD, IS_FOOD, IS_NUMBER)
    BEGIN
        IF (RST = '1') THEN
            RED <= (OTHERS => '0');
            GREEN <= (OTHERS => '0');
            BLUE <= (OTHERS => '0');
        ELSE
            IF (BLANK = '1') THEN
                IF (IS_NUMBER = '1') THEN -- Le score en blanc
                    RED <= "1111";
                    GREEN <= "1111";
                    BLUE <= "1111";
                ELSIF (IS_SNAKE_HEAD = '1') THEN --La tête du serpent en rouge
                    RED <= "1100";
                    GREEN <= "1000";
                    BLUE <= "0111";
                ELSIF (IS_SNAKE_BODY = '1') THEN --Le corps du serpent en jaune
                    RED <= "1110";
                    GREEN <= "1100";
                    BLUE <= "1000";
                ELSIF (IS_FOOD = '1') THEN -- La nourriture en violet
                    RED <= "1011";
                    GREEN <= "1000";
                    BLUE <= "1101";
                ELSE -- Le terrain en vert
                    RED <= "1000";
                    GREEN <= "1100"; 
                    BLUE <= "0110";
                END IF;
            ELSE
                RED <= "0000";
                GREEN <= "0000";
                BLUE <= "0000";
            END IF;
        END IF;
    END PROCESS;
END rtl;
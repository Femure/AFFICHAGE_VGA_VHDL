LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;

ENTITY food_spawn IS
    PORT (
        RST, FOOD_CLK, FRAME : IN STD_LOGIC;
        X_SNAKE, Y_SNAKE : IN INTEGER;
        X_RANDOM, Y_RANDOM : IN INTEGER;
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        IS_EATEN, IS_FOOD : OUT STD_LOGIC
    );
END food_spawn;

ARCHITECTURE rtl OF food_spawn IS
    CONSTANT FOOD_SIZE : INTEGER := 20; -- taille de la nourriture en pixels
    CONSTANT SNAKE_SIZE : INTEGER := 20; -- taille de la tête du serpent en pixels
    CONSTANT SCREEN_WIDTH : INTEGER := 640; -- largeur de l'écran en pixels 
    CONSTANT SCREEN_HEIGHT : INTEGER := 480; -- hauteur de l'écran en pixels 

    SIGNAL xFood : INTEGER := 2 * SCREEN_WIDTH / 3;
    SIGNAL yFood : INTEGER := SCREEN_HEIGHT / 2;
    SIGNAL eaten : STD_LOGIC := '0';
BEGIN

    PROCESS (FOOD_CLK, RST, FRAME, X_SNAKE, Y_SNAKE, HCOUNT, VCOUNT, X_RANDOM, Y_RANDOM)
    BEGIN
        IF (RST = '1') THEN
            xFood <= 2 * SCREEN_WIDTH / 3;
            yFood <= SCREEN_HEIGHT / 2;
            eaten <= '0';
        ELSIF (FOOD_CLK'event AND FOOD_CLK = '1') THEN
            IF (FRAME = '1') THEN
                IF (eaten = '1') THEN -- Si le serpent mange la nourriture alors le nouveau cube apparaît de manière aléatoire
                    xFood <= X_RANDOM;
                    yFood <= Y_RANDOM;
                    eaten <= '0';
                ELSE
                    IF (X_SNAKE > xFood - FOOD_SIZE/2 - SNAKE_SIZE / 2) -- Coté gauche
                        AND (X_SNAKE < xFood + FOOD_SIZE/2 + SNAKE_SIZE / 2) -- Coté droit
                        AND (Y_SNAKE > yFood - FOOD_SIZE/2 - SNAKE_SIZE / 2) -- Coté bas
                        AND (Y_SNAKE < yFood + FOOD_SIZE/2 + SNAKE_SIZE / 2) THEN -- Coté haut
                        eaten <= '1';
                    END IF;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    -- IS_FOOD=1 si le pixel en cours de balayage est à l'intérieur du carré de nourriture, IS_FOOD=0 sinon
    IS_FOOD <= '1' WHEN (HCOUNT > xFood - FOOD_SIZE / 2) AND (HCOUNT < xFood + FOOD_SIZE / 2) AND
        (VCOUNT > yFood - FOOD_SIZE / 2) AND (VCOUNT < yFood + FOOD_SIZE / 2) ELSE
        '0';
    IS_EATEN <= eaten;
END rtl;
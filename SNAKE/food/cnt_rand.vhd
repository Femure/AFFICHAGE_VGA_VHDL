LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY cnt_rand IS
    PORT (
        CLK, RST : IN STD_LOGIC;
        X_RANDOM, Y_RANDOM : OUT INTEGER
    );
END cnt_rand;

ARCHITECTURE rtl OF cnt_rand IS
    CONSTANT FOOD_SIZE : INTEGER := 20; -- taille de la nourriture en pixels
    CONSTANT SCREEN_WIDTH : INTEGER := 640; -- largeur de l'écran en pixels
    CONSTANT SCREEN_HEIGHT : INTEGER := 480; -- hauteur de l'écran en pixels 

    SIGNAL random_x, random_y : INTEGER := FOOD_SIZE/2;

BEGIN
    PROCESS (CLK, RST)
    BEGIN
        IF (RST = '1') THEN
            random_x <= FOOD_SIZE/2;
            random_y <= FOOD_SIZE/2;
        ELSIF (CLK'event AND CLK = '1') THEN
            -- Génération de coordonnées aléatoires dans les limites de l'écran
            IF (random_x > SCREEN_WIDTH - FOOD_SIZE/2) THEN
                random_x <= FOOD_SIZE/2;
            ELSE
                random_x <= random_x + 1;
            END IF;
            IF (random_y > SCREEN_HEIGHT - FOOD_SIZE/2) THEN
                random_y <= FOOD_SIZE/2;
            ELSE
                random_y <= random_y + 1;
            END IF;
        END IF;
    END PROCESS;
    X_RANDOM <= random_x;
    Y_RANDOM <= random_y;
END rtl;
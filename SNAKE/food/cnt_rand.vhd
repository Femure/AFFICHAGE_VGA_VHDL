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
    CONSTANT FOOD_SIZE : INTEGER := 20; -- Taille de la nourriture en pixels
    CONSTANT SCREEN_WIDTH : INTEGER := 640; -- Largeur de l'écran en pixels
    CONSTANT SCREEN_HEIGHT : INTEGER := 480; -- Hauteur de l'écran en pixels 

    SIGNAL random_x, random_y : INTEGER := 0; -- Valeurs aléatoires des coordonnées

BEGIN
    PROCESS (CLK, RST)
    BEGIN
        IF (RST = '1') THEN
            random_x <= 0;
            random_y <= 0;
        ELSIF (CLK'event AND CLK = '1') THEN
            -- Génération de coordonnées aléatoires dans les limites de l'écran
            random_x <= random_x + FOOD_SIZE;
            IF (random_x >= SCREEN_WIDTH - FOOD_SIZE) THEN
                random_x <= FOOD_SIZE/2;
                random_y <= random_y + FOOD_SIZE;
                IF (random_y >= SCREEN_HEIGHT - FOOD_SIZE) THEN
                    random_y <= FOOD_SIZE/2;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    -- Renvoie la position aléatoire de la nourriture
    X_RANDOM <= random_x;
    Y_RANDOM <= random_y;
END rtl;
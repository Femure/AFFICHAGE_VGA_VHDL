LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.MATH_REAL.ALL;

ENTITY food_spawn IS
    PORT (
        RST, CLK_RESPAWN, FRAME : IN STD_LOGIC;
        X_SNAKE, Y_SNAKE : IN INTEGER;
        SEED1, SEED2 : IN INTEGER;
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        IS_EATEN, IS_FOOD : OUT STD_LOGIC
    );
END food_spawn;

ARCHITECTURE rtl OF food_spawn IS
    CONSTANT FOOD_SIZE : INTEGER := 10; -- taille de la nourriture en pixels
    CONSTANT SNAKE_SIZE : INTEGER := 10; -- taille de la tête du serpent en pixels
    CONSTANT SCREEN_WIDTH : INTEGER := 640; -- largeur de l'écran en pixels 
    CONSTANT SCREEN_HEIGHT : INTEGER := 480; -- hauteur de l'écran en pixels 

    -- Définition de la fonction pour générer des nombres pseudo-aléatoires entre min_val et max_val
    FUNCTION rand_int(rand_val : INTEGER; MIN_VAL, MAX_VAL : INTEGER) RETURN INTEGER IS
        VARIABLE range_val : INTEGER := MAX_VAL - MIN_VAL;
        VARIABLE normalized_val : INTEGER := rand_val;
        VARIABLE scaled_val : INTEGER;
    BEGIN
        -- Normalisation de la valeur aléatoire
        scaled_val := normalized_val * (range_val +1) / 256; -- 256 est la plage de valeurs possibles de rand_val

        -- Ajout du décalage pour obtenir une valeur dans la plage spécifiée
        RETURN scaled_val + MIN_VAL;
    END FUNCTION;

    SIGNAL xFood : INTEGER := 2 * SCREEN_WIDTH / 3;
    SIGNAL yFood : INTEGER := SCREEN_HEIGHT / 2;
    SIGNAL eaten : STD_LOGIC;
BEGIN

    PROCESS (RST, FRAME, CLK_RESPAWN, X_SNAKE, Y_SNAKE, HCOUNT, VCOUNT)
    BEGIN
        IF (RST = '1') THEN
            xFood <= 2 * SCREEN_WIDTH / 3;
            yFood <= SCREEN_HEIGHT / 2;
            eaten <= '0';
        ELSE
            IF (FRAME = '1') THEN
                IF (eaten = '1') THEN -- Si le serpent mange la nourriture alors le nouveau cube apparaît de manière aléatoire
                    xFood <= rand_int(SEED1, FOOD_SIZE, SCREEN_WIDTH - FOOD_SIZE);
                    yFood <= rand_int(SEED2, FOOD_SIZE, SCREEN_HEIGHT - FOOD_SIZE);
                    eaten <= '0';
                ELSE
                    -- IF ((X_SNAKE > (xFood - FOOD_SIZE/2) - (SNAKE_SIZE / 2))) -- Coté gauche
                    --     AND ((X_SNAKE < (xFood + FOOD_SIZE/2) + (SNAKE_SIZE / 2))) -- Coté droit
                    --     AND ((Y_SNAKE > (yFood - FOOD_SIZE/2) - (SNAKE_SIZE / 2))) -- Coté bas
                    --     AND ((Y_SNAKE < (yFood + FOOD_SIZE/2) + (SNAKE_SIZE / 2))) THEN -- Coté haut
                    IF (CLK_RESPAWN = '1') THEN
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
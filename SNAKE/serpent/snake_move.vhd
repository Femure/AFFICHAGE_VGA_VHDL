LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY snake_move IS
    PORT (
        SNAKE_CLK, RST, FRAME : IN STD_LOGIC;
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        LENGHT_SNAKE : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
        DECODE_CODE : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        PB_D, PB_G, PB_H, PB_B : IN STD_LOGIC;
        IS_SNAKE, END_GAME : OUT STD_LOGIC;
        X_SNAKE, Y_SNAKE : OUT INTEGER
    );
END snake_move;

ARCHITECTURE rtl OF snake_move IS

    TYPE IntArray IS ARRAY (NATURAL RANGE <>) OF INTEGER;
    CONSTANT SNAKE_SIZE : INTEGER := 20; -- Taille du serpent 
    CONSTANT SCREEN_WIDTH : INTEGER := 640; -- largeur de l'écran en pixels
    CONSTANT SCREEN_HEIGHT : INTEGER := 480; -- hauteur de l'écran en pixels 
    CONSTANT MAX_SNAKE_LENGHT : INTEGER := 50;

    SIGNAL xSnake, ySnake : IntArray(0 TO 50); -- Position du corps du serpent
    SIGNAL xDirSnake : INTEGER := 1; -- L'orientation de la tête du serpent
    SIGNAL yDirSnake : INTEGER := 0;
    SIGNAL snake_life : STD_LOGIC := '0'; -- Si serpent en vie 0 ou pas 1
    SIGNAL prev_PBG, prev_PBD, prev_PBB, prev_PBH : STD_LOGIC := '0'; -- Sens de déplacement du serpent
    SIGNAL delay : INTEGER := 0; -- La vitesse du serpent max
    SIGNAL count : INTEGER := 0; -- Compteur pour la vitesse du serpent

BEGIN

    PROCESS (SNAKE_CLK, RST, FRAME, xSnake, ySnake, HCOUNT, VCOUNT, LENGHT_SNAKE, DECODE_CODE, PB_D, PB_G, PB_H, PB_B)
    BEGIN
        IF (RST = '1') THEN
            xSnake(0) <= SCREEN_WIDTH/2;
            ySnake(0) <= SCREEN_HEIGHT/2;
            FOR i IN 1 TO MAX_SNAKE_LENGHT - 1 LOOP
                xSnake(i) <= - 10;
                ySnake(i) <= - 10;
            END LOOP;
            xDirSnake <= 1;
            yDirSnake <= 0;
            delay <= 12;
            count <= 0;
            prev_PBG <= '0';
            prev_PBD <= '0';
            prev_PBH <= '0';
            prev_PBB <= '0';
            snake_life <= '0';
            IS_SNAKE <= '0';
        ELSIF (SNAKE_CLK'event AND SNAKE_CLK = '1') THEN
            IF (FRAME = '1') THEN

                -- Mise à jour de la position de la tête du serpent
                IF (((PB_D = '1' AND prev_PBD = '0') OR DECODE_CODE = "1000") AND xDirSnake /= - 1) THEN -- On vérifie que le serpent ne puisse pas aller dans le sens opposé
                    xDirSnake <= 1;
                    yDirSnake <= 0;
                ELSIF (((PB_G = '1' AND prev_PBG = '0') OR DECODE_CODE = "0110") AND xDirSnake /= 1) THEN
                    xDirSnake <= - 1;
                    yDirSnake <= 0;
                ELSIF (((PB_H = '1' AND prev_PBH = '0') OR DECODE_CODE = "0101") AND yDirSnake /= 1) THEN
                    yDirSnake <= - 1;
                    xDirSnake <= 0;
                ELSIF (((PB_B = '1' AND prev_PBB = '0') OR DECODE_CODE = "0111") AND yDirSnake /= - 1) THEN
                    yDirSnake <= 1;
                    xDirSnake <= 0;
                END IF;

                -- Le serpent avance en continue en fonction de l'orientation qu'on lui a donné                
                count <= count + 1;
                IF (count >= delay) THEN
                    FOR i IN 1 TO MAX_SNAKE_LENGHT - 1 LOOP
                        IF (i <= LENGHT_SNAKE) THEN
                            xSnake(i) <= xSnake(i - 1);
                            ySnake(i) <= ySnake(i - 1);
                            -- Gérer quand la tête touche le corps
                            -- IF (xSnake(0) >= xSnake(i) - SNAKE_SIZE/2) AND (xSnake(0) < xSnake(i) + SNAKE_SIZE/2) AND
                            --     (ySnake(0) >= ySnake(i) - SNAKE_SIZE/2) AND (ySnake(0) < ySnake(i) + SNAKE_SIZE/2) THEN
                            --     snake_life <= '1';
                            -- END IF;
                        END IF;
                    END LOOP;
                    xSnake(0) <= xSnake(0) + SNAKE_SIZE * xDirSnake;
                    ySnake(0) <= ySnake(0) + SNAKE_SIZE * yDirSnake;
                    count <= 0;
                END IF;

                -- Gérer la sortie de l'écran
                IF (xSnake(0) < SNAKE_SIZE/2 OR xSnake(0) > SCREEN_WIDTH - SNAKE_SIZE/2
                    OR ySnake(0) < SNAKE_SIZE/2 OR ySnake(0) > SCREEN_HEIGHT - SNAKE_SIZE/2) THEN
                    snake_life <= '1';
                END IF;

                prev_PBG <= PB_G;
                prev_PBD <= PB_D;
                prev_PBH <= PB_H;
                prev_PBB <= PB_B;
            END IF;
        END IF;

        -- Gérer si on est sur une partie du corps du serpent
        FOR i IN 0 TO MAX_SNAKE_LENGHT - 1 LOOP
            IF (i <= LENGHT_SNAKE) THEN
                IF (HCOUNT > xSnake(i) - SNAKE_SIZE/2 AND HCOUNT < xSnake(i) + SNAKE_SIZE/2) AND
                    (VCOUNT > ySnake(i) - SNAKE_SIZE/2 AND VCOUNT < ySnake(i) + SNAKE_SIZE/2) THEN
                    IS_SNAKE <= '1';
                END IF;
            END IF;
        END LOOP;
    END PROCESS;

    END_GAME <= snake_life;
    X_SNAKE <= xSnake(0);
    Y_SNAKE <= ySnake(0);
END rtl;
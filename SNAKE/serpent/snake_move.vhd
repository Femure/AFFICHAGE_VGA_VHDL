LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY snake_move IS
    PORT (
        SNAKE_CLK, RST, FRAME : IN STD_LOGIC;
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        PB_D, PB_G, PB_H, PB_B : IN STD_LOGIC;
        IS_SNAKE, SNAKE_LOSE : OUT STD_LOGIC;
        X_SNAKE, Y_SNAKE : OUT INTEGER
    );
END snake_move;

ARCHITECTURE rtl OF snake_move IS
    CONSTANT SNAKE_SIZE : INTEGER := 10; -- Taille du serpent 
    CONSTANT SCREEN_WIDTH : INTEGER := 640; -- largeur de l'écran en pixels
    CONSTANT SCREEN_HEIGHT : INTEGER := 480; -- hauteur de l'écran en pixels 
    CONSTANT SNAKE_POSITION : INTEGER := 20; --- position initial du snake

    SIGNAL xSnake : INTEGER := SCREEN_WIDTH/2; -- Position de la tête du serpent
    SIGNAL ySnake : INTEGER := SCREEN_HEIGHT/2;
    SIGNAL xDirSnake : INTEGER := 1; -- L'orientation de la tête du serpent
    SIGNAL yDirSnake : INTEGER := 0;
    SIGNAL snake_life : STD_LOGIC := '0'; -- Si serpent en vie 0 ou pas 1
    SIGNAL prev_PBG, prev_PBD, prev_PBB, prev_PBH : STD_LOGIC := '0'; -- Sens de déplacement du serpent

BEGIN

    PROCESS (SNAKE_CLK, RST, FRAME, HCOUNT, VCOUNT)
    BEGIN
        IF (RST = '1') THEN
            xSnake <= SCREEN_WIDTH/2;
            ySnake <= SCREEN_HEIGHT/2;
            xDirSnake <= 1;
            yDirSnake <= 0;
            prev_PBG <= '0';
            prev_PBD <= '0';
            prev_PBH <= '0';
            prev_PBB <= '0';
            snake_life <= '0';
        ELSIF (snake_life = '1') THEN
            snake_life <= '0';
            xSnake <= SCREEN_WIDTH/2;
            ySnake <= SCREEN_HEIGHT/2;
            xDirSnake <= 1;
            yDirSnake <= 0;
            prev_PBG <= '0';
            prev_PBD <= '0';
            prev_PBH <= '0';
            prev_PBB <= '0';
        ELSIF (SNAKE_CLK'event AND SNAKE_CLK = '1') THEN
            IF (FRAME = '1') THEN
                -- Mise à jour de la position de la tête du serpent
                IF (PB_D = '1' AND prev_PBD = '0' AND xDirSnake /= -1) THEN -- On vérifie que le serpent ne puisse pas aller dans le sens opposé
                    xDirSnake <= 1;
                    yDirSnake <= 0;
                ELSIF (PB_G = '1' AND prev_PBG = '0' AND xDirSnake /= 1) THEN
                    xDirSnake <= - 1;
                    yDirSnake <= 0;
                ELSIF (PB_H = '1' AND prev_PBH = '0' AND yDirSnake /= 1) THEN
                    yDirSnake <= - 1;
                    xDirSnake <= 0;
                ELSIF (PB_B = '1' AND prev_PBB = '0' AND yDirSnake /= -1) THEN
                    yDirSnake <= 1;
                    xDirSnake <= 0;
                END IF;

                -- Le serpent avance en continue en fonction de l'orientation qu'on lui a donné
                xSnake <= xSnake + 2 * xDirSnake;
                ySnake <= ySnake + 2 * yDirSnake;

                -- Gérer la sortie de l'écran
                IF (xSnake < SNAKE_SIZE/2 OR xSnake > SCREEN_WIDTH - SNAKE_SIZE/2
                    OR ySnake < SNAKE_SIZE/2 OR ySnake > SCREEN_HEIGHT - SNAKE_SIZE/2) THEN
                    snake_life <= '1';
                END IF;
                prev_PBG <= PB_G;
                prev_PBD <= PB_D;
                prev_PBH <= PB_H;
                prev_PBB <= PB_B;
            END IF;
        END IF;
    END PROCESS;

    IS_SNAKE <= '1' WHEN (HCOUNT >= xSnake - SNAKE_SIZE/2 AND HCOUNT < xSnake + SNAKE_SIZE/2) AND
        (VCOUNT >= ySnake - SNAKE_SIZE/2 AND VCOUNT < ySnake + SNAKE_SIZE/2) ELSE
        '0';
    SNAKE_LOSE <= snake_life;
    X_SNAKE <= xSnake;
    Y_SNAKE <= ySnake;
END rtl;
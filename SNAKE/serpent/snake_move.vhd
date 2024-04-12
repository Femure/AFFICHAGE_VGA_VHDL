LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY snake_move IS
    PORT (
        CLK, RST, FRAME : IN STD_LOGIC;
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        IS_SNAKE, SNAKE_LOSE : OUT STD_LOGIC
    );
END snake_move;

ARCHITECTURE rtl OF snake_move IS
    CONSTANT SNAKE_SIZE : INTEGER := 10; -- Taille du serpent 
    CONSTANT SCREEN_WIDTH : INTEGER := 640; -- largeur de l'écran en pixels
    CONSTANT SCREEN_HEIGHT : INTEGER := 480; -- hauteur de l'écran en pixels 
    CONSTANT SNAKE_POSITION : INTEGER := 20; --- position initial du snake

    SIGNAL xSnake, ySnake : INTEGER; -- Position de la tête du serpent
    SIGNAL dirX, dirY : INTEGER := 0; -- Direction du serpent 
    SIGNAL snake_life : STD_LOGIC := '0';

BEGIN

    PROCESS (CLK, RST, FRAME, HCOUNT, VCOUNT)
    BEGIN
        IF (RST = '1') THEN
            xSnake <= SCREEN_WIDTH/2;
            ySnake <= SCREEN_HEIGHT/2;
            dirX <= 0; -- Initial direction to the right
            dirY <= 0; -- No vertical movement initially
        ELSIF (CLK'event AND CLK = '1') THEN
            IF (FRAME = '1') THEN
                -- Mise à jour de la position de la tête du serpent
                IF (dirX /= 0) THEN
                    dirY <= 0;
                    xSnake <= xSnake + dirX * SNAKE_SIZE;
                END IF;
                IF (dirY /= 0) THEN
                    dirX <= 0;
                    ySnake <= ySnake + dirY * SNAKE_SIZE;
                END IF;
                -- Gérer la sortie de l'écran
                IF (xSnake < SNAKE_SIZE/2 OR xSnake > SCREEN_WIDTH - SNAKE_SIZE/2
                    OR ySnake < SNAKE_SIZE/2 OR ySnake > SCREEN_HEIGHT - SNAKE_SIZE/2) THEN
                    xSnake <= SNAKE_POSITION; -- rénitialisationa à 0
                    ySnake <= SNAKE_POSITION;
                    snake_life <= '1';
                END IF;
            END IF;
        END IF;
    END PROCESS;

    IS_SNAKE <= '1' WHEN (HCOUNT >= xSnake - SNAKE_SIZE/2 AND HCOUNT < xSnake + SNAKE_SIZE/2) AND
        (VCOUNT >= ySnake - SNAKE_SIZE/2 AND VCOUNT < ySnake + SNAKE_SIZE/2) ELSE
        '0';
    SNAKE_LOSE <= snake_life;
END rtl;
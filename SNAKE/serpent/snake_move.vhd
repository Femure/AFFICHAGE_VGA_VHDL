LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY snake_move IS
    PORT (
        SNAKE_CLK, RST, FRAME : IN STD_LOGIC;
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        PB_Droite, PB_Gauche, PB_Haut, PB_Bas : IN STD_LOGIC;
        IS_SNAKE, SNAKE_LOSE : OUT STD_LOGIC;
        X_SNAKE, Y_SNAKE : OUT INTEGER
    );
END snake_move;

ARCHITECTURE rtl OF snake_move IS
    CONSTANT SNAKE_SIZE : INTEGER := 10; -- Taille du serpent 
    CONSTANT SCREEN_WIDTH : INTEGER := 640; -- largeur de l'écran en pixels
    CONSTANT SCREEN_HEIGHT : INTEGER := 480; -- hauteur de l'écran en pixels 
    CONSTANT SNAKE_POSITION : INTEGER := 20; --- position initial du snake

    SIGNAL xSnake, ySnake : INTEGER; -- Position de la tête du serpent
    SIGNAL snake_life : STD_LOGIC := '0'; -- Si serpent en vie 0 ou pas 1
    SIGNAL prev_PBG, prev_PBD, prev_PBB, prev_PBH : STD_LOGIC; -- Sens de déplacement du serpent

BEGIN

    PROCESS (SNAKE_CLK, RST, FRAME, HCOUNT, VCOUNT)
    BEGIN
        IF (RST = '1') THEN
            xSnake <= SCREEN_WIDTH/2;
            ySnake <= SCREEN_HEIGHT/2;
            prev_PBG <= '0';
            prev_PBD <= '0';
            prev_PBH <= '0';
            prev_PBB <= '0';
        ELSIF (SNAKE_CLK'event AND SNAKE_CLK = '1') THEN
            IF (FRAME = '1') THEN
                -- Mise à jour de la position de la tête du serpent
                IF (PB_Droite = '1' AND prev_PBD = '0') THEN
                    xSnake <= xSnake + SNAKE_SIZE;
                END IF;
                IF (PB_Gauche = '1' AND prev_PBG = '0') THEN
                    xSnake <= xSnake - SNAKE_SIZE;
                END IF;
                IF (PB_Haut = '1' AND prev_PBH = '0') THEN
                    ySnake <= ySnake - SNAKE_SIZE;
                END IF;
                IF (PB_Bas = '1' AND prev_PBB = '0') THEN
                    ySnake <= ySnake + SNAKE_SIZE;
                END IF;
                -- Gérer la sortie de l'écran
                IF (xSnake < SNAKE_SIZE/2 OR xSnake > SCREEN_WIDTH - SNAKE_SIZE/2
                    OR ySnake < SNAKE_SIZE/2 OR ySnake > SCREEN_HEIGHT - SNAKE_SIZE/2) THEN
                    xSnake <= SNAKE_POSITION; -- rénitialisationa à 0
                    ySnake <= SNAKE_POSITION;
                    snake_life <= '1';
                END IF;
                prev_PBG <= PB_Gauche;
                prev_PBD <= PB_Droite;
                prev_PBH <= PB_Haut;
                prev_PBB <= PB_Bas;
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
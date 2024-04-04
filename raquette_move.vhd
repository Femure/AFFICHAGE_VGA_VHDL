LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY raquette_move IS
    GENERIC (
        raquette_width : INTEGER := 10;       -- taille du carré  en pixels
		raquette_height : INTEGER := 50;       -- taille du carré  en pixels
        hscreen_width : INTEGER := 640;   -- largeur de l'écran en pixels
        vscreen_width : INTEGER := 480    -- hauteur de l'écran en pixels
    );
    PORT (
        CLK, RST, FRAME : IN STD_LOGIC;
        x, y : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        inRaquette : OUT STD_LOGIC
    );
END raquette_move;

ARCHITECTURE rtl OF raquette_move IS
    SIGNAL x_raquette,y_raquette : INTEGER;     -- position de la balle
    SIGNAL dir_y_raquette : INTEGER := 2; -- direction de la balle

BEGIN
    -- Calcul de la position 
    PROCESS (CLK, RST)
    BEGIN
    IF RST = '0' THEN  
            x_raquette <= 20;
            y_raquette <= hscreen_width/2;
            dir_y_raquette <= 10;
		

		elsif (CLK'event AND CLK = '1') THEN
			IF (FRAME='1') THEN
			    y_raquette<=y_raquette+dir_y_raquette;
			ELSIF y_raquette > vscreen_width - raquette_width / 2 THEN  -- rebond sur bord bas
				  dir_y_raquette <= dir_y_raquette * (-1);	              
			ELSIF y_raquette < raquette_width / 2 THEN             -- rebond sur bord haut
				  dir_y_raquette <= dir_y_raquette * (-1);
			END IF;
        END IF;
    END PROCESS;
	
    inRaquette <= '1' WHEN (x > x_raquette - raquette_width / 2) AND (x < x_raquette + raquette_width / 2)
                   AND (y > y_raquette - raquette_width / 2) AND (y < y_raquette + raquette_width / 2)
              ELSE '0';
END rtl;

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY pong_terrain IS
    PORT (
        RST, BLANK : IN STD_LOGIC;
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        RED, GREEN, BLUE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END pong_terrain;

ARCHITECTURE rtl OF pong_terrain IS
    CONSTANT hpixels : INTEGER := 640; -- nombre de pixels par ligne
	CONSTANT ypixels : INTEGER := 480; -- nombre de pixels par ligne
	VARIABLE incrementation_ligne_terrain : INTEGER := 1;
BEGIN
    PROCESS (RST, BLANK, HCOUNT, VCOUNT)
    BEGIN
        IF (RST = '1') THEN
            RED <= (OTHERS => '0');
            GREEN <= (OTHERS => '0');
            BLUE <= (OTHERS => '0');
        ELSE
            IF (BLANK = '1') THEN -- blanking = pas d'affichage 
                if(HCOUNT<hpixels/2-5 AND HCOUNT>hpixels/2+5) THEN
                    RED <= '1111';
                    GREEN <= '1111';
                    BLUE <= '1111';
                ELSE 
                    RED <= (OTHERS => '0');
                    GREEN <= (OTHERS => '0');
                    BLUE <= (OTHERS => '0');
                end if;  -- Ajout de la parenthèse manquante
            END IF;
        END IF;
    END PROCESS;
END rtl;

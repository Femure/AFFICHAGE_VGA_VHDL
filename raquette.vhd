LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY raquette IS
    PORT (
        RST, BLANK,inRaquette : IN STD_LOGIC;
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        RED, GREEN, BLUE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END raquette;

ARCHITECTURE rtl OF raquette IS
    CONSTANT hpixels : INTEGER := 640; -- nombre de pixels par ligne
    CONSTANT ypixels : INTEGER := 480; -- nombre de pixels par ligne
	
BEGIN
    PROCESS (RST, BLANK, HCOUNT, VCOUNT)
    BEGIN
        IF (RST = '1') THEN
            RED <= (OTHERS => '0');
            GREEN <= (OTHERS => '0');
            BLUE <= (OTHERS => '0');
        ELSIF (BLANK = '1') THEN -- blanking = pas d'affichage 
            IF(inRaquette='1') THEN
				RED <= "1111";
				GREEN <= "1111";
				BLUE <= "1111";
			ELSE
				RED <= "0000";
				GREEN <= "0000";
				BLUE <= "0000";
			 END IF;
        END IF;
    END PROCESS;
END rtl;


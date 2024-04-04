LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY image IS
    PORT (
        RST, BLANK : IN STD_LOGIC;
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        RED, GREEN, BLUE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END image;

ARCHITECTURE rtl OF image IS
CONSTANT pixel_blank : INTEGER := 640; -- nombre de pixels par ligne
BEGIN
    PROCESS (RST, BLANK, HCOUNT, VCOUNT)
    BEGIN
        IF (RST = '1') THEN
            RED <= (OTHERS => '0');
            GREEN <= (OTHERS => '0');
            BLUE <= (OTHERS => '0');
        ELSE
            IF (BLANK = '1') THEN 
                IF (HCOUNT <= pixel_blank/3) THEN
                    BLUE <= "1111";
                    GREEN <= "0000";
                    RED <= "0000";
                ELSIF (HCOUNT <= 2*pixel_blank/3 AND HCOUNT >= pixel_blank/3) THEN
                    BLUE <= "1111";
                    GREEN <= "1111";
                    RED <= "1111";
                ELSE
                    RED <= "1111";
                    GREEN <= "0000";
                    BLUE <= "0000";
                END IF;
            ELSE
                RED <= "0000";
                GREEN <= "0000";
                BLUE <= "0000";
            END IF;
        END IF;
    END PROCESS;
END rtl;
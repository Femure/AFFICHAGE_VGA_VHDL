LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY image IS
    PORT (
        RST, BLANK : IN STD_LOGIC;
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        RED, GREEN, BLUE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END image;

ARCHITECTURE rtl OF image IS
BEGIN
    PROCESS (RST, BLANK, HCOUNT, VCOUNT)
    BEGIN
        IF (RST = '1') THEN
            RED <= (OTHERS => '0');
            GREEN <= (OTHERS => '0');
            BLUE <= (OTHERS => '0');
        ELSE
            IF (BLANK = '1') THEN
                RED <= "1111";
            ELSE
                RED <= "0000";
            END IF;
        END IF;
    END PROCESS;
END rtl;
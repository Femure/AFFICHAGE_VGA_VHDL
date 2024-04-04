LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY div_6MHz IS
    PORT (
        CLK, RST : IN STD_LOGIC;
        BALLE_CLK : OUT STD_LOGIC
    );
END div_6MHz;

ARCHITECTURE rtl OF div_6MHz IS
    SIGNAL cnt : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
    PROCESS (CLK, RST)
    BEGIN
        IF (RST = '1') THEN
            cnt <= (OTHERS => '0');
        ELSIF (CLK'event AND CLK = '1') THEN 
        BALLE_CLK <= cnt(1);
            IF (cnt = "1111") THEN
                cnt <= (OTHERS => '0');
            ELSE
                cnt <= cnt + 1;
            END IF;
        END IF;

    END PROCESS;
END rtl;
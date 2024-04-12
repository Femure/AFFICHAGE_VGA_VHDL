LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY balle_clk IS
    PORT (
        CLK, RST : IN STD_LOGIC;
        BALLE_CLK : OUT STD_LOGIC
    );
END balle_clk;

ARCHITECTURE rtl OF balle_clk IS
    SIGNAL cnt : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
    PROCESS (CLK, RST)
    BEGIN
        IF (RST = '1') THEN
            cnt <= (OTHERS => '0');
        ELSIF (CLK'event AND CLK = '1') THEN
            BALLE_CLK <= cnt(1);
            IF (cnt = "111") THEN
                cnt <= (OTHERS => '0');
            ELSE
                cnt <= cnt + 1;
            END IF;
        END IF;

    END PROCESS;
END rtl;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY snake_clk IS
    PORT (
        CLK, RST : IN STD_LOGIC;
        SNAKE_CLK : OUT STD_LOGIC
    );
END snake_clk ;

ARCHITECTURE rtl OF snake_clk  IS
    SIGNAL cnt : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
    PROCESS (CLK, RST)
    BEGIN
        IF (RST = '1') THEN
            cnt <= (OTHERS => '0');
        ELSIF (CLK'event AND CLK = '1') THEN
            SNAKE_CLK <= cnt(1);
            IF (cnt = "11") THEN
                cnt <= (OTHERS => '0');
            ELSE
                cnt <= cnt + 1;
            END IF;
        END IF;

    END PROCESS;
END rtl;
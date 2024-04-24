LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY clk_food IS
    PORT (
        CLK, RST : IN STD_LOGIC;
        FOOD_CLK : OUT STD_LOGIC
    );
END clk_food;

ARCHITECTURE rtl OF clk_food IS
    SIGNAL cnt : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
    PROCESS (CLK, RST)
    BEGIN
        IF (RST = '1') THEN
            cnt <= (OTHERS => '0');
        ELSIF (CLK'event AND CLK = '1') THEN
            FOOD_CLK <= cnt(1);
            IF (cnt = "111") THEN
                cnt <= (OTHERS => '0');
            ELSE
                cnt <= cnt + 1;
            END IF;
        END IF;

    END PROCESS;
END rtl;
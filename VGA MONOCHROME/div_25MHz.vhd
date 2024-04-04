LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY div_25MHz IS
    PORT (
        CLK, RST : IN STD_LOGIC;
        PIXEL_CLK : OUT STD_LOGIC
    );
END div_25MHz;

ARCHITECTURE rtl OF div_25MHz IS
    SIGNAL cnt : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
    PROCESS (CLK, RST)
    BEGIN
        IF (RST = '1') THEN
            cnt <= (OTHERS => '0');
        ELSIF (CLK'event AND CLK = '1') THEN --  25 MHz => 40 ns et CLK 100MHz => 10 ns soit 4
            PIXEL_CLK <= cnt(1);
            IF (cnt = "11") THEN
                cnt <= (OTHERS => '0');
            ELSE
                cnt <= cnt + 1;
            END IF;
        END IF;

    END PROCESS;
END rtl;
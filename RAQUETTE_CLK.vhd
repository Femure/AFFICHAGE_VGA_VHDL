LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY RAQUETTE_CLK IS
    PORT (
        CLK, RST : IN STD_LOGIC;
        raquette_CLK : OUT STD_LOGIC
    );
END RAQUETTE_CLK;

ARCHITECTURE rtl OF RAQUETTE_CLK IS
    SIGNAL cnt : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
    PROCESS (CLK, RST)
    BEGIN
        IF RST = '1' THEN
            cnt <= (OTHERS => '0');
        ELSIF (CLK'event AND CLK = '1') THEN
            IF cnt = "0111" THEN   --  148.5 MHz => 6.7 ns et CLK 450 => 2.2222 ns soit 3
                raquette_CLK <= '1';
                cnt <= (OTHERS => '0');
            ELSE
                raquette_CLK <= '0';
                cnt <= cnt + 1;
            END IF;
        END IF;

    END PROCESS;
END rtl;
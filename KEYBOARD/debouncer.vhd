LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY debouncer IS
    PORT (
        RST, CLK : IN STD_LOGIC;
        I : IN STD_LOGIC;
        O : OUT STD_LOGIC
    );
END debouncer;

ARCHITECTURE rtl OF debouncer IS
    SIGNAL count : STD_LOGIC_VECTOR(4 DOWNTO 0) := (OTHERS => '0');
    SIGNAL Iv : STD_LOGIC := '0';
BEGIN
    PROCESS (RST, CLK)
    BEGIN
        IF (RST = '1') THEN
            count <= (OTHERS => '0');
            Iv <= '0';
            O <= '0';
        ELSIF (CLK'event AND CLK = '1') THEN
            IF (I = Iv) THEN
                IF (count = 19) THEN
                    O <= I;
                ELSE
                    count <= count + 1;
                END IF;
            ELSE
                count <= (OTHERS => '0');
                Iv <= I;
            END IF;
        END IF;
    END PROCESS;
END rtl;
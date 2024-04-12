LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY cnt_rand IS
    PORT (
        CLK, RST : IN STD_LOGIC;
        RAND_OUT : OUT INTEGER
    );
END cnt_rand;

ARCHITECTURE rtl OF cnt_rand IS
    SIGNAL lfsr_out : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
    -- LFSR pour générer un nombre pseudo-aléatoire
    PROCESS (CLK, RST)
    BEGIN
        IF (RST = '1') THEN
            lfsr_out <= (OTHERS => '0');
        ELSIF (CLK'event AND CLK = '1') THEN
            lfsr_out <= lfsr_out(6 DOWNTO 0) & (lfsr_out(7) XOR lfsr_out(2)); -- Polynôme de LFSR à 8 bits
        END IF;
    END PROCESS;

    RAND_OUT <= TO_INTEGER(IEEE.NUMERIC_STD.UNSIGNED(lfsr_out));
END rtl;
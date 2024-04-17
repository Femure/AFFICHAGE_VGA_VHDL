LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY cmpt_gestion_corps IS
    PORT (
        CLK : IN STD_LOGIC;
        RST : IN STD_LOGIC;
        FLAG : IN STD_LOGIC;
        SCORE : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
END cmpt_gestion_corps;

ARCHITECTURE rtl OF cmpt_gestion_corps IS
    SIGNAL point : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0'); 
BEGIN
    PROCESS (CLK, RST)
    BEGIN
        IF (RST = '1') THEN
            point <= (OTHERS => '0');
        ELSIF (CLK'event AND CLK = '1') THEN 
            IF (FLAG = '1') THEN
                point <= point + '1';
            END IF;
        END IF;
    END PROCESS;

    SCORE <= point;
END rtl;
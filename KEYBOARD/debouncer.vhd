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
    SIGNAL Iv : STD_LOGIC := '0'; -- Dernière valeur d'entrée
BEGIN
    PROCESS (RST, CLK)
    BEGIN
        IF (RST = '1') THEN 
            count <= (OTHERS => '0'); 
            Iv <= '0';
            O <= '0';
        ELSIF (CLK'event AND CLK = '1') THEN
            IF (I = Iv) THEN -- Si l'entrée est la même que la dernière valeur d'entrée
                IF (count = 19) THEN -- Si le compteur atteint 19 (environ 20 cycles d'horloge)
                    O <= I; -- Sortie égale à l'entrée
                ELSE
                    count <= count + 1;
                END IF;
            ELSE -- Si l'entrée est différente de la dernière valeur d'entrée
                count <= (OTHERS => '0');
                Iv <= I; 
            END IF;
        END IF;
    END PROCESS;
END rtl;
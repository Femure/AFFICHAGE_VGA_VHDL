LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ps2_controller IS
    PORT (
        RST, CLK, PS2_CLK_INT : IN STD_LOGIC;
        ERROR : IN STD_LOGIC;
        KEYCODE : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        PS2_CODE : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        PS2_CODE_FLAG : OUT STD_LOGIC
    );
END ps2_controller;

ARCHITECTURE rtl OF ps2_controller IS
    CONSTANT clk_freq : INTEGER := 100_000_000;
    SIGNAL count_idle : INTEGER RANGE 0 TO clk_freq/18_000; -- compteur pour déterminer si PS/2 est inactif
    SIGNAL temp_ps2_code : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL temp_ps2_flag : STD_LOGIC := '0';
BEGIN
    PROCESS (RST, CLK)
    BEGIN
        IF (RST = '1') THEN
            count_idle <= 0;
            temp_ps2_flag <= '0';
            temp_ps2_code <= (OTHERS => '0');
        ELSIF (CLK'EVENT AND CLK = '1') THEN 
            IF (PS2_CLK_INT = '0') THEN 
                count_idle <= 0; 
            ELSIF (count_idle /= clk_freq/18_000) THEN -- l'horloge PS2 est restée haute moins d'une demi-période d'horloge (<55us)
                count_idle <= count_idle + 1; 
            END IF;

            IF (count_idle = clk_freq/18_000 AND ERROR = '0') THEN -- seuil d'inactivité atteint et aucune erreur détectée
                temp_ps2_flag <= '1'; -- définir le drapeau indiquant qu'un nouveau code PS/2 est disponible
                temp_ps2_code <= KEYCODE; -- sortie du nouveau code PS/2
            ELSE -- port PS/2 actif ou erreur détectée
                temp_ps2_flag <= '0'; -- définir le drapeau indiquant qu'une transaction PS/2 est en cours
            END IF;
        END IF;
    END PROCESS;
    PS2_CODE <= temp_ps2_code;
    PS2_CODE_FLAG <= temp_ps2_flag;
END rtl;
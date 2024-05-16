LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY cnt_lenght_snake IS
    PORT (
        CLK, RST, FLAG : IN STD_LOGIC;
        LENGHT_SNAKE : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END cnt_lenght_snake;

ARCHITECTURE rtl OF cnt_lenght_snake IS
    SIGNAL lenght : STD_LOGIC_VECTOR(6 DOWNTO 0); -- Longueur du serpent qui correspond également au nombre de cube mangé
    SIGNAL prev_flag : STD_LOGIC := '0';
BEGIN
    PROCESS (CLK, RST, FLAG)
    BEGIN
        IF (RST = '1') THEN
            lenght <= (OTHERS => '0');
            prev_flag <= '0';
        ELSIF (CLK'event AND CLK = '1') THEN
            IF (FLAG = '1' AND prev_flag = '0') THEN
                lenght <= lenght + 1;
            END IF;
            prev_flag <= FLAG;
        END IF;
    END PROCESS;

    LENGHT_SNAKE <= lenght;
END rtl;
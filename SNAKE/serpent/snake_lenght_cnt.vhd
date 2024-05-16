LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY snake_lenght_cnt IS
    PORT (
        FRAME, RST, FLAG : IN STD_LOGIC;
        LENGHT_SNAKE : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END snake_lenght_cnt;

ARCHITECTURE rtl OF snake_lenght_cnt IS
    SIGNAL lenght : STD_LOGIC_VECTOR(6 DOWNTO 0); -- Longueur du serpent qui correspond également au nombre de cube mangé
    SIGNAL prev_flag : STD_LOGIC := '0';
BEGIN
    PROCESS (FRAME, RST, FLAG)
    BEGIN
        IF (RST = '1') THEN
            lenght <= (OTHERS => '0');
            prev_flag <= '0';
        ELSIF (FRAME'event AND FRAME = '1') THEN
            IF (FLAG = '1' AND prev_flag = '0') THEN
                lenght <= lenght + 1;
            END IF;
            prev_flag <= FLAG;
        END IF;
    END PROCESS;

    LENGHT_SNAKE <= lenght;
END rtl;
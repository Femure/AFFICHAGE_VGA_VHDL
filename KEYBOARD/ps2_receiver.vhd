LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ps2_receiver IS
    PORT (
        RST, PS2_CLK_INT, PS2_DATA_INT : IN STD_LOGIC;
        KEYCODE : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        ERROR : OUT STD_LOGIC
    );
END ps2_receiver;

ARCHITECTURE rtl OF ps2_receiver IS
    SIGNAL ps2_word : STD_LOGIC_VECTOR(10 DOWNTO 0) := (OTHERS => '1'); -- bits qui enregistrent les données PS2
BEGIN
    PROCESS (RST, PS2_CLK_INT)
    BEGIN
        IF (RST = '1') THEN
            ps2_word <= (OTHERS => '0');
        ELSIF (PS2_CLK_INT'EVENT AND PS2_CLK_INT = '0') THEN -- front descendant de l'horloge PS2
            ps2_word <= PS2_DATA_INT & ps2_word(10 DOWNTO 1); -- enregistre le bit de donnée PS2
        END IF;
    END PROCESS;
    
    -- Vérifie que la parité, le bit de départ et les bits d'arrêt sont tous corrects
    ERROR <= NOT (NOT ps2_word(0) AND ps2_word(10) AND (ps2_word(9) XOR ps2_word(8) XOR
        ps2_word(7) XOR ps2_word(6) XOR ps2_word(5) XOR ps2_word(4) XOR ps2_word(3) XOR
        ps2_word(2) XOR ps2_word(1)));
    

    KEYCODE <= ps2_word(8 DOWNTO 1);

END rtl;
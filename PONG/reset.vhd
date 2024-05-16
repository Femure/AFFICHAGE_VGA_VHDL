LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY reset IS
    PORT (
        CLK, END_GAME, RST : IN STD_LOGIC;
        G_RESET : OUT STD_LOGIC
    );
END reset;

ARCHITECTURE rtl OF reset IS
BEGIN
    PROCESS (CLK, RST)
    BEGIN
        -- Gestion du reset généralisé en cas d'appuye sur le bouton reset ou de fin de partie
        IF (CLK'event AND CLK = '1') THEN
            G_RESET <= RST OR END_GAME;
        END IF;
    END PROCESS;
END rtl;
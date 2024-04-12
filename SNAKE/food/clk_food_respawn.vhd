LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY clk_food_respawn IS
    PORT (
        FRAME, RST : IN STD_LOGIC;
        CLK_RESPAWN : OUT STD_LOGIC
    );
END clk_food_respawn;

ARCHITECTURE rtl OF clk_food_respawn IS
    SIGNAL cnt : STD_LOGIC_VECTOR(20 DOWNTO 0);
BEGIN
    PROCESS (FRAME, RST)
    BEGIN
        IF (RST = '1') THEN
            cnt <= (OTHERS => '0');
        ELSIF (FRAME'event AND FRAME = '1') THEN
            IF (cnt = "10") THEN -- 10 secondes à 60 Hz 
                CLK_RESPAWN <= '1';
                cnt <= (OTHERS => '0');
            ELSE
                CLK_RESPAWN <= '0';
                cnt <= cnt + 1;
            END IF;
        END IF;
    END PROCESS;
END rtl;
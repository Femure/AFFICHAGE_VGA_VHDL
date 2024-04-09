LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY acc_balle_clk IS
    PORT (
        FRAME, RST : IN STD_LOGIC;
        ACC_BALLE : OUT STD_LOGIC
    );
END acc_balle_clk;

ARCHITECTURE rtl OF acc_balle_clk IS
    SIGNAL cnt : STD_LOGIC_VECTOR(20 DOWNTO 0);
BEGIN
    PROCESS (FRAME, RST)
    BEGIN
        IF (RST = '1') THEN
            cnt <= (OTHERS => '0');
        ELSIF (FRAME'event AND FRAME = '1') THEN
            IF (cnt = "1001011000") THEN -- 10 secondes à 60 Hz 
                ACC_BALLE <= '1';
                cnt <= (OTHERS => '0');
            ELSE
                ACC_BALLE <= '0';
                cnt <= cnt + 1;
            END IF;
        END IF;
    END PROCESS;
END rtl;
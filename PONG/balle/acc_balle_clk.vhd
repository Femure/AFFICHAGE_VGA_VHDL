LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY acc_balle_clk IS
    PORT (
        FRAME, RST : IN STD_LOGIC;
        J_WIN : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        ACC_BALLE : OUT STD_LOGIC
    );
END acc_balle_clk;

ARCHITECTURE rtl OF acc_balle_clk IS
    SIGNAL cnt : STD_LOGIC_VECTOR(20 DOWNTO 0);
BEGIN
    PROCESS (FRAME, RST, J_WIN)
    BEGIN
        IF (RST = '1' OR J_WIN > 0) THEN
            cnt <= (OTHERS => '0');
            ACC_BALLE <= '0';
        ELSIF (FRAME'event AND FRAME = '1') THEN
            IF (cnt = "1001011000") THEN --Toutes les 10 sec, on accelère la vitesse de la balle
                ACC_BALLE <= '1';
                cnt <= (OTHERS => '0');
            ELSE
                ACC_BALLE <= '0';
                cnt <= cnt + 1;
            END IF;
        END IF;
    END PROCESS;
END rtl;
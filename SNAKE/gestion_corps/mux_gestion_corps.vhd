LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY mux_gestion_corps IS
    PORT (
        SCORE : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        CORPS : OUT STD_LOGIC_VECTOR (10 DOWNTO 0)
    );
END mux_gestion_corps;

ARCHITECTURE rtl OF mux_gestion_corps IS
BEGIN
    PROCESS (SCORE)
    BEGIN
        CASE SCORE IS
            WHEN "0000" =>
                CORPS <= "10000000000";
            WHEN "0001" =>
                CORPS <= "11000000000";
            WHEN "0010" =>
                CORPS <= "11100000000";
            WHEN "0011" =>
                CORPS <= "11110000000";
            WHEN "0100" =>
                CORPS <= "11111000000";
            WHEN "0101" =>
                CORPS <= "11111100000";
            WHEN "0110" =>
                CORPS <= "11111110000";
            WHEN "0111" =>
                CORPS <= "11111111000";
            WHEN "1000" =>
                CORPS <= "11111111100";
            WHEN "1001" =>
                CORPS <= "11111111110";
            WHEN "1010" =>
                CORPS <= "11111111111";
            WHEN OTHERS =>
                NULL;
        END CASE;
    END PROCESS;
END rtl;
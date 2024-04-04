LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY mux_score IS
    PORT (
        CLK, RST : IN STD_LOGIC; -- Horloge pour la mise à jour des scores et le reset
        J_WIN : IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- Indique quel joueur a gagné
        J1_SCORE, J2_SCORE : OUT STD_LOGIC_VECTOR (2 DOWNTO 0) -- Le score du joueur 1 et 2
    );
END mux_score;

ARCHITECTURE rtl OF mux_score IS
    SIGNAL score_1, score_2 : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0'); -- Score du joueur 1 et 2
    SIGNAL prev_j1_win, prev_j2_win : STD_LOGIC := '0'; -- Score du joueur 1 et 2
BEGIN
    PROCESS (CLK, RST)
    BEGIN
        IF (RST = '1') THEN
            score_1 <= (OTHERS => '0');
            score_2 <= (OTHERS => '0');
            prev_j1_win <= '0';
            prev_j2_win <= '0';
        ELSIF (CLK'event AND CLK = '1') THEN
            IF (J_WIN(0) = '1' AND prev_j1_win = '0') THEN
                score_1 <= score_1 + 1;
            ELSIF (J_WIN(1) = '1' AND prev_j2_win = '0') THEN
                score_2 <= score_2 + 1;
            END IF;
            prev_j1_win <= J_WIN(0);
            prev_j2_win <= J_WIN(1);
        END IF;
    END PROCESS;

    J1_SCORE <= score_1;
    J2_SCORE <= score_2;
END rtl;
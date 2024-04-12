LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY mux_score IS
    PORT(
        CLK : IN std_logic;  -- Horloge pour la mise à jour des scores
        RST : IN std_logic;  -- Réinitialisation
        J_WIN : IN std_logic;  -- Indique quel joueur a gagné
        
        J_COUNT : OUT std_logic; -- Indique quel joueur a marqué
        S_COUNT_1 : OUT STD_LOGIC_VECTOR (2 DOWNTO 0); -- Le score du joueur1
        S_COUNT_2 : OUT STD_LOGIC_VECTOR (2 DOWNTO 0) -- Le score du joueur2
    );
END mux_score;

ARCHITECTURE rtl OF mux_score IS
    SIGNAL score_1 : STD_LOGIC_VECTOR(2 DOWNTO 0) := (others =>'0'); -- Score du joueur1
    SIGNAL score_2 : STD_LOGIC_VECTOR(2 DOWNTO 0) := (others =>'0'); -- Score du joueur2
BEGIN
    PROCESS(CLK, RST)
    BEGIN
        IF RST = '1' THEN
            score_1 <= (others =>'0');
            score_2 <= (others =>'0');
        ELSIF (CLK'event AND CLK = '1') THEN
            IF (J_WIN = '0') THEN
                score_1 <= score_1 + '1'; 
                J_COUNT <= '0'; 
            ELSIF (J_WIN = '1') THEN
                score_2 <= score_2 + '1'; 
                J_COUNT <= '1';
            END IF;
        END IF;
    END PROCESS;

    S_COUNT_1 <= score_1;
    S_COUNT_2 <= score_2;
END rtl;
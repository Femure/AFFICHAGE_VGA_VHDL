LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ps2_decode IS
    PORT (
        RST, CLK : IN STD_LOGIC;
        PS2_CLK : IN STD_LOGIC;
        PS2_DATA : IN STD_LOGIC;
        DECODE_FLAG : OUT STD_LOGIC;
        DECODE_CODE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) -- Valeur du décode issue du code PS2 
    );
END ps2_decode;

ARCHITECTURE rtl OF ps2_decode IS
    TYPE machine IS(ready, new_code, translate, output); --Création d'états pour définir notre machine à état
    SIGNAL state : machine;
    SIGNAL break : STD_LOGIC := '0'; --'1' pour le 'break code', '0' pour 'make code' => 'break code' lorsqu'on presse la touche, 'make code' lorsqu'on relache la touche
    SIGNAL decode : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');

    COMPONENT ps2_keyboard IS
        PORT (
            RST, CLK : IN STD_LOGIC;
            PS2_CLK : IN STD_LOGIC;
            PS2_DATA : IN STD_LOGIC;
            PS2_CODE_FLAG : OUT STD_LOGIC;
            PS2_CODE : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL ps2_code_flag : STD_LOGIC;
    SIGNAL ps2_code : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL prev_ps2_code_flag : STD_LOGIC := '1';

BEGIN

    -- Récupération de notre code PS2 afin de le décoder par la suite
    ps2_keyboard_0 : ps2_keyboard PORT MAP(RST => RST, CLK => CLK, PS2_CLK => PS2_CLK, PS2_DATA => PS2_DATA, PS2_CODE_FLAG => ps2_code_flag, PS2_CODE => ps2_code);

    PROCESS (RST, CLK)
    BEGIN
        IF (RST = '1') THEN
            state <= ready;
            break <= '0';
            decode <= (OTHERS => '0');
            prev_ps2_code_flag <= '1';
            DECODE_CODE <= (OTHERS => '0');
            DECODE_FLAG <= '0';
        ELSIF (CLK'EVENT AND CLK = '1') THEN
            prev_ps2_code_flag <= ps2_code_flag; -- Suivre les valeurs précédentes du drapeau ps2_code pour déterminer les transitions de bas en haut

            CASE state IS
                    -- Etat prêt : attendre qu'un nouveau code PS2 soit reçu
                WHEN ready =>
                    IF (prev_ps2_code_flag = '0' AND ps2_code_flag = '1') THEN -- Nouveau code PS2 reçu
                        DECODE_FLAG <= '0';
                        state <= new_code;
                    ELSE -- Aucun nouveau code PS2 reçu encore
                        state <= ready;
                    END IF;

                    -- Etat new_code : déterminer quoi faire avec le nouveau code PS2  
                WHEN new_code =>
                    IF (ps2_code = x"F0") THEN -- Le code indique que la prochaine commande est un 'break'
                        DECODE_CODE <= (OTHERS => '0');
                        break <= '1';
                        state <= ready; -- Retourner à l'état prêt pour attendre le prochain code PS2
                    ELSE -- Le code est le dernier code PS2 à décoder
                        state <= translate; -- Passer à l'état de traduction
                    END IF;

                    -- Etat de traduction : traduire le code PS2 en valeur DECODE
                WHEN translate =>

                    CASE ps2_code IS
                        WHEN x"75" => decode <= "0001"; -- FLÈCHE HAUT
                        WHEN x"72" => decode <= "0011"; -- FLÈCHE BAS
                        WHEN x"74" => decode <= "0100"; -- FLÈCHE DROITE
                        WHEN x"6B" => decode <= "0010"; -- FLÈCHE GAUCHE
                        WHEN x"1D" => decode <= "0101"; -- Z
                        WHEN x"1C" => decode <= "0110"; -- Q
                        WHEN x"1B" => decode <= "0111"; -- S
                        WHEN x"23" => decode <= "1000"; -- D
                        WHEN OTHERS => NULL;
                    END CASE;

                    IF (break = '0') THEN -- Considérer uniquement lorsqu'il s'agit d'un code 'make' (maintien d'une touche)
                        state <= output; -- Passer à l'état de sortie
                    ELSE
                        break <= '0'; -- Réinitialiser le drapeau de 'break'
                        state <= ready; -- Retourner à l'état prêt pour attendre le prochain code PS2
                    END IF;

                    -- Etat de sortie : transmettre la valeur DECODE
                WHEN output =>
                    DECODE_FLAG <= '1'; -- Définir le drapeau indiquant une nouvelle sortie DECODE
                    DECODE_CODE <= decode; -- Transmettre la valeur DECODE
                    state <= ready; -- Retourner à l'état prêt pour attendre le prochain code PS2

            END CASE;
        END IF;
    END PROCESS;

END rtl;
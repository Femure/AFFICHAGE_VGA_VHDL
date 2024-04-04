LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY image IS
    PORT (
        RST, BLANK : IN STD_LOGIC;
        HCOUNT, VCOUNT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        JCOUNT : IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- Quel joueur
        SCOUNT : IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- Cpt J1
        isNumber : OUT STD_LOGIC; -- Retour pour l'affichage 

    );
END image;

ARCHITECTURE rtl OF image IS
CONSTANT pixel_blank : INTEGER := 640; -- nombre de pixels par ligne
BEGIN
    PROCESS (RST, BLANK, HCOUNT, VCOUNT)
    BEGIN
        IF (RST = '1') THEN
            isNumber <= '0';
        ELSE
            IF (BLANK = '1') THEN
            case SCOUNT is
                when '000' =>
                    -- affichage de 0
                    if (HCOUNT <= pixel_blank/2 - 60 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 105 and VCOUNT >= 100)then -- segment A
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 65 and HCOUNT >= pixel_blank/2 - 60) and (VCOUNT <= 135 and VCOUNT >= 105)then -- segment B
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 65 and HCOUNT >= pixel_blank/2 - 60) and (VCOUNT <= 170 and VCOUNT >= 140)then -- segment C
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 60 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 175 and VCOUNT >= 170)then -- segment D
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 95 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 170 and VCOUNT >= 140)then -- segment E
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 95 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 135 and VCOUNT >= 105)then -- segment F
                    isNumber <= '1';
                    end if ;
                when '001' =>
                    -- affichage de 1
                    if (HCOUNT <= pixel_blank/2 - 65 and HCOUNT >= pixel_blank/2 - 60) and (VCOUNT <= 135 and VCOUNT >= 105)then -- segment B
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 65 and HCOUNT >= pixel_blank/2 - 60) and (VCOUNT <= 170 and VCOUNT >= 140)then -- segment C
                    isNumber <= '1';
                    end if ;
                when '010' =>
                    -- affichage de 2
                    if (HCOUNT <= pixel_blank/2 - 60 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 105 and VCOUNT >= 100)then -- segment A
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 65 and HCOUNT >= pixel_blank/2 - 60) and (VCOUNT <= 135 and VCOUNT >= 105)then -- segment B
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 60 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 175 and VCOUNT >= 170)then -- segment D
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 95 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 170 and VCOUNT >= 140)then -- segment E
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 60 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 140 and VCOUNT >= 135)then -- segment G
                    isNumber <= '1';
                    end if ;
                when '011' =>
                    -- affichage de 3
                    if (HCOUNT <= pixel_blank/2 - 60 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 105 and VCOUNT >= 100)then -- segment A
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 65 and HCOUNT >= pixel_blank/2 - 60) and (VCOUNT <= 135 and VCOUNT >= 105)then -- segment B
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 65 and HCOUNT >= pixel_blank/2 - 60) and (VCOUNT <= 170 and VCOUNT >= 140)then -- segment C
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 60 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 175 and VCOUNT >= 170)then -- segment D
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 60 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 140 and VCOUNT >= 135)then -- segment G
                    isNumber <= '1';
                    end if ;
                when '100' =>
                    -- affichage de 4
                    if (HCOUNT <= pixel_blank/2 - 65 and HCOUNT >= pixel_blank/2 - 60) and (VCOUNT <= 135 and VCOUNT >= 105)then -- segment B
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 65 and HCOUNT >= pixel_blank/2 - 60) and (VCOUNT <= 170 and VCOUNT >= 140)then -- segment C
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 95 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 135 and VCOUNT >= 105)then -- segment F
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 60 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 140 and VCOUNT >= 135)then -- segment G
                    isNumber <= '1';
                    end if ;
                when '101' =>
                    -- affichage de 5
                    if (HCOUNT <= pixel_blank/2 - 60 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 105 and VCOUNT >= 100)then -- segment A
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 65 and HCOUNT >= pixel_blank/2 - 60) and (VCOUNT <= 170 and VCOUNT >= 140)then -- segment C
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 60 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 175 and VCOUNT >= 170)then -- segment D
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 95 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 135 and VCOUNT >= 105)then -- segment F
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 60 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 140 and VCOUNT >= 135)then -- segment G
                    isNumber <= '1';
                    end if ;
                when others =>
                    -- affichage 7 segment

                    if (HCOUNT <= pixel_blank/2 - 60 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 105 and VCOUNT >= 100)then -- segment A
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 65 and HCOUNT >= pixel_blank/2 - 60) and (VCOUNT <= 135 and VCOUNT >= 105)then -- segment B
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 65 and HCOUNT >= pixel_blank/2 - 60) and (VCOUNT <= 170 and VCOUNT >= 140)then -- segment C
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 60 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 175 and VCOUNT >= 170)then -- segment D
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 95 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 170 and VCOUNT >= 140)then -- segment E
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 95 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 135 and VCOUNT >= 105)then -- segment F
                    isNumber <= '1';
                    elsif (HCOUNT <= pixel_blank/2 - 60 and HCOUNT >= pixel_blank/2 - 90) and (VCOUNT <= 140 and VCOUNT >= 135)then -- segment G
                    isNumber <= '1';
                    end if ;

            end case;
                
            ELSE
                isNumber <= '0';
            END IF;

        END IF;

    END PROCESS;
    
END rtl;
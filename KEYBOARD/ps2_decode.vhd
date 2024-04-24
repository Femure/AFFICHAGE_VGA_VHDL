LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ps2_decode IS
    PORT (
        RST, CLK : IN STD_LOGIC; --system clock
        PS2_CLK : IN STD_LOGIC; --clock signal from PS/2 keyboard
        PS2_DATA : IN STD_LOGIC; --data signal from PS2 keyboard
        DECODE_FLAG : OUT STD_LOGIC; --output flag indicating new DECODE value
        DECODE_CODE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) --DECODE value
    );
END ps2_decode;

ARCHITECTURE rtl OF ps2_decode IS
    TYPE machine IS(ready, new_code, translate, output); --needed states
    SIGNAL state : machine; --state machine
    SIGNAL break : STD_LOGIC := '0'; --'1' for break code, '0' for make code
    SIGNAL decode : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0'); --internal value of decode translation

    COMPONENT ps2_keyboard IS
        PORT (
            RST, CLK : IN STD_LOGIC; --system clock
            PS2_CLK : IN STD_LOGIC; --clock signal from PS/2 keyboard
            PS2_DATA : IN STD_LOGIC; --data signal from PS/2 keyboard
            PS2_CODE_FLAG : OUT STD_LOGIC; --flag that new PS/2 code is available on ps2_code bus
            PS2_CODE : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) --code received from PS/2
        );
    END COMPONENT;

    SIGNAL ps2_code_flag : STD_LOGIC; --new PS2 code flag from ps2_keyboard component
    SIGNAL ps2_code : STD_LOGIC_VECTOR(7 DOWNTO 0); --PS2 code input form ps2_keyboard component
    SIGNAL prev_ps2_code_flag : STD_LOGIC := '1'; --value of ps2_code_flag on previous clock

BEGIN

    --instantiate PS2 keyboard interface logic
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
            prev_ps2_code_flag <= ps2_code_flag; --keep track of previous ps2_code_flag values to determine low-to-high transitions

            CASE state IS
                    --ready state: wait for a new PS2 code to be received
                WHEN ready =>
                    IF (prev_ps2_code_flag = '0' AND ps2_code_flag = '1') THEN --new PS2 code received
                        DECODE_FLAG <= '0'; --reset new DECODE code indicator
                        state <= new_code; --proceed to new_code state
                    ELSE --no new PS2 code received yet
                        state <= ready; --remain in ready state
                    END IF;

                    --new_code state: determine what to do with the new PS2 code  
                WHEN new_code =>
                    IF (ps2_code = x"F0") THEN --code indicates that next command is break
                        break <= '1'; --set break flag
                        DECODE_CODE <= (OTHERS => '0');
                        state <= ready; --return to ready state to await next PS2 code
                    ELSE --code is the last PS2 code in the make/break code
                        state <= translate; --proceed to translate state
                    END IF;

                    --translate state: translate PS2 code to DECODE value
                WHEN translate =>

                    CASE ps2_code IS
                        WHEN x"75" => decode <= "0001"; --UP ARROW
                        WHEN x"72" => decode <= "0011"; --DOWN ARROW
                        WHEN x"74" => decode <= "0100"; --RIGHT ARROW
                        WHEN x"6B" => decode <= "0010"; --LEFT ARROW
                        WHEN x"1D" => decode <= "0101"; --Z
                        WHEN x"1C" => decode <= "0110"; --Q
                        WHEN x"1B" => decode <= "0111"; --S
                        WHEN x"23" => decode <= "1000"; --D
                        WHEN OTHERS => NULL;
                    END CASE;

                    IF (break = '0') THEN -- Just consider when it's a make code (hold a key)
                        state <= output; --proceed to output state
                    ELSE
                        break <= '0'; --reset break flag
                        state <= ready; --return to ready state to await next PS2 code
                    END IF;

                    --output state: verify the code is valid and output the DECODE value
                WHEN output =>
                    DECODE_FLAG <= '1'; --set flag indicating new DECODE output
                    DECODE_CODE <= decode; --output the DECODE value
                    state <= ready; --return to ready state to await next PS2 code

            END CASE;
        END IF;
    END PROCESS;

END rtl;
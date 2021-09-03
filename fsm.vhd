-- fsm.vhd: Finite State Machine
-- Author(s): Vojtěch Jurka (xjurka08)
--
library ieee;
use ieee.std_logic_1164.all;
-- ----------------------------------------------------------------------------
--                        Entity declaration
-- ----------------------------------------------------------------------------
entity fsm is
port(
   CLK         : in  std_logic;
   RESET       : in  std_logic;

   -- Input signals
   KEY         : in  std_logic_vector(15 downto 0);
   CNT_OF      : in  std_logic;

   -- Output signals
   FSM_CNT_CE  : out std_logic;
   FSM_MX_MEM  : out std_logic;
   FSM_MX_LCD  : out std_logic;
   FSM_LCD_WR  : out std_logic;
   FSM_LCD_CLR : out std_logic
);
end entity fsm;

-- ----------------------------------------------------------------------------
--                      Architecture declaration
-- ----------------------------------------------------------------------------
architecture behavioral of fsm is
   type t_state is (	S1, S2, S3, S4, S5, 
						S11, S12, S13, S14, S15, S16, S17, 
						S21, S22, S23, S24, S25, S26, S27, 
						SB, AG, AD, FINISH);
   signal present_state, next_state : t_state;

begin
-- -------------------------------------------------------
sync_logic : process(RESET, CLK)
begin
   if (RESET = '1') then
      present_state <= S1;
   elsif (CLK'event AND CLK = '1') then
      present_state <= next_state;
   end if;
end process sync_logic;

-- -------------------------------------------------------
next_state_logic : process(present_state, KEY, CNT_OF)
begin
   case (present_state) is
   
   when S1 =>
      if (KEY(1) = '1') then
         next_state <= S2;
      elsif (KEY(15) = '1') then
         next_state <= AD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= SB;
      else
         next_state <= S1;
      end if;
	  
	  when S2 =>
      if (KEY(5) = '1') then
         next_state <= S3;
      elsif (KEY(15) = '1') then
         next_state <= AD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= SB;
      else
         next_state <= S2;
      end if;
	  
	  when S3 =>
      if (KEY(9) = '1') then
         next_state <= S4;
      elsif (KEY(15) = '1') then
         next_state <= AD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= SB;
      else
         next_state <= S3;
      end if;
	  
	  when S4 =>
      if (KEY(4) = '1') then
         next_state <= S5;
      elsif (KEY(15) = '1') then
         next_state <= AD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= SB;
      else
         next_state <= S4;
      end if;
	  
	  when S5 =>
      if (KEY(6) = '1') then
         next_state <= S11;
      elsif (KEY(9) = '1') then
         next_state <= S21;
		 elsif (KEY(15) = '1') then
         next_state <= AD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= SB;
      else
         next_state <= S5;
      end if;
	  
	  when S11 =>
      if (KEY(9) = '1') then
         next_state <= S12;
      elsif (KEY(15) = '1') then
         next_state <= AD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= SB;
      else
         next_state <= S11;
      end if;
	  
	  when S12 =>
      if (KEY(1) = '1') then
         next_state <= S13;
      elsif (KEY(15) = '1') then
         next_state <= AD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= SB;
      else
         next_state <= S12;
      end if;
	  
	  when S13 =>
      if (KEY(4) = '1') then
         next_state <= S14;
      elsif (KEY(15) = '1') then
         next_state <= AD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= SB;
      else
         next_state <= S13;
      end if;
	  
	  when S14 =>
      if (KEY(7) = '1') then
         next_state <= S15;
      elsif (KEY(15) = '1') then
         next_state <= AD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= SB;
      else
         next_state <= S14;
      end if;
	  
	  when S15 =>
      if (KEY(2) = '1') then
         next_state <= S16;
      elsif (KEY(15) = '1') then
         next_state <= AD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= SB;
      else
         next_state <= S15;
      end if;
	  
	  when S16 =>
      if (KEY(0) = '1') then
         next_state <= S17;
      elsif (KEY(15) = '1') then
         next_state <= AD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= SB;
      else
         next_state <= S16;
      end if;
	  
	  when S17 =>
      if (KEY(15) = '1') then
         next_state <= AG;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= SB;
      else
         next_state <= S17;
      end if;
	  
	  when S21 =>
      if (KEY(9) = '1') then
         next_state <= S22;
      elsif (KEY(15) = '1') then
         next_state <= AD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= SB;
      else
         next_state <= S21;
      end if;
	  
	  when S22 =>
      if (KEY(4) = '1') then
         next_state <= S23;
      elsif (KEY(15) = '1') then
         next_state <= AD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= SB;
      else
         next_state <= S22;
      end if;
	  
	  when S23 =>
      if (KEY(8) = '1') then
         next_state <= S24;
      elsif (KEY(15) = '1') then
         next_state <= AD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= SB;
      else
         next_state <= S23;
      end if;
	  
	  when S24 =>
      if (KEY(4) = '1') then
         next_state <= S25;
      elsif (KEY(15) = '1') then
         next_state <= AD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= SB;
      else
         next_state <= S24;
      end if;
	  
	  when S25 =>
      if (KEY(4) = '1') then
         next_state <= S26;
      elsif (KEY(15) = '1') then
         next_state <= AD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= SB;
      else
         next_state <= S25;
      end if;
	  
	  when S26 =>
      if (KEY(3) = '1') then
         next_state <= S27;
      elsif (KEY(15) = '1') then
         next_state <= AD;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= SB;
      else
         next_state <= S26;
      end if;
	  
	  when S27 =>
      if (KEY(15) = '1') then
         next_state <= AG;
      elsif (KEY(14 downto 0) /= "000000000000000") then
         next_state <= SB;
      else
         next_state <= S27;
      end if;
	  
	  when AD =>
      next_state <= AD;
      if (CNT_OF = '1') then
         next_state <= FINISH;
      end if;

	  when AG =>
      next_state <= AG;
      if (CNT_OF = '1') then
         next_state <= FINISH;
      end if;
	  
	  when SB =>
      next_state <= SB;
      if (KEY(15) = '1') then
         next_state <= AD;
      end if;
	  
	  when FINISH =>
      next_state <= FINISH;
      if (KEY(15) = '1') then
         next_state <= S1;
      end if;
	  
	  when others =>
		null;
	  end case;
	  
end process next_state_logic;

-- -------------------------------------------------------
output_logic : process(present_state, KEY)
begin
   FSM_CNT_CE     <= '0';
   FSM_MX_MEM     <= '0';
   FSM_MX_LCD     <= '0';
   FSM_LCD_WR     <= '0';
   FSM_LCD_CLR    <= '0';

   case (present_state) is
   
   when AD =>
      FSM_CNT_CE <= '1';
      FSM_MX_LCD <= '1';

      if (CNT_OF = '0') then
         FSM_LCD_WR <= '1';
      end if;
	  
   when AG =>
      FSM_CNT_CE <= '1';
      FSM_MX_MEM <= '1';
      FSM_MX_LCD <= '1';

      if (CNT_OF = '0') then
         FSM_LCD_WR <= '1';
      end if;
	  
   when FINISH =>
      if (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1';
      end if;
	  
   when others =>
      if (KEY(15) = '1') then
         FSM_LCD_CLR <= '1';
      elsif (KEY(14 downto 0) /= "000000000000000") then
         FSM_LCD_WR <= '1';
      end if;
   
   end case;
end process output_logic;

end architecture behavioral;


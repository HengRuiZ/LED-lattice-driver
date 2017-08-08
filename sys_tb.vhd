LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE ieee.std_logic_unsigned.all;  
ENTITY sys_tb IS
END sys_tb;
architecture arch_sys_tb of sys_tb is
	component sys is
	port(
		  num_in:in std_logic_vector(2 downto 0);
		  clk:in std_logic;
		  rowout:out std_logic_VECTOR(7 downto 0);
		  lineout:out std_logic_vector(7 downto 0)
		  );
	end component;
	signal num_in_n   :std_logic_vector(2 downto 0);
	signal clk_n:std_logic;
	signal lineout_n :std_logic_VECTOR(7 downto 0);
	signal rowout_n:std_logic_vector(7 downto 0);
begin
	u0:sys port map(num_in_n,clk_n,rowout_n,lineout_n);
	clk_stimulus:process
	begin
		clk_n <= '0';
		wait for 10 ns;
		clk_n <= '1';
		wait for 10 ns;
	end process clk_stimulus;
	others_stimulus:process
	begin
		num_in_n<="000";
		wait for 800 ns;
		num_in_n<="001";
		wait for 800 ns;
		num_in_n<="010";
		wait for 800 ns;
		num_in_n<="011";
		wait for 800 ns;
	end process;
end arch_sys_tb;

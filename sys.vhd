library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity sys is
	port(
		  num_in:in std_logic_vector(2 downto 0);
		  clk:in std_logic;
		  rowout:out std_logic_VECTOR(7 downto 0);
		  lineout:out std_logic_vector(7 downto 0)
		  );
end sys;

architecture arch_sys of sys is
	component counter is
	port(
		clkin:in std_logic;
		clkout:out std_logic_vector(2 downto 0)
	);
	end component;
	component lattice IS
	port(
		count:in std_logic_vector(2 downto 0);
		rowout:out std_logic_vector(7 downto 0);
		lineout:out std_logic_vector(7 downto 0);
		num_in:in std_logic_vector(2 downto 0)
	);
	end component;
	signal data:std_logic_vector(3 downto 0);
	signal count:std_LOGIC_VECTOR(2 downto 0);
	signal state:std_logic;
	signal num:std_LOGIC_VECTOR(3 downto 0);
begin
		u0:counter port map(clk,count);
		u1:lattice port map(count,rowout,lineout,num_in);
end arch_sys;
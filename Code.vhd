library ieee;
use ieee.std_logic_1164.all;

entity single_port_ram is
port(din : in std_logic_vector(7 downto 0);
clk : in std_logic;
wr : in std_logic;
addr : in natural range 0 to 15;
dout : out std_logic_vector(7 downto 0));
end entity;

architecture behav of single_port_ram is

subtype regis is std_logic_vector(7 downto 0);
type memory is array(15 downto 0) of regis;

signal addregis : natural range 15 downto 0;
signal ram : memory;

begin

process(clk)
begin

if (rising_edge(clk)) then
if(wr = '1') then
ram(addr) <= din;
end if;

addregis <= addr;
end if;
end process;
dout <= ram(addregis);
end behav;

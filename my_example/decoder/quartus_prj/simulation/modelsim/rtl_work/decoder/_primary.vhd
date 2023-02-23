library verilog;
use verilog.vl_types.all;
entity decoder is
    port(
        in_1            : in     vl_logic;
        in_2            : in     vl_logic;
        in_3            : in     vl_logic;
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end decoder;

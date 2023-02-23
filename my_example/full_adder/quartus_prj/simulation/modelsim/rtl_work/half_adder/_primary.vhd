library verilog;
use verilog.vl_types.all;
entity half_adder is
    port(
        in_1            : in     vl_logic;
        in_2            : in     vl_logic;
        sum             : out    vl_logic;
        count           : out    vl_logic
    );
end half_adder;

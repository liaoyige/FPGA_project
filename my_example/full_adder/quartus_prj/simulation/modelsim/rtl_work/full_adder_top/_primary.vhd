library verilog;
use verilog.vl_types.all;
entity full_adder_top is
    port(
        in_1            : in     vl_logic;
        in_2            : in     vl_logic;
        cin             : in     vl_logic;
        sum             : out    vl_logic;
        count           : out    vl_logic
    );
end full_adder_top;

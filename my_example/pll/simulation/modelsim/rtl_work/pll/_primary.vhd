library verilog;
use verilog.vl_types.all;
entity pll is
    port(
        sys_clk         : in     vl_logic;
        rst             : in     vl_logic;
        clk_out_0       : out    vl_logic;
        locked          : out    vl_logic
    );
end pll;

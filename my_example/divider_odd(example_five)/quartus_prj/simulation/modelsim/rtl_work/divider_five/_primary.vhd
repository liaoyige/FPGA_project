library verilog;
use verilog.vl_types.all;
entity divider_five is
    generic(
        CNT_5           : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0)
    );
    port(
        sys_clk         : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        clk_out         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CNT_5 : constant is 1;
end divider_five;

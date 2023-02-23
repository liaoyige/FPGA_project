library verilog;
use verilog.vl_types.all;
entity divider_six is
    generic(
        CNT_SIX         : vl_logic_vector(0 to 1) := (Hi1, Hi0)
    );
    port(
        sys_clk         : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        clk_out         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CNT_SIX : constant is 1;
end divider_six;

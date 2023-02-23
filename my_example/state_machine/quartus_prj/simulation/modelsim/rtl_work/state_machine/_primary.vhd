library verilog;
use verilog.vl_types.all;
entity state_machine is
    generic(
        IDLE            : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        ONE             : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        TWO             : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0)
    );
    port(
        sys_clk         : in     vl_logic;
        sys_rst         : in     vl_logic;
        pi_money        : in     vl_logic;
        po_cola         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of ONE : constant is 1;
    attribute mti_svvh_generic_type of TWO : constant is 1;
end state_machine;

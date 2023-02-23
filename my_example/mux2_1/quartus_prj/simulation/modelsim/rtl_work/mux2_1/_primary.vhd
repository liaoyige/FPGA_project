library verilog;
use verilog.vl_types.all;
entity mux2_1 is
    port(
        in_1            : in     vl_logic_vector(0 downto 0);
        in_2            : in     vl_logic_vector(0 downto 0);
        sel             : in     vl_logic_vector(0 downto 0);
        \out\           : out    vl_logic
    );
end mux2_1;

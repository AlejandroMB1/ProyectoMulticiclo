library verilog;
use verilog.vl_types.all;
entity DataOut_v1_vlg_check_tst is
    port(
        out1            : in     vl_logic_vector(7 downto 0);
        out2            : in     vl_logic_vector(7 downto 0);
        out3            : in     vl_logic_vector(7 downto 0);
        out4            : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end DataOut_v1_vlg_check_tst;

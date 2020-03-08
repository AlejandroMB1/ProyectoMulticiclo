library verilog;
use verilog.vl_types.all;
entity PC_v1_vlg_check_tst is
    port(
        PcOut           : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end PC_v1_vlg_check_tst;

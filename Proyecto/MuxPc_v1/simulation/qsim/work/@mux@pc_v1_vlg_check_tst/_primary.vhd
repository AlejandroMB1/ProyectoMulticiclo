library verilog;
use verilog.vl_types.all;
entity MuxPc_v1_vlg_check_tst is
    port(
        MuxOut          : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end MuxPc_v1_vlg_check_tst;

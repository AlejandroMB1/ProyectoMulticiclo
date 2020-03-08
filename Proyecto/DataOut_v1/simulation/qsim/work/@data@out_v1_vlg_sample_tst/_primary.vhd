library verilog;
use verilog.vl_types.all;
entity DataOut_v1_vlg_sample_tst is
    port(
        entrada         : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end DataOut_v1_vlg_sample_tst;

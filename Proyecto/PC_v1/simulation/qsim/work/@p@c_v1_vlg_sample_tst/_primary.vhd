library verilog;
use verilog.vl_types.all;
entity PC_v1_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        MuxPc           : in     vl_logic_vector(7 downto 0);
        PcSig           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end PC_v1_vlg_sample_tst;

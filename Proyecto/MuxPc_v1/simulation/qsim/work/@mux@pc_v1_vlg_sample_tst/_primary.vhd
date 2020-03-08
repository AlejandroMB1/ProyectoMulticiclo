library verilog;
use verilog.vl_types.all;
entity MuxPc_v1_vlg_sample_tst is
    port(
        Adder           : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        Jump            : in     vl_logic_vector(7 downto 0);
        PcSource        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end MuxPc_v1_vlg_sample_tst;

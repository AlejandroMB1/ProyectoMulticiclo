library verilog;
use verilog.vl_types.all;
entity IR_v1_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        instruccion     : in     vl_logic_vector(15 downto 0);
        irwrite         : in     vl_logic;
        oeir            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end IR_v1_vlg_sample_tst;

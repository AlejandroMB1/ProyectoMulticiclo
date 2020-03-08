library verilog;
use verilog.vl_types.all;
entity Arquitectura_v1_vlg_sample_tst is
    port(
        CLOCK           : in     vl_logic;
        enter           : in     vl_logic;
        entrada         : in     vl_logic_vector(7 downto 0);
        reseteo         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arquitectura_v1_vlg_sample_tst;

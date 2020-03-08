library verilog;
use verilog.vl_types.all;
entity Alu_v1_vlg_check_tst is
    port(
        Branch          : in     vl_logic;
        RESUL           : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end Alu_v1_vlg_check_tst;

library verilog;
use verilog.vl_types.all;
entity IR_v1_vlg_check_tst is
    port(
        opcode          : in     vl_logic_vector(3 downto 0);
        outjump         : in     vl_logic_vector(7 downto 0);
        outrd           : in     vl_logic_vector(7 downto 0);
        outrs           : in     vl_logic_vector(7 downto 0);
        outrt           : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end IR_v1_vlg_check_tst;

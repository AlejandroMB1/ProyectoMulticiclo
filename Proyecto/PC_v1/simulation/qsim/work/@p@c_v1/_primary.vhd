library verilog;
use verilog.vl_types.all;
entity PC_v1 is
    port(
        MuxPc           : in     vl_logic_vector(7 downto 0);
        PcOut           : out    vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        PcSig           : in     vl_logic
    );
end PC_v1;

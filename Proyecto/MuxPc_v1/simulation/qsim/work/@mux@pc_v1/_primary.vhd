library verilog;
use verilog.vl_types.all;
entity MuxPc_v1 is
    port(
        Jump            : in     vl_logic_vector(7 downto 0);
        Adder           : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        PcSource        : in     vl_logic;
        MuxOut          : out    vl_logic_vector(7 downto 0)
    );
end MuxPc_v1;

library verilog;
use verilog.vl_types.all;
entity IR_v1 is
    port(
        instruccion     : in     vl_logic_vector(15 downto 0);
        oeir            : in     vl_logic;
        irwrite         : in     vl_logic;
        clk             : in     vl_logic;
        opcode          : out    vl_logic_vector(3 downto 0);
        outrd           : out    vl_logic_vector(7 downto 0);
        outrs           : out    vl_logic_vector(7 downto 0);
        outrt           : out    vl_logic_vector(7 downto 0);
        outjump         : out    vl_logic_vector(7 downto 0)
    );
end IR_v1;

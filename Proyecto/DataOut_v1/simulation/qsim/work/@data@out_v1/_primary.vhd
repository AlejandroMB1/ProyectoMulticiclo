library verilog;
use verilog.vl_types.all;
entity DataOut_v1 is
    port(
        input           : in     vl_logic_vector(7 downto 0);
        out1            : out    vl_logic_vector(7 downto 0);
        out2            : out    vl_logic_vector(7 downto 0);
        out3            : out    vl_logic_vector(7 downto 0);
        out4            : out    vl_logic_vector(7 downto 0)
    );
end DataOut_v1;

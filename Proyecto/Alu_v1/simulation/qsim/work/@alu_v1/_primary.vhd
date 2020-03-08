library verilog;
use verilog.vl_types.all;
entity Alu_v1 is
    port(
        OPCODE          : in     vl_logic_vector(3 downto 0);
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        C               : in     vl_logic_vector(15 downto 0);
        RESUL           : out    vl_logic_vector(15 downto 0);
        Branch          : out    vl_logic
    );
end Alu_v1;

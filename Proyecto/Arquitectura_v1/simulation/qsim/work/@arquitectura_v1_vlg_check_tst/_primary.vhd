library verilog;
use verilog.vl_types.all;
entity Arquitectura_v1_vlg_check_tst is
    port(
        CONSTANTEIRR    : in     vl_logic_vector(7 downto 0);
        DIRECCIONIR     : in     vl_logic_vector(7 downto 0);
        ESTA            : in     vl_logic_vector(31 downto 0);
        JUMPDIR         : in     vl_logic_vector(7 downto 0);
        OPCODEACT       : in     vl_logic_vector(3 downto 0);
        PCCONT          : in     vl_logic_vector(7 downto 0);
        RD              : in     vl_logic_vector(3 downto 0);
        ROMI            : in     vl_logic_vector(19 downto 0);
        RS              : in     vl_logic_vector(3 downto 0);
        RT              : in     vl_logic_vector(3 downto 0);
        salida1         : in     vl_logic_vector(6 downto 0);
        salida2         : in     vl_logic_vector(6 downto 0);
        salida3         : in     vl_logic_vector(6 downto 0);
        salida4         : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arquitectura_v1_vlg_check_tst;

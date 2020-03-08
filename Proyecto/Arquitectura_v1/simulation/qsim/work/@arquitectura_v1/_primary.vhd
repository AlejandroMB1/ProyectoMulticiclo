library verilog;
use verilog.vl_types.all;
entity Arquitectura_v1 is
    port(
        entrada         : in     vl_logic_vector(7 downto 0);
        enter           : in     vl_logic;
        CLOCK           : in     vl_logic;
        reseteo         : in     vl_logic;
        salida1         : out    vl_logic_vector(6 downto 0);
        salida2         : out    vl_logic_vector(6 downto 0);
        salida3         : out    vl_logic_vector(6 downto 0);
        salida4         : out    vl_logic_vector(6 downto 0);
        PCCONT          : out    vl_logic_vector(7 downto 0);
        ROMI            : out    vl_logic_vector(19 downto 0);
        ESTA            : out    vl_logic_vector(31 downto 0);
        OPCODEACT       : out    vl_logic_vector(3 downto 0);
        RD              : out    vl_logic_vector(3 downto 0);
        RS              : out    vl_logic_vector(3 downto 0);
        RT              : out    vl_logic_vector(3 downto 0);
        JUMPDIR         : out    vl_logic_vector(7 downto 0);
        CONSTANTEIRR    : out    vl_logic_vector(7 downto 0);
        DIRECCIONIR     : out    vl_logic_vector(7 downto 0)
    );
end Arquitectura_v1;

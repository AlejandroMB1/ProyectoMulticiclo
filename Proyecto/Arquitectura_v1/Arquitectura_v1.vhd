----------------------------------------------------------------------------------------------------------------------
-- Actividad : Arquitectura Proyecto
-- Autores : German Andres Caycedo , David Hernandez, Maria Camila Lopez, Alejandro Meza
-- Fecha : 20/10/2018
--
-- archivo : Arquitectura_v1.vhd
----------------------------------------------------------------------------------------------------------------------
-- Descripción : Vamos a hacer el main del proyecto
----------------------------------------------------------------------------------------------------------------------
-- cambios :
----------------------------------------------------------------------------------------------------------------------




Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

Entity Arquitectura_v1 is

	generic 
	(
		DATA_WIDTH : natural := 20;
		ADDR_WIDTH : natural := 8;
		OPCODE_WIDTH : natural := 4;
		OUT_WIDTH : natural := 7
	);

	port ( entrada : in std_logic_vector(7 downto 0);
			enter, CLOCK : in std_logic;
			reseteo : in std_logic;
			salida1 : out std_logic_vector(6 downto 0);
			salida2 : out std_logic_vector(6 downto 0);
			salida3 : out std_logic_vector(6 downto 0);
			salida4 : out std_logic_vector(6 downto 0);
			PCCONT : out std_logic_vector(7 downto 0);
			ROMI : out std_logic_vector(19 downto 0);
			ESTA : out integer;
			OPCODEACT : out std_logic_vector(3 downto 0);
			RD,RS,RT : out std_logic_vector(3 downto 0);
			JUMPDIR, CONSTANTEIRR, DIRECCIONIR : out std_logic_vector(7 downto 0)					
	);

End Entity;


Architecture structural of Arquitectura_v1 is
	Component Divisor_v1
	port(
	   Clkin: in std_logic;
		Clkout: out std_logic
	);
	
	End Component;

	Component Alu_v1 

	generic (NAlu: positive := 8 ; MAlu: positive := 4);

	port(
		OPCODE : in std_logic_vector(MAlu-1 downto 0);
		A,B : in std_logic_vector(NAlu-1 downto 0);
		RESUL: out std_logic_vector(NAlu-1 downto 0);
		Branch: out std_logic
	);

	End Component;


	Component MuxAlu_v1

	generic (Nalux: positive := 8);
	port
	(	registerFile : in std_logic_vector(Nalux-1 downto 0);
		irA : in std_logic_vector(Nalux-1 downto 0);
		clk : in std_logic;
		AluSource: in std_logic;
		MuxOut : out std_logic_vector(Nalux-1 downto 0)
	);

	End Component;

	Component MuxPC_v1
	generic (Nmuxpc: positive := 8);
	port
	(	Jump : in std_logic_vector(Nmuxpc-1 downto 0);
		Adder : in std_logic_vector(Nmuxpc-1 downto 0);
		clk : in std_logic;
		PcSource: in std_logic;
		MuxOut : out std_logic_vector(Nmuxpc-1 downto 0)
	);

	End Component;

	Component Pc_v1
	generic (Npc: positive := 8);
	port
	(	MuxPc : in std_logic_vector(Npc-1 downto 0);
		PcOut : out std_logic_vector(Npc-1 downto 0);
		PcOut2 : out std_logic_vector(Npc-1 downto 0);
		pcOut3 : out std_logic_vector(Npc-1 downto 0);
		clk : in std_logic;
		PcSig: in std_logic
	);

	End Component;

	Component Ram_v1
	generic (Mram: positive := 8);
	port(
		clk, WriteMem, Memread: in std_logic;
		data_in: inout std_logic_vector(Mram-1 downto 0);
		data_out: inout std_logic_vector(Mram-1 downto 0);
		wr_address, rd_address: in std_logic_vector(Mram-1 downto 0);
		data_outREG: out std_logic_vector(Mram-1 downto 0);
		data_inREG: in std_logic_vector(Mram-1 downto 0)
	);

	End Component;

	Component Rom_v1
	generic (Nrom: positive := 20 ; Mrom: positive := 8);
	port
	(	clk: in std_logic;
		address: in std_logic_vector(Mrom-1 downto 0);
		data_out: out std_logic_vector(Nrom-1 downto 0);
		data_out2: out std_logic_vector(Nrom-1 downto 0)
	);

	End Component;

	Component Register_v1
	generic (Nreg: positive := 4 ; Mreg: positive := 8);


	port(
		clk: std_logic;
		regWrite: std_logic;
		regMem: std_logic;
		rd: in std_logic_vector(Nreg-1 downto 0);
		rs: in std_logic_vector(Nreg-1 downto 0);
		rt: in std_logic_vector(Nreg-1 downto 0);
		Register_busOut: out std_logic_vector(Mreg-1 downto 0);
		Register_busIn: in std_logic_vector(Mreg-1 downto 0);
		Register_alu: out std_logic_vector(Mreg-1 downto 0);
		Register_mux: out std_logic_vector(Mreg-1 downto 0)
	);
	End Component;

	Component Alu_Out_v1

	generic (NAluOut: positive := 8);
	port(
		dataAlu : in std_logic_vector(NAluOut-1 downto 0);
		RESULOUT: out std_logic_vector(NAluOut-1 downto 0);	
		oeAluOut: in std_logic
	);

	End Component;

	Component Adder_v1
	generic (Nadder: positive := 8);
	port
	(	Pc: in std_logic_vector(Nadder-1 downto 0);
		OUTADDER: out std_logic_vector(Nadder-1 downto 0)
	);

	End Component;

	Component IR_v1
	generic (Nir: positive := 20 ; Mir: positive := 4 ; Pir: positive := 8);

	port
	(	instruccion: in std_logic_vector(Nir-1 downto 0);
		irwrite: inout std_logic;
		clk : in std_logic;
		opcode: out std_logic_vector(Mir-1 downto 0);
		outrd,outrs,outrt : out std_logic_vector(Mir-1 downto 0);
		outrd1,outrs1,outrt1 : out std_logic_vector(Mir-1 downto 0);
		outjump, constante, constante_dir : out std_logic_vector(Pir-1 downto 0);
		outjump2, constante2, constante_dir2 : out std_logic_vector(Pir-1 downto 0);
		opcode2: out std_logic_vector(Mir-1 downto 0)
	);
	End Component;

	Component UControl_v1 

	generic(Nu: positive:=4);
	port
	(
		clk : in	std_logic;
		reset : in	std_logic;
		input : in std_logic_vector(Nu-1 downto 0);
		pcwritecond : out std_logic;
		pcwrite : out std_logic;
		pcsource : out std_logic;
		irwrite : out std_logic;
		oeirj :out std_logic;
		oeiri :out std_logic;
		regwrite : out std_logic;		
		regtomem :out std_logic;	
		aluop : out std_logic_vector (Nu-1 downto 0);
		alusrc : out std_logic;
		memwrite :out std_logic;
		memread :out std_logic;
		oealuout :out std_logic;
		oedatain :out std_logic;
		nuevoEstado	: out integer
	);
	end component;
	
	Component And_v1 

	port
	(	
		PcWriteCond : in std_logic;
		AluZero: in std_logic;
		AndOut : out std_logic
	);


	End Component;

	Component Or_v1

	port
	(	
		AndOut : in std_logic;
		PcWrite: in std_logic;
		OrOut : out std_logic
	);

	End Component;

	Component DataIn_v1

	generic (Ndata: positive := 8);
	port(
		inputdata: in std_logic_vector(Ndata-1 downto 0);
		Salida : Out std_logic_vector(Ndata-1 downto 0);
		ent: std_logic

		);

	End Component;

	Component DataOut_v1

	generic(NdataOut: positive :=7 ; MdataOut: positive :=8);
	port
	(entrada: in std_logic_vector(MdataOut-1 downto 0);
	out1: out std_logic_vector(NdataOut-1 downto 0);
	out2: out std_logic_vector(NdataOut-1 downto 0);
	out3 : out std_logic_vector(NdataOut-1 downto 0);
	out4 : out std_logic_vector(NdataOut-1 downto 0)
	);
	End Component;
	

	signal OPCODEALU : std_logic_vector(3 downto 0);
	signal AALU : std_logic_vector(7 downto 0);
	signal BALU : std_logic_vector(7 downto 0);
	signal CALU : std_logic_vector(7 downto 0);
	signal ALURESUL : std_logic_vector(7 downto 0);
	signal JUMPIR : std_logic_vector(7 downto 0); --bus principal
	signal ADDEROUT : std_logic_vector( 7 downto 0); --bus salidaAdder
	signal PCSOURCEMUX : std_logic;
	signal PCIN : std_logic_vector(7 downto 0); --bus entrada PC
	signal OUTPC1 : std_logic_vector(7 downto 0); --bus entrada adder
	signal OUTPC2 : std_logic_vector(7 downto 0); --bus entrada ROM
	signal SIGPC : std_logic; 
	signal ROMOUT : std_logic_vector(19 downto 0);
	signal IROE : std_logic;
	signal WRITEIR : std_logic;
	signal IRJOE : std_logic;
	signal IROPCODE : std_logic_vector(3 downto 0);
	signal RDIR : std_logic_vector(3 downto 0);
	signal RSIR : std_logic_vector(3 downto 0);
	signal RTIR : std_logic_vector(3 downto 0);
	signal CONSTANTEIR : std_logic_vector(7 downto 0);
	signal CONSTANTEDIR : std_logic_vector(7 downto 0);
	signal WRITEREG : std_logic;
	signal MEMREG : std_logic;
	signal OUTREGISTER : std_logic_vector(7 downto 0);
	signal ALUREGISTER : std_logic_vector(7 downto 0);
	signal MUXREGISTER : std_logic_vector(7 downto 0);
	signal SOURCEALU : std_logic;
	signal OUTMUX : std_logic_vector(7 downto 0);
	signal ALUOUTOE : std_logic;
	signal ALUOUTSAL : std_logic_vector(7 downto 0);
	signal CONDPCWRITE : std_logic;
	signal WRITEPC : std_logic;
	signal READMEM : std_logic;
	signal WRITEMEM : std_logic;
	signal DATAINOE : std_logic;
	signal ZERO : std_logic;
	signal OUTAND : std_logic;
	signal OUTOR : std_logic;
	signal OUTDATA : std_logic_vector(7 downto 0);
	signal INDATA : std_logic_vector(7 downto 0);
	signal INDATAIN : std_logic_vector(7 downto 0);
	signal OUTDATARAM : std_logic_vector(7 downto 0);
	signal INDATARAM : std_logic_vector(7 downto 0);
	signal INREGISTER : std_logic_vector(7 downto 0);
	signal OUTDATAIN : std_logic_vector(7 downto 0);
	signal SIGMB : std_logic;
	signal signalRom:  std_logic;
	signal clkt: std_logic;


	

BEGIN	
	DivisorC1: Divisor_v1 port map(Clkin => CLOCK,Clkout => clkt);
	
	MuxPc1: MuxPc_v1 generic map (Nmuxpc => ADDR_WIDTH)
	port map (Jump => JUMPIR, Adder => ADDEROUT, PcSource => PCSOURCEMUX, MUXOUT => PCIN, clk => CLOCK);

	PC1: PC_v1 generic map ( Npc => ADDR_WIDTH )
	port map (MuxPc => PCIN, PCOut => OUTPC1,PCOut2 => PCCONT, pcOut3 => OUTPC2, PCSig => SIGPC, clk => CLOCK);

	ADDERC1: Adder_v1 generic map (Nadder => ADDR_WIDTH)
	port map (Pc => OUTPC1, OUTADDER => ADDEROUT );

	ROMC1: Rom_v1 generic map (Nrom => DATA_WIDTH)
	port map (address => OUTPC2, data_out => ROMOUT, clk => CLOCK, data_out2 => ROMI);

	IRC1: IR_v1 generic map (Nir => DATA_WIDTH, Mir => OPCODE_WIDTH, Pir => ADDR_WIDTH)
	port map (instruccion => ROMOUT,irwrite => WRITEIR, opcode => IROPCODE, outrd => RDIR, outrs => RSIR, outrt => RTIR, outjump => JUMPIR, constante => CONSTANTEIR, constante_dir => CONSTANTEDIR, clk => CLOCK, opcode2 => OPCODEACT, outrd1=>RD , outrs1=>RS, outrt1=>RT, constante2=>CONSTANTEIRR, constante_dir2=> DIRECCIONIR);

	REGC1: Register_v1 generic map (Nreg => OPCODE_WIDTH, Mreg => ADDR_WIDTH)
	port map (regWrite => WRITEREG, regMem => MEMREG, rd => RDIR, rs => RSIR, rt => RTIR, Register_busOut => OUTREGISTER, Register_busIn => INREGISTER, Register_alu => ALUREGISTER, Register_mux => MUXREGISTER, clk =>CLOCK);

	MuxAluC1: MuxAlu_v1 generic map (Nalux => ADDR_WIDTH)
	port map (registerFile => ALUREGISTER, irA => CONSTANTEIR, AluSource => SOURCEALU, MuxOut => OUTMUX, clk => CLOCK);

	AluC1: Alu_v1 generic map (NAlu=>ADDR_WIDTH,MAlu=>OPCODE_WIDTH)
	port map (OPCODE => OPCODEALU, A => ALUREGISTER, B => OUTMUX, RESUL => ALURESUL, Branch => ZERO);

	AluOutC1: Alu_Out_v1 generic map (NAluOut => ADDR_WIDTH)
	port map (dataAlu => ALURESUL,RESULOUT => ALUOUTSAL, oeAluOut => ALUOUTOE);

	RAMC1: Ram_v1 generic map (Mram => ADDR_WIDTH)
	port map (WriteMem => WRITEMEM, Memread => READMEM, data_in => INDATARAM, data_out => OUTDATARAM , wr_address => CONSTANTEDIR, rd_address => CONSTANTEDIR, clk => CLOCK, data_inREG => OUTREGISTER,data_outREG =>INREGISTER);

	UControlC1: UControl_v1 generic map(Nu => OPCODE_WIDTH)
	port map (clk => CLOCK, reset => reseteo, input => IROPCODE, pcwritecond => CONDPCWRITE, pcwrite => WRITEPC, pcsource => PCSOURCEMUX, irwrite => WRITEIR, oeirj => IRJOE, oeiri => IROE, regwrite => WRITEREG,regtomem => MEMREG, aluop => OPCODEALU, alusrc => SOURCEALU, memread => READMEM, memwrite => WRITEMEM, oealuout => ALUOUTOE, oedatain => DATAINOE, nuevoEstado => ESTA);

	AndC1: And_v1 port map (PcWriteCond => CONDPCWRITE, AluZero => ZERO, AndOut => OUTAND);

	ORC1: Or_v1 port map (AndOut => OUTAND, PcWrite => WRITEPC, OrOut => SIGPC);

	DataInC1: DataIn_v1 generic map(Ndata => ADDR_WIDTH )
	port map (Inputdata => entrada, salida => INDATARAM, ent => enter);

	DataOutC1: DataOut_v1 generic map(NdataOut => OUT_WIDTH, MdataOut => ADDR_WIDTH)
	port map (entrada => OUTDATARAM, out1 => salida1, out2 => salida2, out3 => salida3, out4 => salida4);
	
	--	MuxData: MuxAlu_v1 generic map (Nalux => ADDR_WIDTH)
--	port map (registerFile => INDATAIN, irA => OUTDATA, AluSource => SIGMB, MuxOut => INREGISTER, clk => CLOCK);

End structural;
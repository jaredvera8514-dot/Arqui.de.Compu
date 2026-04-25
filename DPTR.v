module DPTR(
input [31:0]insTR
);

wire C_RegWrite,C_MemToReg,C_MemToWrite;
wire C_MemToRead;
wire [2:0]C_ALUOp;
wire [31:0]C_1;
wire [31:0]C_2;
wire [31:0]C_3;
wire [3:0]C_4;
wire [31:0]C_5;
wire [31:0]C_WriteData;

ALuControl aluctrl(
.FUNC(insTR[5:0]),
.ALUOp(C_ALUOp),
.salidaAC(C_4)
);

BR br(
.AW(insTR[15:11]),
.AR2(insTR[20:16]),
.AR1(insTR[25:21]),
.WE(C_RegWrite),
.DW(C_WriteData),
.DR1(C_1),
.DR2(C_2)
);

UC uc(
.OP(insTR[31:26]),
.MemToReg(C_MemToReg),
.MemToWrite(C_MemToWrite),
.MemToRead(C_MemToRead),
.ALUOp(C_ALUOp),
.RegWrite(C_RegWrite)
);

ALU alu(
.A(C_1),
.B(C_2),
.sel(C_4),
.R(C_3)
);

MEM mem(
.Address(C_3),
.MemToWrite(C_MemToWrite),
.MemToRead(C_MemToRead),
.WriteData(C_2),
.ReadData(C_5)
);

MUX2_1 mux2_1(
.ALUR(C_3),
.Read_data(C_5),
.MemToReg(C_MemToReg),
.Write_data(C_WriteData)
);

endmodule

module M_SLAVE(
input clk,
input mosi,
output miso,
input ss
);

reg[7:0] datos_trans;
reg[7:0] datos_rec;
reg[2:0] contador_bit;
reg[1:0] estado;

wire spi_activo;
wire spi_datos;

endmodule;

module M_MASTER(
input clk,
input miso,
output mosi,
output ss
);

reg[7:0] datos_trans;
reg[7:0] datos_rec;
reg[2:0] contador_bit;
reg[1:0] estado;

wire empecarTransmision;
wire spi_clk;

endmodule;

module SPI_TOP(
	input CLK
);

wire c1,c2,c3;

M_MASTER master(
	.clk(CLK),
	.miso(c1),
	.mosi(c2),
	.ss(c3)
	
);

M_SLAVE slave(
	.clk(CLK),
	.mosi(c2),
	.miso(c1),
	.ss(c3)
);

endmodule;
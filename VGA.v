module VGA (
   input  CLOCK_27,
   output VGA_HS,
   output VGA_VS,
   output [3:0] VGA_R,
   output [3:0] VGA_B,
   output [3:0] VGA_G
);

wire VGACLK, RESET;

SYNC C1 (
   .CLK(VGACLK),
   .HSYNC(VGA_HS),
   .VSYNC(VGA_VS),
   .R(VGA_R),
   .G(VGA_G),
   .B(VGA_B)
);

PLL C0 (
   .clk_out_clk(VGACLK),
   .clk_in_clk(CLOCK_27),
   .reset_reset(RESET)
);

endmodule
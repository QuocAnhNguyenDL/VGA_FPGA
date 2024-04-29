module SYNC (
    input CLK,
    output reg HSYNC,
    output reg VSYNC,
    output reg [3:0] R,
    output reg [3:0] G,
    output reg [3:0] B
);

// 1280x1024 @ 60 Hz pixel clock 108 MHz
reg [3:0] RGB;
reg [10:0] HPOS;
reg [10:0] VPOS;

always @(posedge CLK) begin

   if(HPOS == 1048 & VPOS == 554 )
	begin
		R <= 1'b1;
		G <= 1'b1;
		B <= 1'b1;
	end
	else
	begin
		R <= 1'b0;
		G <= 1'b0;
		B <= 1'b0;
	end
	
   if (HPOS < 1688) begin
      HPOS <= HPOS + 1;
   end else begin
      HPOS <= 0;
      if (VPOS < 1066) begin
         VPOS <= VPOS + 1;
      end else begin
         VPOS <= 0;
      end
   end
   if ((HPOS > 0 && HPOS < 408) || (VPOS > 0 && VPOS < 42)) begin
      R <= 4'b0000;
      G <= 4'b0000;
      B <= 4'b0000;
   end
   if (HPOS > 48 && HPOS < 160) begin
      HSYNC <= 1'b0;
   end else begin
      HSYNC <= 1'b1;
   end
   if (VPOS > 0 && VPOS < 4) begin
      VSYNC <= 1'b0;
   end else begin
      VSYNC <= 1'b1;
   end
end

endmodule

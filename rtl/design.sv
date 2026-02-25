//SRAM is synchronous, write-first, with data_out holding its previous value until a read occurs.
`include "interface.sv"
module sram_m(sram_if if1);
  
  reg [7:0] mem [255:0];
  
  always_ff@(posedge if1.clk)
    if(!if1.reset_n)
      if1.data_out <= 0;
  else if (if1.wr_rd_en==1) begin
    mem[if1.addr] <= if1.data_in;
     if1.data_out  <= 0;   
  end
  
  
  else
    if1.data_out <= mem[if1.addr];
endmodule

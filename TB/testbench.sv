// or browse Examples
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "monitor2.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module top;
  
  bit clk;
  bit reset_n;
  
  sram_if if3(clk,reset_n);
  
  sram_m dut(if3);
  
  test tb(if3);
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    reset_n=0;
    repeat (3) @(posedge clk)  //hold reset for 2 clocks
    reset_n=1;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #500 $finish;
  end
endmodule

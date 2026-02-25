interface sram_if(input clk,reset_n);
  logic wr_rd_en;
  logic [7:0] addr;
  logic [3:0] data_in;
  logic [3:0] data_out;
  
// Assertion: wr_rd_en should not be high during reset
    /*property wr_en_not_during_reset;
      @(posedge clk) reset_n |-> (wr_rd_en == 0);   
    endproperty
    assert_wr_en_not_during_reset: assert property (wr_en_not_during_reset)
      else $error("[%0t] ERROR: wr_rd_en HIGH during reset!", $time);*/
  //assertion check for dataout whether it is happening when reset is active
  property reset_behavior;
    @(posedge clk) (!reset_n) |=> (data_out == 0);
  endproperty

  assert_reset_behavior: assert property(reset_behavior)
    else $error("[%0t] ERROR: data_out != 0 during reset!", $time);
  
  
 endinterface

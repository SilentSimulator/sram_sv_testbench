class transaction;

  randc logic [3:0]data_in;
  randc logic [7:0] addr;
  randc logic wr_rd_en;
  rand logic [3:0] data_out;
  
	function new;
      $display ($time,"*  Transaction class *");
	endfunction

endclass

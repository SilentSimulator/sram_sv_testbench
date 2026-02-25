class monitor2;

    transaction t1;
	mailbox mon22sb;
    virtual sram_if vif;
  
   covergroup cg @(posedge vif.clk);
    coverpoint vif.wr_rd_en { bins read = {0}; }
    coverpoint vif.addr;
    coverpoint vif.data_out;
  endgroup

 // read_cg rcg;

  function new(input mailbox mon22sb, input virtual sram_if vif);
		this.mon22sb=mon22sb;
        this.vif=vif; 
        cg = new();
         
    $display ($time,"*  monitor2 class *");
	endfunction

   task run;
      wait(vif.reset_n)
     repeat(5)
       begin
         @(negedge vif.clk) 
         //t1=new();
         //wait(vif.reset_n)
         
         if(!vif.wr_rd_en) begin
           @(posedge vif.clk)
           t1=new();
         t1.data_out=vif.data_out;
         
         t1.addr= vif.addr;
        
         mon22sb.put(t1);
         
             $display (" [%0t] Mon1 data_out=%d",$time,t1.data_out);
       end
       end
     
   endtask 
  
endclass

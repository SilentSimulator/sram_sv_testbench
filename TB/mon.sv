class monitor;

    transaction t1;
	mailbox mon12sb;
    virtual sram_if vif;

  function new(input mailbox mon12sb, input virtual sram_if vif);
		this.mon12sb=mon12sb;
        this.vif=vif;
    $display ($time,"*  monitor1 class *");
	endfunction

   task run;
      wait(vif.reset_n)
     repeat(5)
       begin
         @(negedge vif.clk) 
         t1=new();
         //wait(vif.reset_n)
         
         if(vif.wr_rd_en)
           begin
         t1.data_in=vif.data_in;
         
         t1.addr= vif.addr;
        // vif.read_req <= 0;
         mon12sb.put(t1);
         
         $display (" [%0t] Mon1 datain=%d",$time,t1.data_in);
       end
       end
     
   endtask 
  
endclass

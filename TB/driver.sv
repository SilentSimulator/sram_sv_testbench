class driver;

    transaction t1;
	mailbox mb2;
    virtual sram_if vif;

  function new(input mailbox mb2, input virtual sram_if vif);
		this.mb2=mb2;
        this.vif=vif;
        $display ($time,"* Driver class *");
	endfunction

   task run;
     repeat(5)
       begin
      @(posedge vif.clk) 
         t1=new;
     mb2.get(t1);
         $display ("Value of data_in =%d,wr_rd_en=%d,addr=%d",t1.data_in,t1.wr_rd_en,t1.addr);
      
       vif.data_in<=t1.data_in;
         vif.wr_rd_en <= t1.wr_rd_en;
         vif.addr <= t1.addr;
         
         @(posedge vif.clk);
         vif.wr_rd_en <= 0;
       end
     
   endtask 
  
endclass

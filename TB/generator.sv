class generator;

   transaction t1;  
  
	mailbox mb1;

	function new(input mailbox mb1);
		this.mb1=mb1;
        $display ($time,"*  Generator class *");
	endfunction
  
    task run;
      
      repeat(5)
       
        begin
           t1=new();
      if (t1.randomize)
        $display($time,"Randomization sucessfull");
          $display ("Value of  datain ",t1.data_in);
      mb1.put(t1);
        end
    endtask

endclass

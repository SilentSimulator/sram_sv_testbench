class environment;
virtual sram_if vif;
mailbox mb1;
transaction t1;
transaction t2;
generator g1;
driver d1;
monitor m1;
monitor2 m2;
scoreboard1 s1;
mailbox mon12sb;
mailbox mon22sb; 
  
function new(input virtual sram_if vif);
	 $display ($time,"*****  Environment  *****");
        mb1 =new;
        t1=new;
        t2=new;
        mon12sb=new;
        mon22sb=new;
        g1=new(mb1);
        d1=new(mb1,vif);
    m1=new(mon12sb,vif);
    m2=new(mon22sb,vif);
    s1=new(mon12sb,mon22sb);
endfunction 

  task run;
    fork
    g1.run;
    d1.run;
    m1.run;
    m2.run;
    s1.run;
    join
  endtask
  

endclass

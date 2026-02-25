program test(sram_if if2);

environment e1;

initial
begin
  e1=new(if2);
  e1.run;
  $display ($time,"*****  Test class *****");
//	#100 $finish;
end
endprogram

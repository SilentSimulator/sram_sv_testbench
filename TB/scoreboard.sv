class scoreboard1;

  mailbox mon12sb;
  mailbox mon22sb; 

  int error = 0;
  int pass  = 0;

  function new(mailbox mon12sb, mailbox mon22sb);
    this.mon12sb = mon12sb;
    this.mon22sb = mon22sb;
    $display("%0t : Scoreboard : Created", $time);
  endfunction

  task run();
    transaction tx_pkt, rx_pkt;
    transaction exp_pkt,org_pkt;
    transaction que1[$];
    transaction que2[$];
    
    forever begin
      mon12sb.get(tx_pkt);
      que1.push_front(tx_pkt);

      mon22sb.get(rx_pkt);
      que2.push_front(rx_pkt);
 
      if(que1.size>0)
        org_pkt=que1.pop_back();
      $display("********************************[%0t] MON1 transaction ****************:  data_in=%0d ",$time, org_pkt.data_in);
      if(que2.size>0)
       exp_pkt=que2.pop_back();
   
      $display("******************************[%0t] MON2 transaction ****************:  data_out=%0d ",$time, exp_pkt.data_out);
      
      if (org_pkt.data_in !== exp_pkt.data_out) begin
        $display("** ERROR **: Data mismatch TX=%0d, RX=%0d", org_pkt.data_in,exp_pkt.data_out);
          error++;
        end else begin
          $display("[%0t]** PASS **: Data matched successfully (Data=%0d) (Data_out=%0d)",$time,org_pkt.data_in,exp_pkt.data_out);
        pass++;
        end
      end
  endtask

endclass

//Create Monitor and Scoreboard Code for Synchronous 4-bit Multiplier. 
//Stimulus is generated in Testbench top so do not add Transaction, Generator, or Driver Code. 
//Also, add the Scoreboard model to compare the response with an expected result.

class monitor;

  mailbox #(transaction) mbx;

  virtual top_if vif;



  function new(mailbox #(transaction) mbx);

    this.mbx = mbx;

  endfunction



  task monitor_process();

    transaction t;

    forever begin

      @(posedge vif.clk);

      t = new();

      t.a = vif.a;

      t.b = vif.b;

      t.mul = vif.mul;

      $display("[MON] Sending transaction:");

      t.display();

      mbx.put(t);

    end

  endtask



endclass



class scoreboard;

  mailbox #(transaction) mbx;



  function new(mailbox #(transaction) mbx);

    this.mbx = mbx;

  endfunction



  task scoreboard_process();

    transaction ts;

    forever begin

      @(mbx.get_ready);

      mbx.get(ts);

      $display("[SCO] Received transaction:");

      ts.display();



      // Expected result based on inputs

      int expected_result = ts.a * ts.b;

      if (ts.mul == expected_result)

        $display("[SCO] Mul Result Matched");

      else

        $error("[SCO] Result Mismatched");

     

      $display("-------------------------");

    end

  endtask



endclass


module tb;



  top_if vif();

  scoreboard sco;

  monitor mon;

  mailbox #(transaction) mbx;



  top dut (vif.clk, vif.a, vif.b, vif.mul);



  initial begin

    vif.clk <= 0;

  end



  always #5 vif.clk <= ~vif.clk;



  initial begin

    for (int i = 0; i < 20; i++) begin

      repeat (2) @(posedge vif.clk);

      vif.a <= $urandom_range(1, 15);

      vif.b <= $urandom_range(1, 15);

    end

  end



  initial begin

    mbx = new();

    sco = new(mbx);

    mon = new(mbx);

    mon.vif = vif;



    // Start monitor and scoreboard tasks

    fork

      mon.monitor_process();

      sco.scoreboard_process();

    join

  end



  initial begin

    $dumpfile("dump.vcd");

    $dumpvars(0, tb);

    #300;

    $finish;

  end



endmodule


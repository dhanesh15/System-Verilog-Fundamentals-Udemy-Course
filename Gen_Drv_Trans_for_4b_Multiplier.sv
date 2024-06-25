//Create Transaction, Generator and Driver code for Synchronus 4-bit Multiplier.

class transaction;

randc bit [3:0] a;

randc bit [3:0] b;

bit [7:0] mul;

  function void display();

    $display("a : %0d \t b: %0d \t product : %0d",a,b,mul);

  endfunction

  function transaction copy();

    copy = new();

    copy.a = this.a;

    copy.b = this.b;

    copy.mul = this.mul;

  endfunction

endclass

class generator;

  transaction trans;

  mailbox #(transaction) mbx;

  event done;

  virtual mul_if mif;

  function new(mailbox #(transaction) mbx);

    this.mbx = mbx;

    trans = new();

  endfunction

  task run();

    for(int i = 0; i<10; i++) begin

      @(posedge mif.clk);

      trans.randomize();

      mbx.put(trans.copy);

      $display("[GEN] : DATA SENT TO DRIVER");

      trans.display();

    end

   -> done;

  endtask

endclass

interface mul_if;

  logic [3:0] a;

  logic [3:0] b;

  logic [7:0] mul;

  logic clk;

endinterface

class driver;

  virtual mul_if mif;

  mailbox #(transaction) mbx;

  transaction data;

  event next;

  function new(mailbox #(transaction) mbx);

    this.mbx = mbx;

  endfunction

  task run();

    forever begin

      mbx.get(data);

      @(posedge mif.clk); 

      mif.a <= data.a;

      mif.b <= data.b;

      $display("[DRV] : Interface Trigger");

      data.display();

    end

  endtask

endclass

module tb;

mul_if mif();

driver drv;

generator gen;

event done;

mailbox #(transaction) mbx;

  multi dut (mif.clk, mif.a, mif.b, mif.mul );

initial begin

   mif.clk <= 0;

end

always #10 mif.clk <= ~mif.clk;

initial begin

   mbx = new();

   drv = new(mbx);

   gen = new(mbx);

   drv.mif = mif;

   done = gen.done;

end

initial begin

  fork

    gen.run();

    drv.run();

  join_none

    wait(done.triggered);

    $finish();

end

endmodule

//Create a task that will generate stimulus for addr , wr, 
//and en signal as mentioned in a waveform of the Instruction tab. 
//Assume address is 6-bit wide while en and wr both are 1-bit wide. 
//The stimulus should be sent on a positive edge of 25 MHz clock signal.

module tb():

bit clk = 0;
bit wr,en;
bit [6:0] addr;

always #5 clk = ~clk;

task stim();

@(posedge clk)

en = 1; wr = 1; addr = 7'd12;
#40 wr = 1; addr = 7'd14;
#40 wr = 0; addr = 7'd23;
#40 addr = 7'd48;
#40 en = 0; addr = 7'd56;

endtask

initial begin
stim();
end

endmodule

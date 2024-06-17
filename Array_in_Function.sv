//Create a function that generate and return 32 values of multiple of 8 (0, 8, 16, 24, 32, 40 .... 248). 
//Store this value in the local array of the testbench top and 
//also print the value of each element of this array on the console.

module tb();
int res[32];

function automatic void mult8 (input int arr[32]);
  
for (int i = 0; i < 32; i++) begin
arr[i] = i*8;
end

endfunction

initial begin

mult8(res);

for (int i = 0; i < 32; i++) begin
$display("res[%0d] : %0d", i, res[i]);
end
  
$finish();
end
endmodule

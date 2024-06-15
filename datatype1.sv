//Assume you have four variables ( a, b,c, and d ) in your testbench top. 
//a and b are of the 8-bit reg type, while c and d are of the integer type. 
//initialize a,b,c, and d to values of 12, 34, 67, and 255 respectively. 
//Add a code to print the values of all the variables after 12 nSec.

module tb():

reg [7:0] a,b;
int c;
int d; 

initial begin
a = 8'd12;
b = 8'd34; 
c = 67; 
d = 255;

#12

$display("a = %0d", a); 
$display("b = %0d", b); 
$display("c = %0d", c);
$display("d = %0d", d);

end
endmodule

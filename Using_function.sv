//Create a function that will perform the multiplication of the two unsigned integer variables. 
//Compare values return by function with the expected result 
//and if both values match send "Test Passed" to Console else send "Test Failed".
module tb;

function int unsigned mult(int unsigned a,b);
return a*b;
endfunction

int unsigned res;
int unsigned ans;

int unsigned a=10,b=10;

initial begin

res=mult(a,b);
ans=a*b;

if(res==ans) begin
$display("Test Passed");
end

else begin
$display("Test Failed");
end

end
endmodule

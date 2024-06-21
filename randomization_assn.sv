//For the Generator code mentioned in the Instruction tab, expected values for variable a ranges from 0 to 8, variable b ranges from 0 to 5. 
//Also, add logic to store the number of times randomization failed. 
//Print values of variables during each iteration and error count after generating 20 random values for a and b. 
//Add Constraint Code and Testbench top code to  the Design

class generator;

rand bit [4:0] a;
rand bit [5:0] b;

constraint data { a inside {[0:8]};

                  b inside {[0:5]}; }

endclass

module tb;
  
int i = 0;
generator g;

initial begin

g = new()

for (i = 0; i < 20; i++) begin
  
assert(g.randomize()) else
begin
err + = 1;
end

$display(g.a , g.b);
#20

end
end
endmodule

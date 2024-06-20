class generator;
  
bit [3:0] a = 5,b =7;
bit wr = 1;
bit en = 1;
bit [4:0] s = 12;

function void display();

$display("a:%0d b:%0d wr:%0b en:%0b s:%0d", a,b,wr,en,s);

endfunction

function generator copy();

copy = new();
copy.a = a;
copy.b = b;
copy.wr = wr;
copy.en = en;
copy.s = s

endfunction

endclass

class second;

generator g1;

function new();
g1 = new();
endfunction

function second copy();

copy = new();
copy.g1 = g1.copy;
endfunction
  
endclass

module tb;

second s1,s2;

initial begin

s1=new();
s2=new();

s2=s1.copy;
s2.g1.display();

s2.g1.a=5;

s2.g1.display();
s1.g1.display();

end
endmodule

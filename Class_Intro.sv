//Create a Class consisting of 3 data members each of unsigned integer type. 
//Initialize them to 45,78, and 90. 
//Use the display function to print the values on the console.

class first;
  
unsigned int a;
unsigned int b;
unsigned int c;
  
endclass

module tb();
  
first f;
inital begin
  
f = new();
  
f.a = 45;
f.b = 78;
f.c = 90;
  
#1 $display("Values are: %0d %0d %0d",f.a,f.b,f.c);

end
endclass

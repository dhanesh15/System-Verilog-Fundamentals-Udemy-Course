module tb():

int arr[];

initial begin
arr = new[7];

for (int i = 0; i < 7; i++) begin
arr[i] = (i+1)*7;
end
  
$display("Initial Array : %0p", arr);

#20;

arr = new[20](arr);

for (int j = 7; j < 20; j++) begin
arr[j] = (j - 6) * 5;
end

$display("Result Array : %0p", arr);

end
endmodule

module tb();

int i = 0;
unsigned int arr[10];

while (i < 10)
begin

arr[i] = i*i;
i = i+1;

end

i = 0;
while (i < 10)
begin

$display("array[%0d] = %0d", i, array[i]);
i = i+1;

end
endmodule

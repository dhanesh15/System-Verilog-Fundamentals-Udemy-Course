//Create two tasks each capable of sending a message to Console at a fixed interval. 
//Assume Task1 sends the message "Task 1 Trigger" at an interval of 20 ns 
//while Task2 sends the message "Task 2 Trigger" at an interval of 40 ns. 
//Keep the count of the number of times Task 1 and Task 2 trigger by adding a variable 
//for keeping the track of task execution and incrementing with each trigger. 
//Execute both tasks in parallel till 200 nsec. 
//Display the number of times Task 1 and Task 2 executed after 200 ns 
//before calling $finish for stopping the simulation.

module tb;

int t1 = 0;
int t2 = 0;

task example;
#20;
$display("example trigger");
endtask

..........................

.........................

while ($time < 200) begin 
#20; 
t1++;
$display("Task 1 Trigger"); 
end 
endtask

task Task2; 
while ($time < 200) begin 
#40; 
t2++; 
$display("Task 2 Trigger"); 
end 
endtask

initial begin

fork
Task1();
Task2();
join

$display(t1,t2);
$finish();
end
endmodule

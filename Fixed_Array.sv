module tb;

  reg array1 [15];
  reg array2 [15];

  initial begin
   
    for (int i = 0; i < 15; i++) begin
      array1[i] = $urandom;
      array2[i] = $urandom;
    end
    
    $display("Array1: %p", array1);
    $display("Array2: %p", array2);
  end

endmodule

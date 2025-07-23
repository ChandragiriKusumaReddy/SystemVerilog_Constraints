//Index-Dependent Array Constraint: Write a constraint and create a dynamic array of 5 elements (int data[]) such that each element at index i is equal to i * 10.
class task7;
  rand int da[];
  
  constraint cons1{
    da.size() == 5;}
  constraint cons2{
    foreach(da[i])
      da[i] == i*10;
  }
  function void post_randomize();
    $display("Generated data :%p",da);
  endfunction
endclass
module test();
    task7 t;
    initial begin
      t = new();
      if(t.randomize())
        $display("Randomization Successfull");
      else
        $display("Randomization Failed");
    end
  endmodule

//Output:
# KERNEL: Generated data :'{0, 10, 20, 30, 40}
# KERNEL: Randomization Successfull

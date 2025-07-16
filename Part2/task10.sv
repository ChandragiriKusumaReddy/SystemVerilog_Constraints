//Write a constraint to generate a pattern [1,0] alternatively and array of size is 12 
class task10;
  rand bit pattern[12];

  // Constraint: Even indices = 0, Odd indices = 1
  constraint c_pattern {
    foreach (pattern[i])
      if (i % 2 == 0)
        pattern[i] == 0;
      else
        pattern[i] == 1;
  }
endclass

module test;
  task10 t;

  initial begin
    t = new();
    if (t.randomize())
      $display("Pattern = %p", t.pattern);
    else
      $display("Randomization failed");
  end
endmodule



//Output:
# KERNEL: Pattern = '{0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1}

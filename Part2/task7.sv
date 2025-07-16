//Write a constraint to generate a sequence alternating between a positive even number and a negative odd number.
class task7;
  rand int da[10];

  constraint cons {
    foreach (da[i]) {
      if (i % 2 == 0)
        da[i] inside {[2:100]} && (da[i] % 2 == 0); // positive even
      else
        da[i] inside {[-99:-1]} && (da[i] % 2 != 0);  // negative odd
    }
  }
endclass

module test;
  task7 t;

  initial begin
    t = new();
    if (t.randomize())
      $display("The numbers = %p", t.da);
    else
      $display("Randomization failed");
  end
endmodule


 //Output:
    # KERNEL: The numbers = '{42, -93, 58, -9, 62, -85, 62, -55, 6, -89}

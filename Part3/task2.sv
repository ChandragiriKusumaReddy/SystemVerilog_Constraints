//Write a constraint such that the array size is 8 , values should be in between 1 to 100 , if data is divisible by 10 the the data must be even else the data must be odd and no values should be zero and all the values must be unique
class task2;
  rand int data[8];

  // Range constraint
  constraint cons1 {
    foreach(data[i])
      data[i] inside {[1:100]};
  }
  
  // Conditional even/odd constraint
  constraint cons2 {
    foreach(data[i]) {
      if (data[i] % 10 == 0)
        data[i] % 2 == 0;  // Must be even if divisible by 10
      else
        data[i] % 2 == 1;  // Must be odd otherwise
    }
  }

  // Uniqueness constraint
  constraint cons3 {
    unique {data};
  }

  function void post_randomize();
    $display("Randomized Data: %p", data);
  endfunction
endclass

module test;
  initial begin
    task2 t = new();
    if (t.randomize())
      $display("Randomization Successful");
    else
      $display("Randomization Failed");
  end
endmodule


//Output:
# KERNEL: Randomized Data: '{9, 17, 75, 15, 53, 80, 55, 90}
# KERNEL: Randomization Successful

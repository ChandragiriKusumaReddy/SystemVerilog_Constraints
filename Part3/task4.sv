//Index-based constraint:
//Write a constraint for a rand int data[8] array such that: all values are in the range [10:80], each data[i+1] > data[i] + 3 for all valid i, all values must be even, all values must be unique
class task4;
  rand int data[8];
  constraint c_range{
    foreach(data[i])
      data[i] inside{[10:80]};
  }
  constraint c_even{
    foreach(data[i])
    data[i]%2==0;
  }
  constraint c_unique{
    unique{data};
  }
  constraint c_increasing{
    foreach(data[i])
      if(i<7)
        data[i+1]>data[i]+3;
  }
  function void post_randomize();
    $display("Randomized Data:%p",data);
  endfunction
endclass
module test();
  task4 t;
  initial begin
    t=new();
    if(t.randomize())
      $display("Randomized Successfully");
    else
      $display("Randomization Failed");
  end
endmodule


//Output:
# KERNEL: Randomized Data:'{10, 14, 26, 54, 64, 72, 76, 80}
# KERNEL: Randomized Successfully

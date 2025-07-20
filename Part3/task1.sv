//Write a constraint that have array of 6 integers and each value should be odd , multiple of 3 . the ranges of values should be in between 15 to 75 and no duplicate values.
class task1;
  rand int data[6];
  constraint cons1{foreach(data[i]) 
    data[i]%2==1 &&   //odd values
    data[i]%3==0 &&   //multiples of 3
    data[i] inside{[15:75]};
  }
  constraint cons2{
    unique {data};
  }
  function void post_randomize();
    $display("Randomized Data = %p",data);
  endfunction
endclass
module test();
  task1 t;
  initial begin
    t = new();
    if(t.randomize())
      $display("Randomization Successfull");
    else
      $display("Randomization Failed");
  end
endmodule


//Output:
# KERNEL: Randomized Data: '{33, 63, 21, 27, 51, 75}
# KERNEL: Randomization Successful

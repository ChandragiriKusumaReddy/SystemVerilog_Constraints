//Write a constraint such that in an array of size is 10, and the difference between every two adjacent elements is 3
class task4;
  rand int data[10];
  constraint cons{
    foreach(data[i])  data[i] inside {[1:100]};
    if(i>0)
      data[i]==data[i-1]+3;
  }
  module test;
    task4 t;
    initial begin
      t=new();
      t.randomize();
      $display("Data=%p",t.data);
    end
  endmodule


  //Output:
  # KERNEL: Data='{13, 16, 19, 22, 25, 28, 31, 34, 37, 40}

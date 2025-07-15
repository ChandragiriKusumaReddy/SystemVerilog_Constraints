//Write a constraint to generate an array of size 6, and each element should be in between 10 and 20, and the sum of the elements must be 100
class taks5;
  rand int data[];
  constraint cons1{
    data.size==6;
  }
  constraint cons2{
    foreach(data[i] data inside {[10:20]};
  }
  constraint cons3{
    data.sum()==100;       
  }
endclass
module test;
  task5 t;
  initial begin
    t=new();
    assert(t.randomize());
    $display("Data=%p",t.data);
  end
endmodule


//Output:
# KERNEL: Data='{15, 16, 15, 15, 19, 20}

//Write a constraint to randomize an array of size 10 such that the number must be a power of 2, and the randomized numbers in the array must be greater than 8 or equal to 8
class task_9;
  rand int da[];
  constraint c1{da.size==10;}
  constraint c2{foreach(da[i])
    da[i]==2**(i+3);}
endclass
task_9 t;
module test;
  initial begin
    t = new();
    assert(t.randomize());
    $display("Data=%p",t.da);
  end
endmodule

//Output : Data='{8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096}

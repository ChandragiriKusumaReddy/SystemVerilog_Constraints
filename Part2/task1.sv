//Write a constraint to generate a random 5-bit number that is divisible by 4 but not divisible by 6.Ensure the number falls within the range 0 to 31.
class task_1;
  rand bit[4:0]da;
  constraint c1{da inside{[0:31]};}
  constraint c2{(da%4==0)&&(da%6!=0);}
endclass
task1 t;
module test;
  initial begin
    repeat(5)
      t = new();
    assert(t.randomize());
    $display("Data=%d",t.da);
  end
endmodule

//Output: Data=28

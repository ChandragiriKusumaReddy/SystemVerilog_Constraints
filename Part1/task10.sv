//Write a constraint to generate 8-bit random number such that number is divisible by 3, Additionally ensure that the 8-bit number must have an even number of 1's
class task_10;
  rand bit[7:0]da;
  constraint c1{da%3==0;}
  constraint c2{$countones(da)==0 || $countones(da)==2 || $countones(da)==4 || $countones(da)==6 || $countones(da)==8 ;}
endclass
task_10 t;
module test;
  initial begin
    repeat(5)
      t=new();
    assert(t.randomize());
    $display("Data=%b",t.da);
  end
endmodule

//Output: Data=11000011

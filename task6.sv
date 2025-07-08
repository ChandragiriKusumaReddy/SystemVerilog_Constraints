//Write a constraint to generate a number such that number is always a multiple of 4 and is less than 20 . This means that possible values for rand number can be 0,4,8,12,or 16
class task_6;
  rand bit[4:0]a;
  constraint c1{a<20;}
  constraint c2{a%4==0;}
endclass
task_6 t;
module test;
  initial begin
    repeat(5)
      t=new();
      assert(a.randomize);
    $display("Value of a=%d",t.a);
  end
endmodule

//Write a constraint that generate a random number 'a' between 1 to 50, the number must not be divisible by 2,3,and 5.
class task_2;
  rand int a;
  constraint c1{a inside{[1:31]};}
  constraint c2{(a%2!=0) && (a%3!=0) && (a%5!=0);}
endclass
task_2 t;
module test;
  initial begin
    repeat(5)
      t=new();
    assert(t.randomize());
    $display("Data=%d",t.a);
    end
endmodule

//Output : Data=31

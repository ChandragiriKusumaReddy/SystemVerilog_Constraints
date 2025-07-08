//Write a constraint to generate a pattern 5,4,3,2,1 (Reverse Count Pattern)
class task_7;
  rand bit[3:0]da[];
  constraint c1{da.size==5;}
  constraint c2{foreach(da[i])
    da[i]==5-i;}
endclass
task_7 t;
module test;
  initial begin
    t = new();
    assert(t.randomize());
    $display("Data=%p"t.da);
  end
endmodule


//Output :
//Data = '{5,4,3,2,1}

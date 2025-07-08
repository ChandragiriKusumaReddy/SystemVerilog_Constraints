//Write a constraint to fill an array with the first 5 square numbers :1,4,9,16,25.
class task_8;
  rand [7:0] da[];
  constraint c1{da.size==5;}
  constraint c2{foreach(da[i])
    da[i]==(i+1)**2;}
endclass
task_8 t;
module test;
  initial begin
    t = new();
    assert(t.randomize());
    $display("Data=%p"t.da);
  end
endmodule

//Output : Data='{1,4,9,16,25}

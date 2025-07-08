//Constraint that generates 1010101010 pattern
class cons;
  rand int a[];
  constraint x{a.size==10;}
  constraint x1{foreach(a[i])
    if(i%2==0)
      a[i]==1;
                else
                  a[i]==0;}
  function void post_randomize();
    $display("randomization data %0p",a);
  endfunction
endclass
module top;
  cons c;
  initial begin
    c=new();
    c.randomize();
  end
endmodule

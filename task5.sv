//Constraint that generates 00110011001100110011
class cons;
  rand bit [1:0]a [11:0];
  constraint x1{foreach(a[i])
    if(i%2==0)
      a[i]==2'b11;
                else
                  a[i]==2'b00;}
  function void post_randomize();
    foreach(a[i]) begin
      $write("%02b",a[i]);
    end
  endfunction
endclass
module top;
  cons c;
  initial begin
    c=new();
    c.randomize();
  end
endmodule
  
    

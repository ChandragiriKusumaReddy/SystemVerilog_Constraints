//Write a constraint for two random 8-bit numbers such that: a is always greater than b
class example;
  rand bit [7:0] a,b;
  constraint relational_c { a > b;}
endclass
module tb;
  example ex = new();
  initial begin
    repeat(5) begin
      ex.randomize();
      $display("a = %p, b = %p",ex.a,ex.b);
    end
  end
endmodule

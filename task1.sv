class example;
  rand bit [3:0] num;
  constraint num_c { num>=5; num<=10;}
endclass
module tb;
  example ex=new();
  initial begin
    repeat(5) begin
      ex.randomize();
      $display("num=%p",ex.num);
    end
  end
endmodule

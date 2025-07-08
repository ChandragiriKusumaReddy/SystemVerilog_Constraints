//Write a constraint for an 8-bit opcode such that: It can only take the values 0x10, 0x20, or 0x30.
class example;
  rand bit [7:0] opcode;
  constraint op_c { opcode inside {8'h10, 8'h20, 8'h30}; }
endclass
module tb;
  example ex = new();
  initial begin
    repeat(5) begin
      ex.randomize();
      $display("opcode = %p",ex.opcode);
    end
  end
endmodule

//Write a constraint such that the binary representation of a number is palindromic
class task9;
  rand bit [4:0] val;

  constraint palin_bits {
    val[0] == val[4];
    val[1] == val[3];
    // val[2] is the center — doesn’t need mirroring
  }
endclass

module test;
  task9 t;

  initial begin
    t = new();
    repeat (5) begin
      if (t.randomize())
        $display("val = %0d, binary = %05b", t.val, t.val);
      else
        $display("Randomization failed");
    end
  end
endmodule



//Output:
# KERNEL: val = 21, binary = 10101
# KERNEL: val = 17, binary = 10001
# KERNEL: val = 27, binary = 11011
# KERNEL: val = 31, binary = 11111
# KERNEL: val = 21, binary = 10101

// Struct-Based Constraint :Model a packet using a struct inside a class and randomize it with constraints: addr (8-bit): must be a multiple of 4 and in the range [16:128] , data (16-bit): if addr > 64, then data must be even , op (2-bit): 0 = NOP, 1 = READ, 2 = WRITE, 3 = INVALID , Only allow 1 (READ) or 2 (WRITE)
class task5;
  typedef struct packed{
     bit [7:0] addr;
     bit [15:0] data;
     bit [1:0] op;
  } packet_s;
  rand packet_s pkt;
  constraint c_addr{
    pkt.addr inside{[16:128]};
    pkt.addr%4==0;
  }
  constraint c_data{
    if(pkt.addr>64)
      pkt.data%2==0;
  }
  constraint c_op{
    pkt.op inside{1,2};
  }
  function void post_randomize();
    string op_str;
    case(pkt.op)
      0: op_str = "NOP";
      1: op_str = "READ";
      2: op_str = "WRITE";
      3: op_str = "INVALID";
    endcase
    $display("ADDR = %0d, DATA = %0d, OP = %s", pkt.addr, pkt.data, op_str);
  endfunction
endclass
module test();
  task5 t;
  initial begin
    t=new();
    repeat(5) begin
      if(t.randomize())
        $display("Randomization Successfull");
      else
        $display("Randomization Failed");
    end
  end
endmodule

//Output:
# KERNEL: ADDR = 24, DATA = 26045, OP = READ
# KERNEL: Randomization Successfull
# KERNEL: ADDR = 28, DATA = 43563, OP = READ
# KERNEL: Randomization Successfull
# KERNEL: ADDR = 124, DATA = 11328, OP = WRITE
# KERNEL: Randomization Successfull
# KERNEL: ADDR = 44, DATA = 34356, OP = WRITE
# KERNEL: Randomization Successfull
# KERNEL: ADDR = 20, DATA = 23746, OP = WRITE
# KERNEL: Randomization Successfull

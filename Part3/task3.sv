//Design a class with a rand bit id with size 4 , a rand string packet_type with 3 possible values: "read", "write", "idle",the packet_type should be chosen with 70% "read", 20% "write", 10% "idle",id should be in the range 1 to 10,add a rand int size between 1 and 128 ,Constraint: If packet_type is "read" → size should be ≤ 32 and add a solve packet_type before size; constraint.
typedef enum {READ,WRITE,IDLE} pkt_type_e;
class task3;
  rand bit [3:0] id;
  rand pkt_type_e packet_type;
  rand int size;
  
  constraint c_id{
    id inside{[1:10]};
  }
  constraint c_size_range{
    size inside{[1:128]};
  }
  constraint c_packet_weight{
    packet_type dist{READ:=70,WRITE:=20,IDLE:=10};
  }
  constraint c_conditional_size{
    if(packet_type == READ)
      size<=32;
  }
  constraint slove_order{
    solve packet_type before size;
  }
  function void post_randomize();
    $display("ID = %0d | Type = %s | Size = %0d",id,packet_type.name(),size);
  endfunction
endclass
module test();
  task3 t;
  initial begin
    t = new();
    repeat(5)
      begin
        if(t.randomize())
          $display("Transaction OK");
        else
          $display("Randomization Fail");
      end
  end
endmodule


//Output:
# KERNEL: ID = 1 | Type = READ | Size = 29
# KERNEL: Transaction OK
# KERNEL: ID = 7 | Type = READ | Size = 31
# KERNEL: Transaction OK
# KERNEL: ID = 5 | Type = WRITE | Size = 93
# KERNEL: Transaction OK
# KERNEL: ID = 9 | Type = READ | Size = 1
# KERNEL: Transaction OK
# KERNEL: ID = 9 | Type = WRITE | Size = 83
# KERNEL: Transaction OK

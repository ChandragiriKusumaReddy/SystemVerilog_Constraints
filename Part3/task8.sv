// Struct-Based Constraint (with arithmetic condition) Define a struct with id and value. Constraint: if id != 0, then value should be a multiple of id.
class task8;
  typedef struct packed{
    bit [3:0] id;
    bit [7:0] value;
  }my_struct;
  rand my_struct s;
  constraint cons1{
    s.id !=0;
  }
  constraint cons2{
    s.value%s.id==0;
  }
  function void post_randomize();
    $display("id=%0d, value=%0d",s.id,s.value);
  endfunction
endclass
module test();
  initial begin
    task8 t=new();
    repeat(5) begin
      if(t.randomize())
        $display("Randomization Successfull");
      else
        $display("Randomization Failed");
    end
  end
endmodule

//Output:
# KERNEL: id=1, value=34
# KERNEL: Randomization Successfull
# KERNEL: id=4, value=84
# KERNEL: Randomization Successfull
# KERNEL: id=1, value=60
# KERNEL: Randomization Successfull
# KERNEL: id=1, value=165
# KERNEL: Randomization Successfull
# KERNEL: id=4, value=96
# KERNEL: Randomization Successfull

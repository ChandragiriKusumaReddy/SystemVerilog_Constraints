//Write a constraint to generate an array such that the sum of the first half is equal to the sum of the second half
class task3;
  rand int data[6];
  constraint cons1 { foreach(data[i])
    data[i] inside {[1:100]};
  }
  constraint cons2 { foreach(data[i])
    (data[0]+data[1]+data[2])==(data[3]+data[4]+data[5]);
  }
endclass
module test;
  int first,second;
  task3 t;
  initial begin
    t=new();
    if(t.randomize())
      begin
        $display("Data=%p"t.data);
        first=t.data[0]+t.data[1]+t.data[2];
        second=t.data[3]+t.data[4]+t.data[5];
        $display("Test Passed first=%0d == second=%0d",first,second);
      end
    else
      $display("Randomization Fail");
  end
endmodule


//Output:
# KERNEL: Data='{45, 56, 55, 27, 87, 42}
# KERNEL: Test Passed first=156 == second=156

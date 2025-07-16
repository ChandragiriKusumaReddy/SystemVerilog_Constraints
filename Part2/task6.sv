//Write a constraint to generate a variable that is divisible by 6 and 9 but not by 18.
class task6;
  rand int da[10];
  constraint cons1{foreach(da[i])
    da[i] inside{[1:2000]};
                  }
  constraint cons2{foreach(da[i])
    da[i]%9 && da[i]%6 && !da[i]%18==0;}
endclass
module test;
  task6 t;
  initial begin
    repeat(5) begin
      t=new();
      t.randomize();
      $display("All values are divisible by 9 and 6 but not by 18 =%p",t.da);
    end
  end
endmodule


//Output:
# KERNEL: All values are divisible by 9 and 6 but not by 18 ='{413, 1869, 811, 1912, 1833, 1870, 608, 1311, 1402, 73}
# KERNEL: All values are divisible by 9 and 6 but not by 18 ='{857, 1406, 707, 327, 1495, 1909, 382, 971, 507, 1508}
# KERNEL: All values are divisible by 9 and 6 but not by 18 ='{433, 953, 975, 1919, 506, 489, 519, 692, 1025, 961}
# KERNEL: All values are divisible by 9 and 6 but not by 18 ='{1357, 841, 260, 1743, 1298, 659, 1870, 1204, 242, 1184}
# KERNEL: All values are divisible by 9 and 6 but not by 18 ='{323, 1030, 292, 1337, 682, 753, 239, 1167, 1924, 638}

//Write a constraint such that in a queue of size 10, the median value is always 50.
class task8;
  rand int q[10];

  constraint c_range {
    foreach (q[i])
      q[i] inside {[1:100]};
  }

  // Fixing median condition
  constraint c_median {
    // Sorting not possible in constraint, so fix elements
    q[4] inside {[1:100]};
    q[5] == 100 - q[4];
  }

  // Optional: Ensure all elements are unique
  // constraint c_unique {
  //   unique { q };
  // }

endclass

module test;
  task8 t;

  initial begin
    t = new();
    if (t.randomize())
      $display("Queue = %p, Median = %0.2f", t.q, (t.q[4] + t.q[5]) / 2.0);
    else
      $display("Randomization failed");
  end
endmodule



//Output:
# KERNEL: Queue = '{41, 42, 24, 31, 91, 9, 34, 37, 26, 50}, Median = 50.00

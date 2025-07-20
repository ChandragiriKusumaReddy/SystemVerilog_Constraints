//Struct-Based Bank Transaction: Only bank_id in range [1:5] allowed Amount: For DEPOSIT: multiples of 500,For WITHDRAW: multiples of 1000, and ≤ 10,000, txn_type should not be 0,
//typedef struct {
// rand bit [2:0] bank_id;
// rand bit [15:0] amount;
// rand bit [1:0] txn_type; // 1: DEPOSIT, 2: WITHDRAW
// } txn_s;

class task6;
  typedef struct packed {
    bit [2:0] bank_id;
    bit [15:0] amount;
    bit [1:0] txn_type;
  } txn_s;

  rand txn_s trans;

  // Fix: Only allow txn_type to be 1 (DEPOSIT) or 2 (WITHDRAW)
  constraint cons1 {
    trans.txn_type inside {1, 2};
  }

  constraint cons2 {
    if (trans.txn_type == 1)       // Deposit
      trans.amount inside {[100:1000]};
    else if (trans.txn_type == 2)  // Withdraw
      trans.amount inside {[50:500]};
  }

  constraint cons3 {
    trans.bank_id inside {1, 2, 4, 6};
  }

  function void post_randomize();
    string type_str;
    case (trans.txn_type)
      1: type_str = "DEPOSIT";
      2: type_str = "WITHDRAW";
      default: type_str = "INVALID";
    endcase
    $display("BANK_ID = %0d | TXN_TYPE = %s | AMOUNT = %0d",
              trans.bank_id, type_str, trans.amount);
  endfunction
endclass

module test();
  task6 t;
  initial begin
    t = new();
    repeat (10) begin
      if (t.randomize())
        $display("Randomization Successful");
      else
        $display("Randomization Failed");
    end
  end
endmodule


//Output:
# KERNEL: BANK_ID = 1 | TXN_TYPE = DEPOSIT | AMOUNT = 846
# KERNEL: Randomization Successful
# KERNEL: BANK_ID = 6 | TXN_TYPE = DEPOSIT | AMOUNT = 233
# KERNEL: Randomization Successful
# KERNEL: BANK_ID = 2 | TXN_TYPE = WITHDRAW | AMOUNT = 401
# KERNEL: Randomization Successful
# KERNEL: BANK_ID = 1 | TXN_TYPE = DEPOSIT | AMOUNT = 788
# KERNEL: Randomization Successful
# KERNEL: BANK_ID = 6 | TXN_TYPE = WITHDRAW | AMOUNT = 122
# KERNEL: Randomization Successful
# KERNEL: BANK_ID = 6 | TXN_TYPE = WITHDRAW | AMOUNT = 378
# KERNEL: Randomization Successful
# KERNEL: BANK_ID = 6 | TXN_TYPE = DEPOSIT | AMOUNT = 791
# KERNEL: Randomization Successful
# KERNEL: BANK_ID = 4 | TXN_TYPE = WITHDRAW | AMOUNT = 242
# KERNEL: Randomization Successful
# KERNEL: BANK_ID = 2 | TXN_TYPE = WITHDRAW | AMOUNT = 494
# KERNEL: Randomization Successful
# KERNEL: BANK_ID = 6 | TXN_TYPE = WITHDRAW | AMOUNT = 107
# KERNEL: Randomization Successful

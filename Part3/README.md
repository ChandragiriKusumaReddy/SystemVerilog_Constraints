# SystemVerilog_Constraints-Part3
1. Write a constraint that have array of 6 integers and each value should be odd , multiple of 3 . the ranges of values should be in between 15 to 75 and no duplicate values.
2. Write a constraint such that the array size is 8 , values should be in between 1 to 100 , if data is divisible by 10 the the data must be even else the data must be odd and no values should be zero and all the values must be unique.
3. Design a class with a rand bit id with size 4 , a rand string packet_type with 3 possible values: "read", "write", "idle",the packet_type should be chosen with 70% "read", 20% "write", 10% "idle",id should be in the range 1 to 10,add a rand int size between 1 and 128 ,Constraint: If packet_type is "read" → size should be ≤ 32 and add a solve packet_type before size; constraint.
4. Index-based constraint:
Write a constraint for a rand int data[8] array such that: all values are in the range [10:80], each data[i+1] > data[i] + 3 for all valid i, all values must be even, all values must be unique.
5. Struct-Based Constraint :Model a packet using a struct inside a class and randomize it with constraints: addr (8-bit): must be a multiple of 4 and in the range [16:128] , data (16-bit): if addr > 64, then data must be even , op (2-bit): 0 = NOP, 1 = READ, 2 = WRITE, 3 = INVALID , Only allow 1 (READ) or 2 (WRITE)
6. Struct-Based Bank Transaction: Only bank_id in range [1:5] allowed Amount: For DEPOSIT: multiples of 500,For WITHDRAW: multiples of 1000, and ≤ 10,000, txn_type should not be 0,
 typedef struct {
  rand bit [2:0] bank_id;
  rand bit [15:0] amount;
  rand bit [1:0] txn_type; // 1: DEPOSIT, 2: WITHDRAW
 } txn_s;
7. Index-Dependent Array Constraint: Write a constraint and create a dynamic array of 5 elements (int data[]) such that each element at index i is equal to i * 10.
8. Struct-Based Constraint (with arithmetic condition) Define a struct with id and value. Constraint: if id != 0, then value should be a multiple of id.

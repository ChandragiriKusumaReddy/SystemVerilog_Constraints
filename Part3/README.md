# SystemVerilog_Constraints-Part3
1. Write a constraint that have array of 6 integers and each value should be odd , multiple of 3 . the ranges of values should be in between 15 to 75 and no duplicate values.
2. Write a constraint such that the array size is 8 , values should be in between 1 to 100 , if data is divisible by 10 the the data must be even else the data must be odd and no values should be zero and all the values must be unique.
3. Design a class with a rand bit id with size 4 , a rand string packet_type with 3 possible values: "read", "write", "idle",the packet_type should be chosen with 70% "read", 20% "write", 10% "idle",id should be in the range 1 to 10,add a rand int size between 1 and 128 ,Constraint: If packet_type is "read" → size should be ≤ 32 and add a solve packet_type before size; constraint.


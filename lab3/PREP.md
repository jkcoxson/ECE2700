# Lab Prep

2. Suppose we want to switch between three-bit numbers a and b (i.e. a has digits a0, a1, and a2,
and b is also a vector of three bits). How would you interconnect 2-to-1 MUXes in order to select
a if sel==1, or b if sel==0?

```verilog
assign S       = (sel) ? a1 : a2;
```

4. Assuming the delay of a 4-bit ripple carry adder is 4 and a multiplexor is 1, compare the delay of
a 16-bit ripple carry adder to a 16-bit carry-select adder.

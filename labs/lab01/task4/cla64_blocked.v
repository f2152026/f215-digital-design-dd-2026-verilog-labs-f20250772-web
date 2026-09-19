// cla64_blocked.v
// A practical 64-bit adder: sixteen 4-bit CLA blocks (your cla4.v),
// chained by feeding block k's carry-out into block (k+1)'s carry-in --
// the same instantiate-and-chain pattern as Task 2's ripple adder, just
// using 4-bit CLA blocks instead of single full adders.

module cla64_blocked(
  input  [63:0] a,
  input  [63:0] b,
  input         cin,
  output [63:0] sum,
  output        cout
);

  wire [16:0] c;   // Internal carry vector connecting the 16 blocks

  assign c[0] = cin;
  assign cout = c[16];

  genvar i;
  generate
    for (i = 0; i < 16; i = i + 1) begin : gen_cla4_blocks
      cla4 block_inst (
        .a(a[4*i + 3 : 4*i]),
        .b(b[4*i + 3 : 4*i]),
        .cin(c[i]),
        .sum(sum[4*i + 3 : 4*i]),
        .cout(c[i+1])
      );
    end
  endgenerate

endmodule
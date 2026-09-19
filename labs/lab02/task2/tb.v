// tb.v
// Complete testbench for lut.v

module tb;

  parameter WIDTH = 8;
  parameter DEPTH = 4;

  // TODO: declare the inputs and outputs
  reg  [$clog2(DEPTH)-1:0] t_sel;
  wire [WIDTH-1:0]         t_dout;

  // TODO: instantiate DUT here
  lut #(
    .WIDTH(WIDTH),
    .DEPTH(DEPTH)
  ) DUT (
    .sel (t_sel),
    .dout(t_dout)
  );

  // Waveform dump configuration (DO NOT CHANGE)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);
    end
  end

  integer i;
  initial begin
    // TODO: apply different input combinations
    for (i = 0; i < DEPTH; i = i + 1) begin
      t_sel = i;
      #5;
    end
    $finish;
  end

  initial
    $monitor($time, " sel=%0d | dout=%0d (0x%h)", t_sel, t_dout, t_dout);

endmodule
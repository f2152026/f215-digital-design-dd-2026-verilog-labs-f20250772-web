module alu_tb;
    reg  [3:0] a;
    reg  [3:0] b;
    reg        op;

    wire [3:0] out;

    integer error_count = 0;
    reg  [3:0] expected_out;

    alu dut (
        .a(a),
        .b(b),
        .op(op),
        .result(out)
    );
    
    initial begin

        error_count = 0;
        a  = 4'b0000;
        b  = 4'b0000;
        op = 1'b0;

        a = 4'd7; 
        b = 4'd3;
        op = 1'b0;

        expected_out = a + b;
        #1;

        if (out !== expected_out) begin
            $display("[ERROR] Time=%0t | op=%b, a=%0d (%4b), b=%0d (%4b) | Expected out=%0d (%4b), Got out=%0d (%4b)",
                     $time, op, a, a, b, b, expected_out, expected_out, out, out);
            error_count = error_count + 1;
        end

        op = 1'b1;
        expected_out = a + (~b + 4'd1);
        #1;

        if (out !== expected_out) begin
            $display("[ERROR] Time=%0t | op=%b, a=%0d (%4b), b=%0d (%4b) | Expected out=%0d (%4b), Got out=%0d (%4b)",
                     $time, op, a, a, b, b, expected_out, expected_out, out, out);
            error_count = error_count + 1;
        end

        a = 4'd12; 
        b = 4'd5;
        op = 1'b0;

        expected_out = a + b; 
        #1;

        if (out !== expected_out) begin
            $display("[ERROR] Time=%0t | op=%b, a=%0d (%4b), b=%0d (%4b) | Expected out=%0d (%4b), Got out=%0d (%4b)",
                     $time, op, a, a, b, b, expected_out, expected_out, out, out);
            error_count = error_count + 1;
        end

        op = 1'b1;

        expected_out = a + (~b + 4'd1); 
        #1;

        if (out !== expected_out) begin
            $display("[ERROR] Time=%0t | op=%b, a=%0d (%4b), b=%0d (%4b) | Expected out=%0d (%4b), Got out=%0d (%4b)",
                     $time, op, a, a, b, b, expected_out, expected_out, out, out);
            error_count = error_count + 1;
        end

        a = 4'd2; 
        b = 4'd6;
        op = 1'b0;

        expected_out = a + b; 
        #1;
        
        if (out !== expected_out) begin
            $display("[ERROR] Time=%0t | op=%b, a=%0d (%4b), b=%0d (%4b) | Expected out=%0d (%4b), Got out=%0d (%4b)",
                     $time, op, a, a, b, b, expected_out, expected_out, out, out);
            error_count = error_count + 1;
        end

        op = 1'b1;

        expected_out = a + (~b + 4'd1); 
        #1;

        if (out !== expected_out) begin
            $display("[ERROR] Time=%0t | op=%b, a=%0d (%4b), b=%0d (%4b) | Expected out=%0d (%4b), Got out=%0d (%4b)",
                     $time, op, a, a, b, b, expected_out, expected_out, out, out);
            error_count = error_count + 1;
        end

        if (error_count == 0) begin
            $display("TEST PASSED: 0 errors detected.");
        end else begin
            $display("TEST FAILED: Total Errors = %0d", error_count);
        end

        $finish;
    end
endmodule
module comp2_tb;
    reg [1:0] A;
    reg [1:0] B;
    wire GT;
    wire LT;
    wire EQ;

    reg exp_GT;
    reg exp_LT;
    reg exp_EQ;
    integer errors = 0;
    integer total = 0;
    integer i, j;

    comp2 DUT (
        .A(A),
        .B(B),
        .GT(GT),
        .LT(LT),
        .EQ(EQ)
    );

    initial begin
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                A = i[1:0];
                B = j[1:0];
                #10; // Wait for propagation

                // Independently compute expected outputs
                exp_GT = (A > B);
                exp_LT = (A < B);
                exp_EQ = (A == B);

                // Compare actual outputs against expected using !==
                if ((GT !== exp_GT) || (LT !== exp_LT) || (EQ !== exp_EQ)) begin
                    $display("MISMATCH [A=%b, B=%b] | Expected: GT=%b LT=%b EQ=%b | Got: GT=%b LT=%b EQ=%b",
                             A, B, exp_GT, exp_LT, exp_EQ, GT, LT, EQ);
                    errors = errors + 1;
                end
                
                total = total + 1;
            end
        end
        $write("%0d out of %0d tests passed", (total - errors), total);
        $write(" (%0d total errors).\n", errors);

        $finish;
    end
endmodule
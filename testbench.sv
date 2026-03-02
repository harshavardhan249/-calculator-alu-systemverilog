//------------------------------------------------------------------------------
// File        : tb_alu.sv
// Author      : Kartik Malipatil / 1BM23EC117
// Created     : 2026-02-03
// Module      : tb_alu
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//------------------------------------------------------------------------------// Code your testbench here
// or browse Examples
module tb_alu;

    logic [7:0] a, b;
    logic [1:0] opcode;
    logic [15:0] result;

    alu dut (
        .a(a),
        .b(b),
        .opcode(opcode),
        .result(result)
    );

    alu_trans tr;

    initial begin
        tr = new();

        repeat (20) begin
            assert(tr.randomize());
            
            a = tr.a;
            b = tr.b;
            opcode = tr.opcode;

            #5;
            tr.display();
            $display("Result = %0d\n", result);
        end

        $finish;
    end

endmodule

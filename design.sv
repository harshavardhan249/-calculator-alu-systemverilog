//------------------------------------------------------------------------------
// File        : alu.sv
// Author      : Kartik Malipatil / 1BM23EC117
// Created     : 2026-02-03
// Module      : alu
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description :
//   This module implements an ATM Controller using a
//   Finite State Machine (FSM). The controller processes
//   user inputs such as card insertion, PIN verification,
//   and balance validation to control cash dispensing.
//
//   The FSM consists of four states: IDLE, CHECK_PIN,
//   CHECK_BAL, and DISPENSE. Cash is dispensed only when
//   both PIN and balance conditions are satisfied.
//   SystemVerilog assertions are included to ensure that
//   cash is dispensed only under valid conditions and that
//   the system returns to the IDLE state after dispensing.
//
//------------------------------------------------------------------------------// Code your design here
module alu (
    input  logic [7:0] a,
    input  logic [7:0] b,
    input  logic [1:0] opcode,
    output logic [15:0] result
);

    always_comb begin
        case (opcode)
            2'b00: result = a + b;   // ADD
            2'b01: result = a - b;   // SUB
            2'b10: result = a * b;   // MUL
            2'b11: result = a ^ b;   // XOR
            default: result = 0;
        endcase
    end

endmodule
typedef enum logic [1:0] {
    ADD = 2'b00,
    SUB = 2'b01,
    MUL = 2'b10,
    XOR = 2'b11
} opcode_t;
class alu_trans;
    rand logic [7:0] a;
    rand logic [7:0] b;
    rand opcode_t opcode;

    // Constraint: MUL must occur at least 20%
    constraint opcode_dist {
        opcode dist {
            ADD := 30,
            SUB := 25,
            MUL := 20,
            XOR := 25
        };
    }

    function void display();
        $display("A=%0d B=%0d OPCODE=%0s",
                 a, b, opcode.name());
    endfunction
endclass

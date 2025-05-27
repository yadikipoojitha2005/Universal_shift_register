`timescale 1ns/1ps
module tb;
reg clk;
reg reset;
  reg [1:0] ctrl;
reg serial_in_left, serial_in_right;
reg [3:0] parallel_in;
wire [3:0] out;
  universal_shift_register uut (
  .clk(clk),
  .reset(reset),
  .ctrl(ctrl),
  .serial_in_right(serial_in_right),
  .serial_in_left(serial_in_left),
  .parallel_in(parallel_in),
  .out(out)
);

always #5 clk = ~clk;

initial begin
  $monitor("Time=%0t  mode=%b  out=%b", $time, ctrl, out);

   
    clk = 0; reset = 1;
   ctrl = 2'b00;
    serial_in_left = 0;
    serial_in_right = 0;
    parallel_in = 4'b0000;

    // reset
    #10 reset = 0;

    // parallel Load
    #10 parallel_in = 4'b1010;ctrl = 2'b11;

    // hold
    #10 ctrl = 2'b00;

    // shift right 
    #10 ctrl = 2'b01; serial_in_left = 1;

    // shift Right
    #10 serial_in_left = 0;

    // shift Left 
    #10 ctrl = 2'b10; serial_in_right = 1;

    // shift Left
    #10 serial_in_right = 0;

    // prallel load again
    #10 ctrl = 2'b11; parallel_in = 4'b1100;

    // hold
    #10 ctrl = 2'b00;

    #10;
  $finish;
end
endmodule

// Code your design here
 module universal_shift_register(
  input clk,
  input reset,
  input [1:0] ctrl,
  input  serial_in_right,
  input  serial_in_left,
  input [3:0] parallel_in,
   output reg [3:0] out
);
 
always @(posedge clk or posedge reset)begin
  if(reset)
    out=4'b0000;
   else begin
     case(ctrl)
       2'b00: out <=out;//hold
       2'b01: out <= {serial_in_left, out[3:1]}; //shift right
       2'b10: out <= {out[2:0], serial_in_right}; // shift left
       2'b11: out <= parallel_in;
     endcase
   end
end
endmodule

       
         
       

  
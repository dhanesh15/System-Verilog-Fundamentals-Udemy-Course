`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2024 20:26:49
// Design Name: 
// Module Name: dff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dff(dff_if vif);
always @(posedge vif.clk)
begin
    if (vif.rst == 1'b1)
        vif.dout <= 1'b0;
    else
        vif.dout <= vif.din;
end
endmodule

interface dff_if;
    logic clk;
    logic rst;
    logic din;
    logic dout;
endinterface

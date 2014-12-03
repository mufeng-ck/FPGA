// function: calculate dataa / datab;
module div32(
	clk,
	rst_n,
	dataa,
	datab,
	result);
input clk;
input rst;
input[31:0] dataa;
input[31:0] datab;
output[31:0] result;

reg[31:0] tempa[31:0], tempb[31:0];
reg[31:0] result;
generate
	genvar i;
	for(i = 1; i< 31; i++)begin
		always @(posedge clk or negedge rst_n) begin : proc_
			if(~rst_n) begin
				tempa[i] <= 0;
				tempb[i] <= 0;
				result[i] <= 0;
			end else begin
				if(tempa[i] > tempb[i])begin
					tempa[i + 1] <= (tempa[i] - tempb[i])<<1 + dataa[]
				 <= ;
			end
		end

endmodule
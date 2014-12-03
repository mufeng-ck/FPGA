// function: calculate dataa / datab;
module div32(
	clk,
	rst_n,
	dataa,
	datab,
	quotient);
input clk;
input rst_n;
input[31:0] dataa;
input[31:0] datab;
output[31:0] quotient;//商

reg[31:0] tempa[31:0], tempb[31:0];
reg[31:0] store[31:0];
reg[31:0] result[31:0];
always@(posedge clk or negedge rst_n)begin
	if(~rst_n) begin
		tempa[0] <= 0;
		tempb[0] <= 0;
		store[0] <= 0;
		result[0] <= 0;
	end
	else begin
		tempa[0] = {31'd0, dataa[31]};
		tempb[0] = datab;
		store[0] = dataa;
		result[0] <= 0;
	end
end
generate
	genvar i;
	for(i = 0; i< 31; i=i+1)begin
		always @(posedge clk or negedge rst_n) begin:gen_
			if(~rst_n) begin
				tempa[i+1] <= 0;
				tempb[i+1] <= 0;
				result[i+1] <= 0;
			end else begin
				store[i+1] <= (store[i]<<1);
				tempb[i + 1] <= tempb[i];
				if(tempa[i] >= tempb[i])begin
					tempa[i + 1] <= (tempa[i] - tempb[i])<<1 + store[i][31];
					result[i + 1] <= (result[i]<<1) + 1;
				end
				else begin
					tempa[i+1] <= (tempa[i] << 1) + store[i][31];
					result[i+1] <= (result[i] << 1);
				end
			end
		end
	end
endgenerate
assign quotient = result[31];
endmodule
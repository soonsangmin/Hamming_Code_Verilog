module tb;

	// Inputs
	reg clk_enc;
	reg [4:1] enc_data;

	// Outputs
	wire [7:1] codeword_out;

	// Instantiate the Unit Under Test (UUT)
	hamming_encoder uut (
		.clk_enc(clk_enc), 
		.enc_data(enc_data), 
		.codeword_out(codeword_out)
	);

	initial
begin
forever
begin
clk_enc=1;
#50 clk_enc=0;
#50 clk_enc=1;
end
end
initial begin
    enc_data = 4'b0000;
    #100 enc_data = 4'b0001;
    #100 enc_data = 4'b0010;
    #100 enc_data = 4'b0011;
    #100 enc_data = 4'b0100;
    #100 enc_data = 4'b0101;
    #100 enc_data = 4'b0110;
    #100 enc_data = 4'b0111;
    #100 enc_data = 4'b1000;
    #100 enc_data = 4'b1001;
    #100 enc_data = 4'b1010;
    #100 enc_data = 4'b1011;
    #100 enc_data = 4'b1100;
    #100 enc_data = 4'b1101;
    #100 enc_data = 4'b1110;
    #100 enc_data = 4'b1111;
end

endmodule 
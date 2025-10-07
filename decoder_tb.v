module tbb;

	// Inputs
	reg [1:7] dec_data;
	reg clk_dec;
	// Outputs
	wire [1:3] err_bits_dec;
	wire [1:7] corrected_data_dec;
	wire [1:4] out_data_dec;

	// Instantiate the Unit Under Test (UUT)
	hamming_decoder uut (
		.dec_data(dec_data), 
		.clk_dec(clk_dec), 
		.err_bits_dec(err_bits_dec), 
		.corrected_data_dec(corrected_data_dec), 
		.out_data_dec(out_data_dec)
	);

	initial begin
    // Your clock process
    forever begin
        clk_dec = 1;
        #50 clk_dec = 0;
        #50 clk_dec = 1;
    end
end
initial begin
    dec_data = 7'b0000000;
    #100 dec_data = 7'b1000111;
    #100 dec_data = 7'b0000111;
    #100 dec_data = 7'b0011110;
    #100 dec_data = 7'b0101010;
    #100 dec_data = 7'b0101101;
    #100 dec_data = 7'b0110011;
    #100 dec_data = 7'b0110100;
    #100 dec_data = 7'b1001011;
    #100 dec_data = 7'b1001100;
    #100 dec_data = 7'b1010010;
    #100 dec_data = 7'b1010101;
    #100 dec_data = 7'b1100001;
    #100 dec_data = 7'b1100110;
    #100 dec_data = 7'b1111000;
    #100 dec_data = 7'b1101010;
end
endmodule

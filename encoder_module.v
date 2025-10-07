module hamming_encoder(
    input clk_enc,
    input [4:1] enc_data ,
    input rst_enc,
    output reg [7:1] codeword_out
);

always @ (posedge clk_enc) begin
    if(rst_enc)
        codeword_out = 0;
    else begin
		codeword_out[7] = enc_data[4];
		codeword_out[6] = enc_data[3];
		codeword_out[5] = enc_data[2];
		codeword_out[4] = enc_data[2] ^ enc_data[3] ^ enc_data[4];
		codeword_out[3] = enc_data[1];
		codeword_out[2] = enc_data[1] ^ enc_data[3] ^ enc_data[4];
		codeword_out[1] = enc_data[1] ^ enc_data[2] ^ enc_data[4];
    end
end
endmodule

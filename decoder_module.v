module hamming_decoder(
    input [1:7] dec_data,
    input clk_dec,
    input rst_dec,
    output reg [1:3] err_bits_dec,
    output reg [1:7] corrected_data_dec,
    output reg [1:4] out_data_dec
);

always @(posedge clk_dec) begin
    err_bits_dec[1] = dec_data[1] ^ dec_data[2];
    err_bits_dec[2] = dec_data[1] ^ dec_data[3];
    err_bits_dec[3] = dec_data[1] ^ dec_data[5] ^ dec_data[6];
    corrected_data_dec = dec_data;
    if(err_bits_dec) 
        corrected_data_dec[err_bits_dec-1] = ~dec_data[err_bits_dec-1];
end

always @(corrected_data_dec) begin
    out_data_dec[1] = corrected_data_dec[3];
    out_data_dec[2] = corrected_data_dec[5];
    out_data_dec[3] = corrected_data_dec[6];
    out_data_dec[4] = corrected_data_dec[7];
end

endmodule

# Hamming_Code_Verilog
  1. Block Diagram
<img width="939" height="646" alt="image" src="https://github.com/user-attachments/assets/5359968e-5402-4ab7-8503-ce196edd3770" />
     Structure inside
<img width="939" height="683" alt="image" src="https://github.com/user-attachments/assets/319854e0-f444-4cc3-a669-e5ed58f243c1" />

  2. Specification
<img width="940" height="486" alt="image" src="https://github.com/user-attachments/assets/56d0e495-7c56-40fa-8115-6072be6ace9b" />

  3. Detail design
     3.1 Encoder module
         This Verilog module serves as a Hamming encoder, designed to take a 4-bit input (`enc_data`) and produce a 7-bit codeword (`codeword_out`) using the Hamming(7,4) encoding technique. The module operates based on three input signals: `clk_enc` for the clock, `enc_data` for the input data, and `rst_enc` for the reset signal. It provides one output signal, `codeword_out`, representing the encoded data. Within the `always` block, the module functions on each positive edge of the clock signal `clk_enc`. When the reset signal `rst_enc` is active, `codeword_out` is set to 0. Otherwise, during normal operation, the module calculates parity bits and constructs the codeword based on the input data `enc_data`. Parity bits are computed through XOR operations on specific input data bits. These parity bits are strategically placed within the codeword to meet the requirements of the Hamming code. Upon completion of encoding, the resulting 7-bit codeword is stored in the `codeword_out` register, ready for transmission or further processing. This module facilitates the encoding of 4-bit input data into a 7-bit codeword using the Hamming(7,4) encoding method, thereby enhancing the data's resilience to errors during transmission.
     <img width="941" height="676" alt="image" src="https://github.com/user-attachments/assets/b656f1cd-66cc-4d89-abad-dbceebaa04a1" />
     <img width="940" height="367" alt="image" src="https://github.com/user-attachments/assets/acf745aa-f94b-429b-823a-5baebc8997c6" />
     3.2 Decoder module
         This Verilog module acts as a Hamming decoder, taking a 7-bit encoded input (`dec_data`). It operates with three input signals: `clk_dec` for the clock, `rst_dec` for reset, and `dec_data` for the input to be decoded. The module outputs three signals: `err_bits_dec` (a 3-bit vector indicating error bits), `corrected_data_dec` (a 7-bit vector of corrected data), and `out_data_dec` (a 4-bit vector of the original data after correction). In operation, the decoder detects and corrects errors in the input data. It evaluates error bits using parity checks and stores them in `err_bits_dec`. The module then corrects any detected errors in `corrected_data_dec` and extracts the original 4-bit data into `out_data_dec`. This module effectively decodes Hamming(7,4) encoded data, ensuring error detection and correction, and outputs the original 4-bit data.
     <img width="939" height="630" alt="image" src="https://github.com/user-attachments/assets/01fc7ebf-175d-41eb-818e-3439de5c872c" />
     <img width="758" height="1145" alt="image" src="https://github.com/user-attachments/assets/9650eeb7-9d44-4ba7-8d18-740f2812d829" />
     
  4. Results and waveform
      4.1 Encoder module
     <img width="940" height="354" alt="image" src="https://github.com/user-attachments/assets/18e2d0df-3d41-4cd4-a71b-b687adf1d27b" />
         After running this testbench, we will observe the input data line `enc_data` and the output data line `codeword_out` of the `hamming_encoder` module in each clock cycle. The input data line `enc_data` is set to change from `0000` to `1111` sequentially after every 100ns. Each value of `enc_data` represents a 4-bit input data sequence that we want to encode using the Hamming(7,4) code. Based on the Hamming(7,4) encoding implemented in the `hamming_encoder` module, we will observe the output data line `codeword_out`. This data will consist of 7 bits, including 4 bits of original data from `enc_data` and 3 parity bits. The result of the testbench will show the values of `codeword_out` corresponding to each value of `enc_data`, and we can check whether the Hamming code has been generated correctly by verifying the evenness or oddness of the parity bits.

      4.2 Decoder module
     <img width="940" height="466" alt="image" src="https://github.com/user-attachments/assets/42094b50-e0d4-4bb2-a71f-5b4cb443d391" />
         After running the testbench of the Hamming Decoder module, we have obtained the result of the decoding process successfully and accurately. Throughout the process, we monitored the changes in the input and output signals of the module to ensure the correctness and effectiveness of the decoding process. The signal `dec_data` changed from `0000000` to `1111111` every 100ns, representing 7-bit data strings that were encoded using the Hamming code and needed to be decoded. The `clk_dec` signal generated the necessary clock pulses to synchronize the decoding process. The `err_bits_dec` signal indicated the position and number of error bits detected in the input data. When an error bit was detected, this signal indicated the position of that error bit. The `corrected_data_dec` signal displayed the data after it had been modified, in case errors were detected. Error bits were corrected to restore the original data. Finally, the `out_data_dec` signal provided the final output data of the decoding process, corrected if necessary. This was the ultimate result of the Hamming decoding process, representing data that had been accurately recovered and corrected. From these results, we can conclude that the Hamming Decoder module operated correctly and reliably, with the ability to recover errors in the input data.
     
   5. Conclusion
      In summary, Hamming code stands as a robust error detection and correction method extensively utilized in digital communication setups to ensure data integrity. Its capacity to spot and rectify single-bit errors, along with the capability to pinpoint some multiple-bit errors, renders it invaluable in contexts where data precision is paramount. By introducing redundancy to transmitted data through parity bits, Hamming code empowers receivers not just to identify errors but also to restore corrupted bits, thus elevating the reliability and resilience of the communication pathway. Despite its effectiveness, Hamming code does possess certain constraints, like its incapability to rectify all error types or the additional overhead of added bits for error correction. Nevertheless, owing to its simplicity and efficacy, Hamming code remains a favored choice across diverse applications, spanning from telecommunications to computer memory systems.





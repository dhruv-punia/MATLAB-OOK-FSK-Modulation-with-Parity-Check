# MATLAB OOK & FSK Modulation with Parity Check
An end-to-end communication protocol designed in MATLAB consisting of eight functions for implementing On-Off Keying and Frequency Shift Keying modulation and demodulation. The protocol also includes parity error detection to enhance reliability and incorporates noise simulation to mimic real-life transmission conditions

<img src="https://github.com/Dhruv-Punia/MATLAB-OOK-FSK-Modulation-with-Parity-Check/blob/main/images/full.gif" alt="image"  height="auto" class="center">

## A Closer Look

### Encoding
* Input a string from the user
* Convert it into a string of bits by 7-digit ASCII, and append a parity bit to every 7 of those bits
 <img src="https://github.com/Dhruv-Punia/MATLAB-OOK-FSK-Modulation-with-Parity-Check/blob/main/images/Encoding.gif" alt="image"  height="auto" class="center">

### Modulation
#### OOK(On-Off Keying)
* User choose method of modulation from OOK or FSK
* Pass the parity encoded bit-stream through the chosen modulation function
* Display the resulting waveform generated
<img src="https://github.com/Dhruv-Punia/MATLAB-OOK-FSK-Modulation-with-Parity-Check/blob/main/images/modulation.gif" alt="image"  height="auto" class="center">




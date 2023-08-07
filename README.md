# MATLAB OOK & FSK Modulation with Parity Check
An end-to-end communication protocol designed in MATLAB consisting of eight functions for implementing On-Off Keying and Frequency Shift Keying modulation and demodulation. The protocol also includes parity error detection to enhance reliability and incorporates noise simulation to mimic real-life transmission conditions

<img src="https://github.com/Dhruv-Punia/MATLAB-OOK-FSK-Modulation-with-Parity-Check/blob/main/images/full.gif" alt="image"  height="auto">

## Encoding
* Input a string from the user
* Convert it into a string of bits by 7-digit ASCII, and append a parity bit to every 7 of those bits
 <img src="https://github.com/dhruv-punia/MATLAB-OOK-FSK-Modulation-with-Parity-Check/blob/main/images/Encoding.gif" alt="image"  height="auto">

## Modulation
### On-Off Keying(OOK) 
On–off keying (OOK) denotes the simplest form of amplitude-shift keying (ASK) modulation that represents digital data as the presence or absence of a carrier wave. In its simplest form, the presence of a carrier for a specific duration represents a binary one, while its absence for the same duration represents a binary zero.
<p align="center">
 <img src="https://github.com/dhruv-punia/MATLAB-OOK-FSK-Modulation-with-Parity-Check/blob/main/images/modulation.png" alt="image"  width="600" height="auto">
</p>

### Frequency Shift Keying(FSK)
Frequency-shift keying (FSK) is a frequency modulation scheme in which digital information is encoded on a carrier signal by periodically shifting the frequency of the carrier between several discrete frequencies.
<p align="center">
 <img src="https://github.com/dhruv-punia/MATLAB-OOK-FSK-Modulation-with-Parity-Check/blob/main/images/fsk modulation.png" alt="image"  width="600" height="auto">
</p>

### Implementation
* User choose method of modulation from OOK or FSK
* Pass the parity encoded bit-stream through the chosen modulation function
* Display the resulting waveform generated
<img src="https://github.com/dhruv-punia/MATLAB-OOK-FSK-Modulation-with-Parity-Check/blob/main/images/modulation.gif" alt="image"  height="auto">
<img src="https://github.com/dhruv-punia/MATLAB-OOK-FSK-Modulation-with-Parity-Check/blob/main/images/modulation fsk.gif" alt="image"  height="auto">

## Transmission
* Introduce Gaussian noise to the waveform generated in the modulation step before passing it
forward to the demodulation step.
<img src="https://github.com/dhruv-punia/MATLAB-OOK-FSK-Modulation-with-Parity-Check/blob/main/images/transmission.gif" alt="image"  height="auto">

## Demodulation
* Pass the waveform attained through the demodulation function
<img src="https://github.com/dhruv-punia/MATLAB-OOK-FSK-Modulation-with-Parity-Check/blob/main/images/demodulation.gif" alt="image"  height="auto">

## Decoding
* Take the received string of bits, and byte by byte, check if the parity is consistent, and take the appropriate action
* Convert the bit-stream back into a string of characters, and display the same
 <img src="https://github.com/dhruv-punia/MATLAB-OOK-FSK-Modulation-with-Parity-Check/blob/main/images/decoding 1.gif" alt="image"  height="auto">
 
* User can also choose the function to randomly flip bits in the generated bit-stream to verify that the parity check works
* The parity encoding scheme is not all-powerful,if two data bits are corrupted,parity will not detect the error
  
 <img src="https://github.com/dhruv-punia/MATLAB-OOK-FSK-Modulation-with-Parity-Check/blob/main/images/decoding 2.gif" alt="image"  height="auto">

 
## Authors
[![][1.1]][1] **Dhruv Punia**


  
 [1.1]: https://github.com/dhruv-punia/MATLAB-OOK-FSK-Modulation-with-Parity-Check/blob/main/images/logo1.png
 [1]: https://www.linkedin.com/in/dhruvpunia/


 

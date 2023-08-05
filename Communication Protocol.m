clc
clear all
close all


%% Main(UI) Function

user_input = input("Please enter the message to be encoded : ",'s');
encoded_msg = encoder(user_input);
disp(['Bit Stream : ', encoded_msg]);% Displays the Bit Stream as outputted by Encoding Function

user_input_trans=input("Choose method of Transmission (1 - OOK) (2 - FSK) : ");
if user_input_trans == 2 % Use OOK Modulation & Demodulation

    fsk_mod(encoded_msg);
    disp('Transmission In Process');
    demod_bitstream=fsk_demod();
    disp(['Demodulated Bit Stream : ', demod_bitstream]);

elseif user_input_trans == 1 % Use FSK Modulation & Demodulation

    ook_mod(encoded_msg);
    disp('Transmission In Process');
    demod_bitstream=ook_demod();
    disp(['Demodulated Bit Stream : ', demod_bitstream]);

else
    disp("Invalid Input");
end

select=input("Enter (1 - Decode) (2 - Flip Bits and Decode) : "); % Decoding the Demodulated Bit Stream & Converting to String
if select==1
    decoded_msg=decoder(demod_bitstream,0);
    disp(['Decoded Message : ', decoded_msg]);
elseif select==2
    decoded_msg=decoder(demod_bitstream,1);
    disp(['Decoded Message : ', decoded_msg]);
else
    disp("Invalid Input");
end




%% Encoding(1's Parity) Function

function encoded = encoder(string)

ascii=uint8(string);
binary=dec2bin(ascii);
cnt=sum(binary,2); % Finds the Sum of each Row to find No. of 1's
parity_bit=rem(cnt,2); % Calculates the remainder of Sum/2
parity_bit=num2str(parity_bit);
binary=[binary parity_bit]; % Concatenates Parity Bit to original Binary
final_message=(binary)';
final_message=final_message(:); % Append into Single Bit Stream
final_message=(final_message)';
encoded = final_message; % Final Bit Stream

end

%% Decoding(Parity Checker) Function

function decoded = decoder(binary,flip)

if flip==1  % Flip Bits depending on User Input
    binary=n_bit_flipper(binary); % Calling function to Flip Bits
end

binary=reshape(binary,8,[])';% Convert into a matrix (Columns = 8 & Rows = No. of Chars)
parity_bit=binary(:,8); % Separate Parity Bits
binary(:,8)=[]; % Remove Parity Column from the Matrix

cnt=sum(binary,2); % Calculate Parity Bits again
parity_msg=rem(cnt,2);
parity_msg=num2str(parity_msg);

if parity_msg==parity_bit % Check if Calculated Parity == Original Parity

    ascii=bin2dec(binary);
    decoded=native2unicode(ascii,'ASCII');
    decoded=(decoded)';

else

    disp("! Message Corrupted !")
    decoded='! Parity Check Failed !';

end

end

%% Bit Flip Function

function n_bit_flipped=n_bit_flipper(binary) % Chooses Rnadom No. of Bits to Flip 

max__bit_flips=5;
n=randi([1 max__bit_flips]); 

for i=1:n
    binary = bit_flipper(binary); % Run the function to actually flip the Bits n times

end

n_bit_flipped=binary; % Outputting Modified Bit Stream

end

function flipped_binary=bit_flipper(binary) %Function to flip the Bits by choosing it randomly from Bitstream

flipped_binary=binary;
len=size(binary,2); 
rand_bit_flip=randi([1 len]); % Choose Random No. b/w 1 and lenght of Bitstream
flipped_binary(1,rand_bit_flip) = '0'+'1'-binary(1,rand_bit_flip); % Flip the Bit

end

%% OOK Modulation

function ook_mod(encoded_wave)

snr_factor = 45; % Signal to Noise Ratio

for i = 1:length(encoded_wave) 
    t = i;
    bit=encoded_wave(i); 
    hold on
    freq=0.5; % Freq of Sine Wave
    bit = str2num(bit); %#ok<*ST2NM> % Converting Bit from Char to Int
    time_points = linspace(t-1, t, 20000); % Sampling Frequency = 20000 % Setting Time Period = 1
    sine_wave = bit*sin(2 * pi * freq * time_points); % Creating Sine Wave(Wave for Bit=1 & 0 for Bit=0)
    sine_wave=awgn(sine_wave, snr_factor); % Adding Noise
    plot(time_points, sine_wave,'Color','#FF0000'); % Plotting the Wave
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Modulated Wave');
    ylim([-1.5 1.5]);
    drawnow
end

end

%% OOK Demodulation

function final_demod_bitstream=ook_demod()

h = findobj(1,'Type','line'); % Using the Plotted Graph
sec = numel(h); % No. of Seconds = No. of Plots as Time Period = 1s

for n=sec:-1:1 % Traversing each plot individually
    a= sec-n+1;
    X=h(n).XData; % Gathering X and Y Data from Plot
    Y=h(n).YData;
    val=Y(10000); % Finding Value of Y at X=10000

    if  val> 0.5 || val< -0.5 % Comparing to find whether Bit is 1 or 0 
        flag ='1';

    else
        flag ='0';
    end
    demod_bitstream(a)=flag;
end
final_demod_bitstream=demod_bitstream;

end

%% FSK Modulation

function fsk_mod(encoded_wave) % Mostly similar to OOK except here we have 2 sine wavess
snr_factor = 25;
for i = 1:length(encoded_wave)
    t = i;
    bit=encoded_wave(i);
    hold on
    freq_1=1;
    freq_0=4;
    bit = str2num(bit);
    time_points = linspace(t-1, t, 20000);
    sine_wave_1 = sin(2 * pi * freq_1 * time_points);
    sine_wave_0 = sin(2 * pi * freq_0 * time_points);
    sine_wave_1=awgn(sine_wave_1, snr_factor);
    sine_wave_0=awgn(sine_wave_0, snr_factor);
    if bit==1
        plot(time_points, sine_wave_1,'Color','#FF0000');
    elseif bit==0
        plot(time_points, sine_wave_0,'Color','#FF0000');
    end

    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Modulated Wave');
    ylim([-1.5 1.5]);
    hold on
    drawnow
end

end

%% FSK Demodulation
function final_demod_bitstream=fsk_demod() % Quite similar to OOK Demodulation

h = findobj(1,'Type','line');
sec = numel(h);
for n=sec:-1:1
    a= sec-n+1;
    X=h(n).XData;
    Y=h(n).YData;
    val_1=Y(5000);
    val_0=Y(2500);

    if  val_1>0.5 || val_1< -0.5 
        flag ='1';

    elseif val_0<0.5 || val_0>-0.5
        flag ='0';
    end
    demod_bitstream(a)=flag;
end
final_demod_bitstream=demod_bitstream;
end

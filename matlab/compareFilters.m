function compareMagnitudeResponses(file1, file2, file3, file4, file5)
% compareMagnitudeResponses Loads four WAV files and visualizes only their frequency magnitude responses.
%
% Syntax:
%   compareMagnitudeResponses('file1.wav', 'file2.wav', 'file3.wav', 'file4.wav')
%
% Inputs:
%   file1, file2, file3, file4 - Paths to the WAV files to be compared.

% Load audio files
[x1, fs] = audioread(file1); % Assuming fs is the same for all, based on earlier check
[x2, ~] = audioread(file2);
[x3, ~] = audioread(file3);
[x4, ~] = audioread(file4);
[x5, ~] = audioread(file5);

% Number of points for FFT
N = 1024;

% Prepare figure for magnitude response comparison
figure;

% Calculate and plot magnitude responses
[H1, F] = freqz(x1, 1, N, fs);
plot(F, 20*log10(abs(H1)), 'LineWidth', 1.5);
hold on;

[H2, ~] = freqz(x2, 1, N, fs);
plot(F, 20*log10(abs(H2)), 'LineWidth', 1.5);

[H3, ~] = freqz(x3, 1, N, fs);
plot(F, 20*log10(abs(H3)), 'LineWidth', 1.5);

[H4, ~] = freqz(x4, 1, N, fs);
plot(F, 20*log10(abs(H4)), 'LineWidth', 1.5);

[H5, ~] = freqz(x5, 1, N, fs);
plot(F, 20*log10(abs(H5)), 'LineWidth', 1.5);

% title('Frequency Magnitude Responses');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
legend('signal','biquad', 'tanh', 'soft', 'hard');
hold off;

end

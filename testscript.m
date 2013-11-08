%Example calculates and graphs the theoretical
%BER plots for two types of communication
%systems (BPSK and QPSK)
Eb_over_No_in_dB = [0:14];
%Purposes of the x-axis of the plot
Eb_No=10.^(Eb_over_No_in_dB./10);
%PSK is antipodal
xant = sqrt(2.*Eb_No);
%QPSK is othogonal
xorth = sqrt(Eb_No);
%Use the erfc function as equivalent to
%Q function
Qant = 0.5*erfc(xant/sqrt(2));
Qorth = 0.5*erfc(xorth/sqrt(2));
%Plot the first result
semilogy(Eb_over_No_in_dB,Qant);
%Keeping the same plot in graph
%plot the second one
grid on; hold on;
semilogy(Eb_over_No_in_dB,Qorth,'r--');
v = axis;
axis([v(1:2) 10^-6 .1])
xlabel('Eb/N0 in dB');
ylabel('Probability of bit error')
hold off;
legend('Antipodal','Orthogonal')


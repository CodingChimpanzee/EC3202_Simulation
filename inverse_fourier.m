function [result] = inverse_fourier(ft, M, N)
% INVERSE_FOURIER_TRANSFORM for total patch
% M = w, N = h

w_m = (2*pi)/M;
w_n = (2*pi)/N;

% for loop for m : M by M Matrix
W_m = ones(M, M);
for m = 2 : M
    for u = 2 : M
        W_m(m, u) = complex(cos(w_m*(m-1)*(u-1)), sin(w_m*(m-1)*(u-1)));
    end
end
W_m = (1/M)*W_m;

% for loop for n : N by N Matrix
W_n= ones(N, N);
for n = 2 : N
    for v = 2 : N
        W_n(n, v) = complex(cos(w_n*(n-1)*(v-1)), sin(w_n*(n-1)*(v-1)));
    end
end
W_n = (1/N)*W_n;

% Making final fourier transform: Multiplication
% Result is F itself
result = W_n*ft;
result = result*W_m;
end





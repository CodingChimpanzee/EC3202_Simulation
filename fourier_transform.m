function [result] = fourier_transform(patch, M, N)
%   FOURIER_TRANSFORM for total patch
%   M = w, N = h

w_m = (-2*pi)/M;
w_n = (-2*pi)/N;

% for loop for m : M by M Matrix
W_m = ones(M, M);
for m = 2 : M
    for u = 2 : M
        W_m(m, u) = complex(cos(w_m*(m-1)*(u-1)), sin(w_m*(m-1)*(u-1)));
        %W_m(m,u) = exp((w_m*1i*(m-1)*(u-1))*(m-1)*(u-1));
    end
end

% for loop for n : N by N Matrix
W_n = ones(N, N);
for n = 2 : N
    for v = 2 : N
        W_n(n, v) = complex(cos(w_n*(n-1)*(v-1)), sin(w_n*(n-1)*(v-1)));
        %W_n(n,v) = exp((w_n*1i*(n-1)*(v-1))*(n-1)*(v-1));
    end
end


% Making final fourier transform: Multiplication
% Result is F itself
patch = double(patch);
% patch is always real value
% Hence, multiplication should be done like this:
%result = W_n*patch;
%result = result*W_m;
result = complex(real(W_n)*real(patch), imag(W_n)*real(patch));
result = complex((real(result)*real(W_m)-imag(result)*imag(W_m)), (real(result)*imag(W_m)+imag(result)*real(W_m)));
end
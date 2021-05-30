function [row, col] = Temporal_Consistency_Correlation(patch,image, inrow, incol, sr, sc)
%TEMPORAL_CONSISTENCY_FUNCTION Uses not only correlation but also temporal
%consistency
% It uses some of the codes inside Correlation.m

% Row Exceptions
if inrow - sr < 0
    sr = inrow-1;
end
if incol - sc < 0
    sc = incol-1;
end

% Column Exceptions
if inrow + sr > 360
    sr = 359-inrow;
end
if incol + sc > 480
    sc = 479-incol;
end

% Get the size of the patch
p = size(patch);
p = p(2);
q = size(patch);
q = q(1);

value = zeros(2*sr, 2*sc);
for a = inrow-sr : inrow+sr
    for b = incol-sc : incol+sc
        standard = imcrop(image, [a b p-1 q-1]);
        %G = fourier_transform(standard, p, q);
        G = fft2(standard);
        R = (patch.*conj(G))./abs(patch.*conj(G));
        %r = inverse_fourier(R, p, q);
        r = ifft2(R);
        comp = abs(r);
        [findmaxval, ~] = max(comp(:));
        value(a, b) = findmaxval;
    end
end

% Find maximum value's coordinates
[max_val, ~]= max(double(value(:)));
[row, col] = ind2sub(size(value), find(value==max_val));

% Activation map output
imagesc(transpose(value));

% Image output
imshow(image);
hold on
rectangle('Position',[row,col,p,q], 'LineWidth',1 ,'LineStyle','--')
end


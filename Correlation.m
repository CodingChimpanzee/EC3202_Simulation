function Correlation(patch, image)

% Get the size of the image
w = size(image);
w = w(2);
h = size(image);
h = h(1);

% Get the size of the patch
p = size(patch);
p = p(2);
q = size(patch);
q = q(1);

value = zeros(w, h);
for a = 1 : (480-p)
    for b = 1 : (360-q)
        standard = imcrop(image, [a b p-1 q-1]);
        %G = fourier_transform(standard, p, q);
        G = fft2(standard);
        R = (patch.*conj(G))./abs(patch.*conj(G));
        %r = inverse_fourier(R, p, q);
        r = ifft2(R);
        comp = abs(r);
        %comp = atan((imag(r))/(real(r)));
        %comp = angle(r);
        [findmaxval, ~] = max(comp(:));
        value(a, b) = findmaxval;
    end
end

% Find maximum value's coordinates
[max_val, ~]= max(double(value(:)));
[row, col] = ind2sub(size(value), find(value==max_val));

% Image output
imshow(image);
hold on
rectangle('Position',[row,col,p,q], 'LineWidth',1 ,'LineStyle','--')
end
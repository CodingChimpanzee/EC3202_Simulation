function Correlation(patch, image)

% Get the size of the patch
p = size(patch);
p = p(2);
q = size(patch);
q = q(1);

value = zeros(480, 360);
for a = 1 : (480-p)
    for b = 1 : (360-q)
        standard = imcrop(image, [a b p-1 q-1]);
        G = fourier_transform(standard, p, q);
        R = (patch.*conj(G))./abs(patch.*conj(G));
        r = inverse_fourier(R, p, q);
        comp = abs(r);
        %comp = atan((imag(r))/(real(r)));
        [findmaxval, ~] = max(comp(:));
        value(a, b) = findmaxval;
    end
end
% Find maximum value's coordinates
[max_val, ~]= max(double(value(:)));
[row, col] = ind2sub(size(value), find(value==max_val));

% Activation Map output, If you want to do get activation map, please use.
%imagesc(transpose(value));

% Image output
% If you want to get activation map, do not run this code.
imshow(image);
hold on
rectangle('Position',[row, col,p,q], 'LineWidth',1 ,'LineStyle','--')
end


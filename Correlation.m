function Correlation(patch, image)

w = size(image);
w = w(2);
h = size(image);
h = h(1);

p = size(patch);
p = p(2);
q = size(patch);
q = q(1);

value = zeros(w, h);
t = 0;
for a = 1 : (480-p)
    for b = 1 : (360-q)
        standard = imcrop(image, [a b p-1 q-1]);
        G = fourier_transform(standard, p, q);
        R = (patch.*conj(G))./abs(patch.*conj(G));
        r = inverse_fourier(R, p, q);
        % comp = abs(angle(r))/pi;
        comp = abs(r);
        [findmaxval, ~] = max(comp(:));
        value(a, b) = findmaxval;
    end
end
[max_val, ~]= max(double(value(:)));
[row, col] = ind2sub(size(value), find(value==max_val));
imshow(image);
hold on
rectangle('Position',[row,col,p,q], 'LineWidth',1 ,'LineStyle','--')
title("Result of Correlation");
end
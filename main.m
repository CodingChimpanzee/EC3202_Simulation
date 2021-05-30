%-------------------------------------------------------------------------%
% Inital Values

f1 = figure;
f2 = figure;
f3 = figure;
f4 = figure;

startimg = imread('C:\Users\HyunKang\Documents\MATLAB\source_image\start.jpg');
startgray = rgb2gray(startimg);
xtart = 272;
ytart = 138;
w = 50;
h = 50;
face = imcrop(startgray, [xtart ytart w-1 h-1]);    % Make image Gray

% face: [268 135 39 38]
% armpit: [280 175 20 20]
% face_exactly: [272 138 30 30]
% reshaping1: [270,138,43,48]
% reshaping2: [268,138,45,50]
% goodexcept20: [272 138 45 50]
% BESTEXCEPT70/90(Little): [272 138 50 50]
%-------------------------------------------------------------------------%
% Fourier Transform
result = fourier_transform(face, w, h);
% Get the result patch
faceout = 20*(log(abs(result)));
subplot(2,2,1), imagesc(faceout);
title("face fourier transform");
% Print the result of face fourier transform

total = fourier_transform(startgray, 480, 360);
totalout = 20*(log10(abs(total)));
subplot(2,2,2), imagesc(totalout);
title("start.jpg fourier transform");
% Print the result of start.jpg fourier transform

%-------------------------------------------------------------------------%
% Inverse Fourier Transform

face_recov = inverse_fourier(result, w, h);
face_recov = (abs(face_recov));
subplot(2,2,3), imagesc(face_recov);
title("recovered face");
% Print the recovered face

total_recov = inverse_fourier(total, 480, 360);
total_recov = (abs(total_recov));
subplot(2,2,4), imagesc(total_recov);
title("recovered start.jpg");
% Print the recovered start.jpg

%-------------------------------------------------------------------------%
% Phase Correlation Image read

img10 = imread('C:\Users\HyunKang\Documents\MATLAB\source_image\0010.jpg');
img10gray = rgb2gray(img10);

img20 = imread('C:\Users\HyunKang\Documents\MATLAB\source_image\0020.jpg');
img20gray = rgb2gray(img20);

img30 = imread('C:\Users\HyunKang\Documents\MATLAB\source_image\0030.jpg');
img30gray = rgb2gray(img30);

img40 = imread('C:\Users\HyunKang\Documents\MATLAB\source_image\0040.jpg');
img40gray = rgb2gray(img40);

img50 = imread('C:\Users\HyunKang\Documents\MATLAB\source_image\0050.jpg');
img50gray = rgb2gray(img50);

img60 = imread('C:\Users\HyunKang\Documents\MATLAB\source_image\0060.jpg');
img60gray = rgb2gray(img60);

img70 = imread('C:\Users\HyunKang\Documents\MATLAB\source_image\0070.jpg');
img70gray = rgb2gray(img70);

img80 = imread('C:\Users\HyunKang\Documents\MATLAB\source_image\0080.jpg');
img80gray = rgb2gray(img80);

img90 = imread('C:\Users\HyunKang\Documents\MATLAB\source_image\0090.jpg');
img90gray = rgb2gray(img90);

img100 = imread('C:\Users\HyunKang\Documents\MATLAB\source_image\0100.jpg');
img100gray = rgb2gray(img100);

figure(f1);
subplot(2, 2, 1), imshow(startgray);
hold on
rectangle('Position',[xtart,ytart,w,h], 'LineWidth',1 ,'LineStyle','--')
title("Starting Position, hold on...")


%-------------------------------------------------------------------------%
% Correlation

figure(f1);
subplot(2, 2, 2), Correlation(result, img10gray);
title("Result of Correlation img10");
figure(f1);
subplot(2, 2, 3), Correlation(result, img20gray);
title("Result of Correlation img20");
figure(f1);
subplot(2, 2, 4), Correlation(result, img30gray);
title("Result of Correlation img30");
figure(f2);
subplot(2, 2, 1), Correlation(result, img40gray);
title("Result of Correlation img40");
figure(f2);
subplot(2, 2, 2), Correlation(result, img50gray);
title("Result of Correlation img50");
figure(f2);
subplot(2, 2, 3), Correlation(result, img60gray);
title("Result of Correlation img60");
figure(f2);
subplot(2, 2, 4), Correlation(result, img70gray);
title("Result of Correlation img70");
figure(f3);
subplot(2, 2, 1), Correlation(result, img80gray);
title("Result of Correlation img80");
figure(f3);
subplot(2, 2, 2), Correlation(result, img90gray);
title("Result of Correlation img90");
figure(f3);
subplot(2, 2, 3), Correlation(result, img100gray);
title("Result of Correlation img100");

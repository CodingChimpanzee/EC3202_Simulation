% It uses temporal consistency when doing correlation
% Get the prior code from main.m

f1 = figure;
f2 = figure;
f3 = figure;

startimg = imread('C:\Users\강성현\Documents\MATLAB\source_image\start.jpg');
startgray = rgb2gray(startimg);
xtart = 272;
ytart = 138;
w = 30;
h = 30;
face = imcrop(startgray, [xtart ytart w-1 h-1]);    % Make image Gray
result = fourier_transform(face, w, h);

figure(f1);
subplot(2, 2, 1), imshow(startgray);
hold on
rectangle('Position',[xtart,ytart,w,h], 'LineWidth',1 ,'LineStyle','--')
title("Starting Position, hold on...")

%-------------------------------------------------------------------------%
% Phase Correlation Image read

img10 = imread('C:\Users\강성현\Documents\MATLAB\source_image\0010.jpg');
img10gray = rgb2gray(img10);

img20 = imread('C:\Users\강성현\Documents\MATLAB\source_image\0020.jpg');
img20gray = rgb2gray(img20);

img30 = imread('C:\Users\강성현\Documents\MATLAB\source_image\0030.jpg');
img30gray = rgb2gray(img30);

img40 = imread('C:\Users\강성현\Documents\MATLAB\source_image\0040.jpg');
img40gray = rgb2gray(img40);

img50 = imread('C:\Users\강성현\Documents\MATLAB\source_image\0050.jpg');
img50gray = rgb2gray(img50);

img60 = imread('C:\Users\강성현\Documents\MATLAB\source_image\0060.jpg');
img60gray = rgb2gray(img60);

img70 = imread('C:\Users\강성현\Documents\MATLAB\source_image\0070.jpg');
img70gray = rgb2gray(img70);

img80 = imread('C:\Users\강성현\Documents\MATLAB\source_image\0080.jpg');
img80gray = rgb2gray(img80);

img90 = imread('C:\Users\강성현\Documents\MATLAB\source_image\0090.jpg');
img90gray = rgb2gray(img90);

img100 = imread('C:\Users\강성현\Documents\MATLAB\source_image\0100.jpg');
img100gray = rgb2gray(img100);

figure(f1);
subplot(2, 2, 1), imshow(startgray);
hold on
rectangle('Position',[xtart,ytart,w,h], 'LineWidth',1 ,'LineStyle','--')
title("Starting Position(Temp_cons), hold on...")

%-------------------------------------------------------------------------%
% Correlation using Temporal Consistency
sr = 80;
sc = 80;

figure(f1);
subplot(2, 2, 2), [row, col] = Temporal_Consistency_Correlation(result, img10gray, xtart, ytart, sr, sc);
title("Result of Correlation img10");
figure(f1);
subplot(2, 2, 3), [row, col] = Temporal_Consistency_Correlation(result, img20gray, row, col, sr, sc);
title("Result of Correlation img20");
figure(f1);
subplot(2, 2, 4), [row, col] = Temporal_Consistency_Correlation(result, img30gray, row, col, sr, sc);
title("Result of Correlation img30");
figure(f2);
subplot(2, 2, 1), [row, col] = Temporal_Consistency_Correlation(result, img40gray, row, col, sr, sc);
title("Result of Correlation img40");
figure(f2);
subplot(2, 2, 2), [row, col] = Temporal_Consistency_Correlation(result, img50gray, row, col, sr, sc);
title("Result of Correlation img50");
figure(f2);
subplot(2, 2, 3), [row, col] = Temporal_Consistency_Correlation(result, img60gray, row, col, sr, sc);
title("Result of Correlation img60");
figure(f2);
subplot(2, 2, 4), [row, col] = Temporal_Consistency_Correlation(result, img70gray, row, col, sr, sc);
title("Result of Correlation img70");
figure(f3);
subplot(2, 2, 1), [row, col] = Temporal_Consistency_Correlation(result, img80gray, row, col, sr, sc);
title("Result of Correlation img80");
figure(f3);
subplot(2, 2, 2), [row, col] = Temporal_Consistency_Correlation(result, img90gray, row, col, sr, sc);
title("Result of Correlation img90");
figure(f3);
subplot(2, 2, 3), [row, col] = Temporal_Consistency_Correlation(result, img100gray, row, col, sr, sc);
title("Result of Correlation img100");



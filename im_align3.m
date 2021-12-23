function [aligned_corner] = im_align3(B_img,G_img,R_img,k)

  %%%%%%%%%%%%%SOBEL IMAGES CORNERNESSSS::
Mx = [-1 0 1; -2 0 2; -1 0 1];
My = [-1 -2 -1; 0 0 0; 1 2 1];

for i = 1:size(B_img, 1) - 2
	for j = 1:size(B_img, 2) - 2

		% Gradient approximations
		Gx = sum(sum(Mx.*double(B_img(i:i+2, j:j+2))));
		Gy = sum(sum(My.*double(B_img(i:i+2, j:j+2))));
				
		% Calculate magnitude of vector
		filtered_image(i+1, j+1) = sqrt(Gx.^2 + Gy.^2);
		
	end
end


filtered_image = uint8(filtered_image);

thresholdValue = 100; % varies between [0 255]
output_image = max(filtered_image, thresholdValue);
output_image(output_image == round(thresholdValue)) = 0;


%imwrite(output_image,'image-sobel-blue.jpg')
imwrite(output_image, strcat('image',int2str(k),'-corner.jpg'))







for i = 1:size(G_img, 1) - 2
	for j = 1:size(G_img, 2) - 2

		% Gradient approximations
		Gx = sum(sum(Mx.*double(G_img(i:i+2, j:j+2))));
		Gy = sum(sum(My.*double(G_img(i:i+2, j:j+2))));
			
		% Calculate magnitude of vector
		filtered_image(i+1, j+1) = sqrt(Gx.^2 + Gy.^2);
		
	end
end


filtered_image = uint8(filtered_image);

thresholdValue = 100; % varies between [0 255]
output_image1 = max(filtered_image, thresholdValue);
output_image1(output_image1 == round(thresholdValue)) = 0;


%imwrite(output_image1,'image-sobel-green.jpg')






for i = 1:size(R_img, 1) - 2
	for j = 1:size(R_img, 2) - 2

		% Gradient approximations
		Gx = sum(sum(Mx.*double(R_img(i:i+2, j:j+2))));
		Gy = sum(sum(My.*double(R_img(i:i+2, j:j+2))));
				
		% Calculate magnitude of vector
		filtered_image(i+1, j+1) = sqrt(Gx.^2 + Gy.^2);
		
	end
end


filtered_image = uint8(filtered_image);

thresholdValue = 100; % varies between [0 255]
output_image2 = max(filtered_image, thresholdValue);
output_image2(output_image2 == round(thresholdValue)) = 0;


%imwrite(output_image2,'image-sobel-red.jpg')


aligned_corner = 1;









end

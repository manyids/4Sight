import numpy as np
import cv2

cap = cv2.VideoCapture(0) 

cv2.namedWindow('image', cv2.WINDOW_AUTOSIZE)
count = 0
fileName = 'data/' + str(count) + '.jpg'

while(1):
	ret, image = cap.read()
	cv2.imshow('image',image)
	k = cv2.waitKey(5)
	if ( k == ord('s') ):
		count = count + 1
		fileName = 'data/' + str(count) + '.jpg'
		cv2.imwrite(fileName, image)
	if ( k == 27 ):
		break

cap.release()
cv2.destroyAllWindows()
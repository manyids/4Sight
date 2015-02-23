############################################
## Import OpenCV
import numpy as np
import cv2
############################################

############################################
## Read the image
img = cv2.imread('test.png')
############################################

############################################
## Do the processing
img = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
lower = np.array([156,0,0])
upper = np.array([181,255,255])
mask = cv2.inRange(img, lower, upper)

############################################

############################################
## Show the image
cv2.imshow('image',img)
cv2.imshow('mask',mask)
############################################

############################################
## Close and exit
cv2.waitKey(0)
cv2.destroyAllWindows()
############################################

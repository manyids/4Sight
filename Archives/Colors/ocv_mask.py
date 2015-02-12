import numpy as np
import cv2

# Load two images
img1 = cv2.imread('test1.png')
img2 = np.zeros((150,500,3), np.uint8)
cv2.ellipse(img2,(0,0),(250,75),0,0,90,(255,255,255),-1)                    # W
cv2.putText(img2,'WHITE',(5,27), cv2.FONT_HERSHEY_SIMPLEX, 1,(0,0,0),2)
cv2.ellipse(img2,(0,150),(250,75),0,270,360,(255,0,0),-1)                   # B
cv2.putText(img2,'BLUE',(5,135), cv2.FONT_HERSHEY_SIMPLEX, 1,(0,0,0),2)
cv2.ellipse(img2,(500,0),(250,75),0,90,180,(0,255,0),-1)                    # G
sz,bl = cv2.getTextSize('GREEN',cv2.FONT_HERSHEY_SIMPLEX, 1, 2)
cv2.putText(img2,'GREEN',(495-sz[0],27), cv2.FONT_HERSHEY_SIMPLEX, 1,(0,0,0),2)
cv2.ellipse(img2,(500,150),(250,75),0,180,270,(0,0,255),-1)                 # R
sz,bl = cv2.getTextSize('RED',cv2.FONT_HERSHEY_SIMPLEX, 1, 2)
cv2.putText(img2,'RED',(495-sz[0],135), cv2.FONT_HERSHEY_SIMPLEX, 1,(0,0,0),2)
#cv2.rectangle(img2,(100,100),(50,50),(0,0,0),4)                    # W


# I want to put logo on top-left corner, So I create a ROI
rows,cols,channels = img2.shape
roi = img1[0:rows, 0:cols ]

# Now create a mask of logo and create its inverse mask also
img2gray = cv2.cvtColor(img2,cv2.COLOR_BGR2GRAY)
ret, mask = cv2.threshold(img2gray, 10, 255, cv2.THRESH_BINARY)
mask_inv = cv2.bitwise_not(mask)

# Now black-out the area of logo in ROI
img1_bg = cv2.bitwise_and(roi,roi,mask = mask_inv)

# Take only region of logo from logo image.
img2_fg = cv2.bitwise_and(img2,img2,mask = mask)

# Put logo in ROI and modify the main image
dst = cv2.add(img1_bg,img2_fg)
img1[0:rows, 0:cols ] = dst
cv2.namedWindow('image', cv2.WINDOW_AUTOSIZE)
cv2.moveWindow('image', 0, 0)
cv2.imshow('image',mask_inv)
cv2.waitKey(0)
cv2.destroyAllWindows()

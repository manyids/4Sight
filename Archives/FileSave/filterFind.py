import numpy as np
import cv2

start = [0,0]
end = [0,0]
cl1 = True

def theloop(event,x,y,flags,param):
    global cl1, start, end
    if event == cv2.EVENT_LBUTTONDOWN:
        if cl1:
            start = [x,y]
            cl1 = False
            print 'st : ', start
        else:
            end = [x,y]
            cl1 = True
            print 'end: ', end
            minR = [255,255,255]
            maxR = [  0,  0,  0]
            for i in range(start[0],end[0]):
                for j in range(start[1],end[1]):
                    for c in range(0,3):
                        if image[j,i,c] > maxR[c]:
                            maxR[c] = image[j,i,c]
                        if image[j,i,c] < minR[c]:
                            minR[c] = image[j,i,c]
            print minR, maxR
                    

cv2.namedWindow('image', cv2.WINDOW_AUTOSIZE)
cv2.setMouseCallback('image',theloop)

image = cv2.imread('test.png')
cv2.imshow('image',image)

cv2.waitKey(0)

cv2.destroyAllWindows()

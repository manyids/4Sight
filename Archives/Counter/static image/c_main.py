import numpy as np
import cv2
from c_outf import *

#########################################
## Init elements
frame   = cv2.imread('test.jpg')
(h,w,c) = frame.shape
frame   = cv2.resize(frame,(w*2,h*2), interpolation = cv2.INTER_AREA)  
(h,w,c) = frame.shape
font    = cv2.FONT_HERSHEY_SIMPLEX
recOn   = True
count1  = 0
c_r     = (0,0,255)
c_g     = (0,255,0)
c_b     = (255,0,0)
c_white = (255,255,255)
c_black = (0,0,0)
print w,h
f_cam   = elements('main',0   ,w   ,0   ,h   )
btnMain = elements('btn' ,60  ,520 ,60  ,1020)
f_cam.img = frame

## Init Layers
layer1 = np.zeros((h,w,3), np.uint8)       # Full image

## Init 

#########################################
## Mouse Callback
def theloop(event,x,y,flags,param):
    global count1,frame
    if event == cv2.EVENT_LBUTTONDOWN:
        if f_cam.inR(x,y):
            count1 = count1 + 1
            cv2.putText(frame,str(count1),(x-f_cam.xl,y-f_cam.yt), cv2.FONT_HERSHEY_SIMPLEX, 1,(0,0,255),2)
    if event == cv2.EVENT_MOUSEMOVE:
        if f_cam.inR(x,y):
            f_cam.top[:,:,:] = 0
            cv2.putText(f_cam.top,str(count1),(x-f_cam.xl,y-f_cam.yt), cv2.FONT_HERSHEY_SIMPLEX, 1,(0,0,255),2)
        ## Camera area            
            
#########################################
## Show image

cv2.namedWindow('image', cv2.WINDOW_AUTOSIZE)
cv2.setMouseCallback('image',theloop)
cv2.moveWindow('image', 0, 0)

while(1): 
    f_cam.img  = cv2.addWeighted(frame,0.8,f_cam.top,0.2,0)
    f_cam.place(layer1)
    cv2.imshow('image',layer1)
    if cv2.waitKey(20) & 0xFF == 27:
        break
    k = cv2.waitKey(20)
    if k == 115:
        cv2.imwrite('img'+str(count1)+'.png',frame)

cv2.destroyAllWindows()
########################################

import numpy as np
import cv2
from c_outf import *

#########################################
## Init elements
        
font    = cv2.FONT_HERSHEY_SIMPLEX
recOn   = True
count1  = 0
c_r     = (0,0,255)
c_g     = (0,255,0)
c_b     = (255,0,0)
c_white = (255,255,255)
c_black = (0,0,0)

f_main  = elements('main',0   ,1920,0   ,1080)
f_cam   = elements('cam' ,580 ,1860,60  ,1020)
btnMain = elements('btn' ,60  ,520 ,60  ,1020)


## Init Layers
layer1 = np.zeros((1080,1920,3), np.uint8)       # Full image

## Init 

#########################################
## Mouse Callback
def theloop(event,x,y,flags,param):
    global recOn, count1
    if event == cv2.EVENT_LBUTTONDOWN:
        if f_cam.inR(x,y):
            cv2.putText(f_cam.img,str(count1),(x-f_cam.xl,y-f_cam.yt), cv2.FONT_HERSHEY_SIMPLEX, 2,(0,0,255),2)
            count1 = count1 + 1
    if event == cv2.EVENT_MOUSEMOVE:
        if f_cam.inR(x,y):
            f_cam.top[:,:,:] = 0
            cv2.putText(f_cam.top,str(count1),(x-f_cam.xl,y-f_cam.yt), cv2.FONT_HERSHEY_SIMPLEX, 2,(0,0,255),2)
        ## Camera area            
            
#########################################
## Show image
cap = cv2.VideoCapture(0)
recOn = True
btnMain.whiteout()
btnMain.place(layer1)

cv2.namedWindow('image', cv2.WINDOW_AUTOSIZE)
cv2.setMouseCallback('image',theloop)
cv2.moveWindow('image', 0, 0)

while(1):
    global recOn
    if recOn == True:
        ret, frame = cap.read()
        imgt = cv2.resize(frame,(1280,960), interpolation = cv2.INTER_AREA)  
        f_cam.img  = cv2.addWeighted(imgt,0.8,f_cam.top,0.2,0)
        f_cam.place(layer1)
    cv2.imshow('image',layer1)
    if cv2.waitKey(20) & 0xFF == 27:
        break
cap.release()
cv2.destroyAllWindows()
########################################

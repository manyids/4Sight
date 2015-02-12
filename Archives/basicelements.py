import numpy as np
import cv2

#####################################
## Function Definitions
#   drawgrid(xmax,ymax,xstep,ystep)
#   drawtext
#####################################

def drawgrid(xmax,ymax,xstep,ystep):
    for x in xrange(1, int(xmax/xstep)+1):
        for y in xrange(1, int(ymax/ystep)+1):
            cv2.circle(img1,(x*xstep,y*ystep), 1, (255,255,255), -1)
    return
#####################################
# Mouse callback
def theloop(event,x,y,flags,param):
    if event == cv2.EVENT_MOUSEMOVE:
        ## Button area
        if (x>250)&(x<750)&(y>750)&(y<900):
            cv2.rectangle(img2,(250,750),(750,900),(255,255,255),-1)    # Highlight button
        else:
            cv2.rectangle(img2,(250,750),(750,900),(255,255,255),3)
        ## Input area
        if (x>850)&(x<1700)&(y>200)&(y<900):
            if drawit == True:
                cv2.circle(img2,(x,y),5,(0,0,255),-1)
                cv2.circle(img3,(x,y),5,(0,0,255),-1)
                
    global drawit
    if event == cv2.EVENT_LBUTTONDOWN:
        ## Button area
        if (x>250)&(x<750)&(y>750)&(y<900):
            imgt1 = img3[200:900,850:1700]
            imgt2 = cv2.resize(imgt1,(500,450), interpolation = cv2.INTER_AREA)
            img2[200:650,250:750] = imgt2
        ## Input area
        if (x>850)&(x<1700)&(y>200)&(y<900):
            drawit = True
            
    if event == cv2.EVENT_LBUTTONUP:
        drawit = False
####################################
## Layers
#   img1 - backgroud
#   img2 - drawing
#   img3 - elements
yd = 1080
xd = 1920
####################################

img1 = np.zeros((yd,xd,3), np.uint8)
img2 = np.zeros((yd,xd,3), np.uint8)
img3 = np.zeros((yd,xd,3), np.uint8)

## ** img1 **
cv2.rectangle(img1,(100,100),(1820,980),(255,255,255),3) # Borders
cv2.rectangle(img1,(250,750),(750,900),(255,255,255),3)  # Button
cv2.rectangle(img1,(250,200),(750,650),(255,255,255),3)  # Output
cv2.rectangle(img1,(850,200),(1700,900),(255,255,255),3) # Input
# Grid
drawgrid(1920,1080,50,50)

####################################
## Show image

cv2.namedWindow('image', cv2.WINDOW_AUTOSIZE)
cv2.setMouseCallback('image',theloop)
cv2.moveWindow('image', 0, 0)

while(1):
    dst = cv2.addWeighted(img1,0.1,img2,0.9,0)
    cv2.imshow('image',dst)
    if cv2.waitKey(20) & 0xFF == 27:
        break
cv2.destroyAllWindows()
####################################

import numpy as np
import cv2

#########################################

class elements:
    def __init__(self,name,xl,xr,yt,yb):
        self.name   = name
        self.xr     = xr
        self.xl     = xl
        self.yt     = yt
        self.yb     = yb
        self.layer  = -1
        self.img    = np.zeros(((self.yb-self.yt),(self.xr-self.xl),3), np.uint8)
        self.w      = self.xr - self.xl
        self.h      = self.yb - self.yt
        self.state  = 0
        
    def setLayer(self, l):
        self.layer = l

    def setMatrix(self):
        return self.img

    def place(self, layer):
        l = self.xl
        r = self.xr
        t = self.yt
        b = self.yb
        layer[t:b,l:r] = self.img

    def whiteout(self):
        self.img[:,:,:] = 255

    def setBorder(self):
        cv2.rectangle(self.img,(0,0),(self.w,self.h),(255,255,255),5)

    def inR(self,x,y):
        if (x>self.xl)&(x<self.xr)&(y>self.yt)&(y<self.yb):
            return True
        else:
            return False

def setState(element,state):
    ## Button states
    if element.name == 'btn':
        # s.0
        if state == 0:
            element.state = 0
            element.img[:,:,:] = 0
            cv2.rectangle(element.img,(0,0),(element.w,element.h),(255,255,255),3)
        if state == 1:
            element.state = 1
            cv2.rectangle(element.img,(0,0),(element.w,element.h),(255,255,255),-1)
        if state == 2:
            element.state = 2
            element.img = np.zeros((element.h,element.w,3), np.uint8)
            cv2.ellipse(element.img,(0,0),(element.w/2,element.h/2),0,0,90,(255,255,255),-1)
            cv2.ellipse(element.img,(0,element.h),(element.w/2,element.h/2),0,270,360,(255,0,0),-1)
            cv2.ellipse(element.img,(element.w,0),(element.w/2,element.h/2),0,90,180,(0,255,0),-1)
            cv2.ellipse(element.img,(element.w,element.h),(element.w/2,element.h/2),0,180,270,(0,0,255),-1)
            cv2.rectangle(element.img,(0,0),(element.w,element.h),(255,255,255),5)
#########################################

#########################################
## Init elements
        
cap = cv2.VideoCapture(0)       # Cam Init

back = elements('back',0,1920,0,1080)   # Background
btn  = elements('btn',250,750,750,900)  # Button
inx  = elements('inx',850,1700,200,900) # Input Box
outx = elements('outx',250,750,200,650) # Output Box
op   = elements('op',250,750,200,650)   # Output
back.setBorder()
btn.setBorder()
inx.setBorder()
outx.setBorder()

## Init Layers
layer1 = back.setMatrix()       # Full image
btn.place(layer1)               # Place button
inx.place(layer1)
outx.place(layer1)

#####################################
# Mouse callback
def theloop(event,x,y,flags,param):
    if event == cv2.EVENT_MOUSEMOVE:
        ## Button area
        if btn.state == 0:
            if btn.inR(x,y):
                setState(btn,1)
        if btn.state == 1:
            if not(btn.inR(x,y)):
                setState(btn,0)

    if event == cv2.EVENT_LBUTTONDBLCLK:
        if btn.inR(x,y):
            if btn.state == 2:
                setState(btn,1)
                
    if event == cv2.EVENT_LBUTTONDOWN:
        ## Button area
        if btn.inR(x,y):
            if btn.state == 1:
                print 's.1'
                imgt1 = inx.img
                imgt2 = cv2.resize(imgt1,(500,450), interpolation = cv2.INTER_AREA)
                outx.img = imgt2
                op.img   = imgt2
                print 'called op'
                setState(btn,2)
                cv2.waitKey(20)
                return
            if btn.state == 2:
                cB,cG,cR = btn.img.item(y-btn.yt,x-btn.xl,0),btn.img.item(y-btn.yt,x-btn.xl,1),btn.img.item(y-btn.yt,x-btn.xl,2)
                if (cB,cG,cR) == (255,255,255):
                    print 'the white king'
                    imgt1 = op.img
                    imgt2 = cv2.cvtColor(imgt1, cv2.COLOR_BGR2GRAY)
                    outx.img = cv2.cvtColor(imgt2, cv2.COLOR_GRAY2BGR)
                    return
                if (cB,cG,cR) == (0,0,255):
                    print 'the red rites'
                    imgt1 = np.zeros((op.h,op.w,3), np.uint8)
                    imgt1[:,:,2] = op.img[:,:,2]
                    outx.img = imgt1
                    return
                if (cB,cG,cR) == (255,0,0):
                    print 'the blue lands'
                    imgt1 = np.zeros((op.h,op.w,3), np.uint8)
                    imgt1[:,:,0] = op.img[:,:,0]
                    outx.img = imgt1
                    return
                if (cB,cG,cR) == (0,255,0):
                    print 'the green glen'
                    imgt1 = np.zeros((op.h,op.w,3), np.uint8)
                    imgt1[:,:,1] = op.img[:,:,1]
                    outx.img = imgt1
                    return
                if (cB,cG,cR) == (0,0,0):
                    print 'the black hand'
                    outx.img = op.img
                    return
                ## Input area
            
####################################
#########################################
## Show image

cv2.namedWindow('image', cv2.WINDOW_AUTOSIZE)
cv2.setMouseCallback('image',theloop)
cv2.moveWindow('image', 0, 0)

while(1):
    ret, frame = cap.read()
    imgt1 = cv2.resize(frame,(850,700), interpolation = cv2.INTER_AREA)
    imgt2 = cv2.cvtColor(imgt1, cv2.COLOR_BGR2GRAY)
    inx.img = cv2.cvtColor(imgt2, cv2.COLOR_GRAY2BGR)
    inx.place(layer1)
    inx.img = imgt1
    btn.place(layer1)
    outx.place(layer1)
    cv2.imshow('image',layer1)
    if cv2.waitKey(20) & 0xFF == 27:
        break
cap.release()
cv2.destroyAllWindows()
########################################

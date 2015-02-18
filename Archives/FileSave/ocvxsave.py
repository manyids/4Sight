import numpy as np
import cv2
import time
import datetime

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
            cv2.rectangle(element.img,(0,0),(element.w/2,element.h),(255,255,255),-1)
            cv2.putText(element.img,'SAVE',(10,element.h-10), font, 3,(0,0,255),2)
            cv2.putText(element.img,'BACK',((element.w/2)+10,element.h-70), font, 3,(0,0,255),2)
            cv2.rectangle(element.img,(0,0),(element.w,element.h),(255,255,255),5)
#########################################

#########################################
## Init elements
        
cap = cv2.VideoCapture(0)       # Cam Init
font = cv2.FONT_HERSHEY_SIMPLEX
saveno = 0

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
                    global saveno
                    print 'the white king'
                    imgt1 = op.img
                    imgt2 = cv2.cvtColor(imgt1, cv2.COLOR_BGR2GRAY)
                    outx.img = cv2.cvtColor(imgt2, cv2.COLOR_GRAY2BGR)
                    ts = time.time()
                    st = datetime.datetime.fromtimestamp(ts).strftime('%Yx%mx%d%Hx%Mx%S')
                    cv2.imwrite('img'+str(st)+'.png',frame)
                    saveno = saveno + 1
                    setState(btn,1)
                    return
                if (cB,cG,cR) == (0,0,0):
                    print 'the black hand'
                    setState(btn,1)
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

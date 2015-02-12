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
        self.top    = np.zeros(((self.yb-self.yt),(self.xr-self.xl),3), np.uint8)
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

############################################
## States of elements
        
#  Button
def setState(element,state):
    ## Button states
    if element.name == 'btn':
        # s.0
        if state == 0:
            print 'zero'
            element.state = 0
            element.img[:,:,:] = 0
            cv2.rectangle(element.img,(0,0),(element.w,element.h),(255,255,255),3)
        if state == 1:
            print 'neo'
            element.state = 1
            cv2.rectangle(element.img,(0,0),(element.w,element.h),(255,255,255),-1)
        if state == 2:
            print 'duo'
            element.state = 2
            element.img[:,:,:] = 0
            for i in [15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]:
                mjx = i*(element.w/20)
                mnx = i*(element.h/20)
                cv2.ellipse(element.img,((element.w/2),(element.h/2)),(mjx,mnx),0,0,360,(0,0,255),4)
            (w,h),bl = cv2.getTextSize('SELECT 1',cv2.FONT_HERSHEY_SIMPLEX,2,3)
            cv2.putText(element.img,'SELECT 1',(element.w/2-w/2,element.h/2+h/2),cv2.FONT_HERSHEY_SIMPLEX,2,(255,255,255),5)
            element.setBorder()
        if state == 3:
            print 'trinity'
            element.state = 3
            element.img[:,:,:] = 255
            for i in [15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]:
                mjx = i*(element.w/20)
                mnx = i*(element.h/20)
                cv2.ellipse(element.img,((element.w/2),(element.h/2)),(mjx,mnx),0,0,360,(0,255,0),4)
            (w,h),bl = cv2.getTextSize('SELECT 2',cv2.FONT_HERSHEY_SIMPLEX,3,3)
            cv2.putText(element.img,'SELECT 2',(element.w/2-w/2,element.h/2+h/2),cv2.FONT_HERSHEY_SIMPLEX,3,(0,0,0),5)
            element.setBorder()
        if state == 4:
            print 'fate'
            element.state = 4
            element.img[:,:,:] = 255
            cv2.rectangle(element.img,(element.w/2,0),(element.w,element.h),(0,0,0),-1)
            element.setBorder()
            cv2.putText(element.img,'SET', (20,element.h-20),cv2.FONT_HERSHEY_SIMPLEX,3,(0,0,255),3)
            (w,h),bl = cv2.getTextSize('BACK',cv2.FONT_HERSHEY_SIMPLEX,3,3)
            cv2.putText(element.img,'BACK', (element.w/2+5,h+20),cv2.FONT_HERSHEY_SIMPLEX,3,(0,0,255),3)

#########################################

#########################################
## Init elements
        
cap     = cv2.VideoCapture(0)       # Cam Init
font    = cv2.FONT_HERSHEY_SIMPLEX
saveno  = 0
recOn   = True
choice  = [(0,0),(0,0)]

back = elements('back',0,1920,0,1080)   # Background
btn  = elements('btn',250,750,750,900)  # Button
inx  = elements('inx',850,1700,200,900) # Input Box
ip   = elements('ip',850,1700,200,900)  # Input
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
        if btn.inR(x,y):
            if btn.state == 0:
                setState(btn,1)
                return
        else:
            if btn.state == 1:
                setState(btn,0)
                return

        ## Input Area
        if inx.inR(x,y):
            m = btn.state
            if (m == 2)|(m == 3):
                imgt1 = inx.top
                imgt1[:,:,:] = 0
                cv2.circle(imgt1,(x-inx.xl,y-inx.yt),100,(255,255,255),-1)
                sz,bl = cv2.getTextSize('%d,%d'%(x-inx.xl,y-inx.yt),cv2.FONT_HERSHEY_SIMPLEX, 1, 2)
                cv2.putText(imgt1,'%d,%d'%(x-inx.xl,y-inx.yt),(x-inx.xl-(sz[0]/2),y-inx.yt+10+sz[1]), cv2.FONT_HERSHEY_SIMPLEX, 1,(0,0,0),2)
                if m == 3:
                    cv2.rectangle(inx.top,choice[0],(x-inx.xl,y-inx.yt),(255,255,255),2)
                

    if event == cv2.EVENT_LBUTTONDOWN:

        ## Button area
        if btn.inR(x,y):
            m = btn.state
            if m == 1:
                global recOn
                print 's.1'
                imgt1 = inx.img
                imgt2 = cv2.resize(imgt1,(500,450), interpolation = cv2.INTER_AREA)
                outx.img = imgt2
                op.img   = imgt2
                inx.img  = imgt1
                recOn = False
                print 'called op'
                setState(btn,2)
                cv2.waitKey(20)
                return
            if m == 2:
                setState(btn,1)
            if m == 4:
                cB,cG,cR = btn.img.item(y-btn.yt,x-btn.xl,0),btn.img.item(y-btn.yt,x-btn.xl,1),btn.img.item(y-btn.yt,x-btn.xl,2)
                if (cB,cG,cR) == (255,255,255):
                    print 'the white king'
                    recOn = True
                    inx.top[:,:,:] = 0
                    setState(btn,1)
                if (cB,cG,cR) == (0,0,0):
                    print 'the black hand'
                    recOn = True
                    inx.top[:,:,:] = 0
                    setState(btn,1)
                
                
        ## Input area
        if inx.inR(x,y):
            m = btn.state
            if m == 2:
                print 'first one'
                choice[0] = (x-inx.xl,y-inx.yt)
                print choice
                setState(btn,3)
                return
            if m == 3:
                print 'first one'
                choice[1] = (x-inx.xl,y-inx.yt)
                print choice
                inx.top = inx.img
                cv2.rectangle(inx.top,choice[0],choice[1],(255,255,255),2)
                [(xi,yi),(xf,yf)] = choice
                if xf<xi:
                    xi,xf = xf,xi
                if yf<yi:
                    yi,yf = yf,yi
                imgt1 = inx.img[yi:yf,xi:xf,:]
                imgt2 = cv2.resize(imgt1,(500,450), interpolation = cv2.INTER_AREA)
                outx.img = imgt2
                setState(btn,4)
                return

#########################################
## Show image

cv2.namedWindow('image', cv2.WINDOW_AUTOSIZE)
cv2.setMouseCallback('image',theloop)
cv2.moveWindow('image', 0, 0)

while(1):
    if recOn == True:
        ret, frame = cap.read()
        imgt1 = cv2.resize(frame,(850,700), interpolation = cv2.INTER_AREA)
        imgt2 = cv2.cvtColor(imgt1, cv2.COLOR_BGR2GRAY)
        ip.img = cv2.cvtColor(imgt2, cv2.COLOR_GRAY2BGR)
        inx.img = ip.img
        inx.place(layer1)
        inx.img = imgt1
    btn.place(layer1)
    imgt1 = inx.img
    ip.img = cv2.addWeighted(imgt1,0.9,inx.top,0.1,0)
    ip.place(layer1)
    outx.place(layer1)
    cv2.imshow('image',layer1)
    if cv2.waitKey(20) & 0xFF == 27:
        break
cap.release()
cv2.destroyAllWindows()
########################################

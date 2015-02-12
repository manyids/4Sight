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

    def clearTop(self):
        self.top[:,:,:] = 0
    
    def setBorder(self):
        cv2.rectangle(self.img,(0,0),(self.w,self.h),(255,255,255),5)

    def setGrid(self,step):
        dx = 0
        dy = 0
        while dx<self.w:
            cv2.line(self.top,(dx,0),(dx,self.h),(0,255,0),1)
            dx = dx + step
        while dy<self.h:
            cv2.line(self.top,(0,dy),(self.w,dy),(0,255,0),1)
            dy = dy + step

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
            (w,h),bl = cv2.getTextSize('SELECT',cv2.FONT_HERSHEY_SIMPLEX,2,3)
            cv2.putText(element.img,'SELECT',(element.w/2-w/2,element.h/2+h/2),cv2.FONT_HERSHEY_SIMPLEX,2,(255,255,255),5)
            element.setBorder()
        if state == 3:
            print 'trinity'
            element.state = 3
            element.img[:,:,:] = 255
            cv2.rectangle(element.img,(element.w/2,0),(element.w,element.h),(0,0,0),-1)
            element.setBorder()
            cv2.putText(element.img,'SET', (20,element.h-20),cv2.FONT_HERSHEY_SIMPLEX,3,(0,0,255),3)
            (w,h),bl = cv2.getTextSize('BACK',cv2.FONT_HERSHEY_SIMPLEX,3,3)
            cv2.putText(element.img,'BACK', (element.w/2+5,h+20),cv2.FONT_HERSHEY_SIMPLEX,3,(0,0,255),3)

#########################################

#########################################
## Init elements
        
cap     = cv2.VideoCapture(0)           # Cam Init
font    = cv2.FONT_HERSHEY_SIMPLEX
saveno  = 0
recOn   = True
outOn   = False
choice  = [(0,0),(0,0),(0,0),(0,0)]
cnow    = 0

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
            if (m == 2):
                imgt1 = inx.top
                imgt1[:,:,:] = 0
                cv2.circle(imgt1,(x-inx.xl,y-inx.yt),100,(255,255,255),-1)
                sz,bl = cv2.getTextSize('%d,%d'%(x-inx.xl,y-inx.yt),font, 1, 2)
                cv2.putText(imgt1,'%d,%d'%(x-inx.xl,y-inx.yt),(x-inx.xl-(sz[0]/2),y-inx.yt+10+sz[1]), font, 1,(0,0,0),2)
                inx.top = imgt1
                cv2.circle(inx.top,choice[0],3,(255,255,255),3)
                cv2.circle(inx.top,choice[1],3,(255,255,255),3)
                cv2.circle(inx.top,choice[2],3,(255,255,255),3)
                cv2.circle(inx.top,choice[3],3,(255,255,255),3)
                return
            return

    if event == cv2.EVENT_LBUTTONDOWN:

        ## Button area
        if btn.inR(x,y):
            m = btn.state
            if m == 1:
                print 's.1'
                ip.img = inx.img
                outx.img = cv2.resize(ip.img,(500,450), interpolation = cv2.INTER_LINEAR)
                op.img   = outx.img
                outx.top[:,:,:] = 0
                inx.top[:,:,:]  = 0
                cnow = 0
                recOn = False
                print 'called op'
                setState(btn,2)
                cv2.waitKey(20)
                return
            if m == 2:
                print 's.2'
                setState(btn,1)
            if m == 3:
                global choice
                global outOn
                choice[:] = (0,0)
                cnow = 0
                cB,cG,cR = btn.img.item(y-btn.yt,x-btn.xl,0),btn.img.item(y-btn.yt,x-btn.xl,1),btn.img.item(y-btn.yt,x-btn.xl,2)
                if (cB,cG,cR) == (255,255,255):
                    print 'the white king'
                    inx.top[:,:,:] = 0
                    choice  = [(0,0),(0,0),(0,0),(0,0)]
                    recOn = True
                    outOn = False
                    setState(btn,1)
                if (cB,cG,cR) == (0,0,0):
                    print 'the black hand'
                    choice  = [(0,0),(0,0),(0,0),(0,0)]
                    inx.top[:,:,:] = 0
                    recOn = True
                    outOn = False
                    setState(btn,1)
                
                
        ## Input area
        if inx.inR(x,y):
            m = btn.state
            if m == 2:
                print 'first one'
                global cnow
                choice[cnow] = (x-inx.xl,y-inx.yt)
                cnow = cnow + 1
                print choice, cnow
                if cnow > 3:
                    global outOn
                    cnow  = 0
                    inx.top[:,:,:] = 0
                    pts = np.array([[choice[0][0],choice[0][1]],[choice[1][0],choice[1][1]],[choice[3][0],choice[3][1]],[choice[2][0],choice[2][1]]], np.int32)
                    pts = pts.reshape((-1,1,2))
                    print pts
                    cv2.polylines(inx.top,[pts],True,(0,255,255))
                    outOn = True
                    img_1 = inx.img
                    rows,cols,ch = img_1.shape
                    pts1 = np.float32([[choice[0][0],choice[0][1]],[choice[1][0],choice[1][1]],[choice[2][0],choice[2][1]],[choice[3][0],choice[3][1]]])
                    pts2 = np.float32([[0,0],[500,0],[0,450],[500,450]])
                    M = cv2.getPerspectiveTransform(pts1,pts2)
                    dst = cv2.warpPerspective(img_1,M,(500,450))
                    outx.img = dst
                    ####
                    outx.top[:,:,:] = 0
                    setState(btn,3)
                return
            return
        return
    return

            
#########################################
## Show image

cv2.namedWindow('image', cv2.WINDOW_AUTOSIZE)
cv2.setMouseCallback('image',theloop)
cv2.moveWindow('image', 0, 0)

cv2.namedWindow('temp', cv2.WINDOW_AUTOSIZE)
cv2.moveWindow('temp', 0, 0)

while(1):
    if recOn == True:
        ret, frame = cap.read()
        imgt1 = cv2.resize(frame,(850,700), interpolation = cv2.INTER_CUBIC)
        imgt2 = cv2.cvtColor(imgt1, cv2.COLOR_BGR2GRAY)
        inx.img = cv2.cvtColor(imgt2, cv2.COLOR_GRAY2BGR)
    img_a = cv2.cvtColor(inx.img, cv2.COLOR_BGR2GRAY)
    img_b = cv2.cvtColor(inx.top, cv2.COLOR_BGR2GRAY)
    ret, mask = cv2.threshold(img_b, 10, 255, cv2.THRESH_BINARY)
    mask_inv = cv2.bitwise_not(mask)
    img_bm  = mask
    img_bmi = mask_inv
    img1_fg = cv2.bitwise_and(img_a,img_a,mask = img_bmi)
    img1_bg = cv2.bitwise_and(img_b,img_b,mask = img_bm)
    img_c   = cv2.add(img1_bg,img1_fg)
    ip.img = cv2.cvtColor(img_c, cv2.COLOR_GRAY2BGR)
    if outOn == True:
        img_1 = inx.img
        rows,cols,ch = img_1.shape
        pts1 = np.float32([[choice[0][0],choice[0][1]],[choice[1][0],choice[1][1]],[choice[2][0],choice[2][1]],[choice[3][0],choice[3][1]]])
        pts2 = np.float32([[0,0],[500,0],[0,450],[500,450]])
        M = cv2.getPerspectiveTransform(pts1,pts2)
        dst = cv2.warpPerspective(img_1,M,(500,450))
        outx.img = dst
    btn.place(layer1)
    ip.place(layer1)
    outx.place(layer1)
    
    cv2.imshow('image',layer1)
    cv2.imshow('temp',mask)
    if cv2.waitKey(20) & 0xFF == 27:
        break
cap.release()
cv2.destroyAllWindows()
########################################

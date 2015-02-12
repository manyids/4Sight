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

def getRes():
    import gtk
    window = gtk.Window()
    screen = window.get_screen()
    return gtk.gdk.screen_width(),gtk.gdk.screen_height()
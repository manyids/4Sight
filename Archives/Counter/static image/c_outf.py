import numpy as np
import cv2

font    = cv2.FONT_HERSHEY_SIMPLEX

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
        cv2.rectangle(self.img,(2,2),(self.w-2,self.h-2),(255,255,255),5)

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


def renderBoard(game):
    imgTmp    = np.zeros((game.sqSize*8,game.sqSize*8,3), np.uint8)
    for i in range(8):
        for j in range(8):
            img = getImg(game.board[i][j],game.sqSize,game.fSize)                   
            imgTmp[i*game.sqSize:(i+1)*game.sqSize,j*game.sqSize:(j+1)*game.sqSize,:] = img
    return imgTmp
                        
def getImg(square1,sqSize,fSize):
    (x,y) = square1.pos
    img   = np.zeros((sqSize,sqSize,3), np.uint8)
    if ((x+y)%2)==0:
        img[:,:,:] = 255
    if square1.piece != None:
        color1   = (0,255,0)            # Green - White
        if square1.piece.race == 1:
            color1     = (0,0,255)      # Red   - Black
        (w,h),bl = cv2.getTextSize(square1.piece.rank,font,fSize,3)
        cv2.putText(img,square1.piece.rank,((sqSize-w)/2,(sqSize+h)/2),font,fSize,color1,3)
    if square1.sel == 1:
        cv2.circle(img, (sqSize/2,sqSize/2), sqSize/2, (255,0,0), 3)
    if square1.sel == 2:
        cv2.circle(img, (sqSize/2,sqSize/2), sqSize/2, (0,255,0), 3)

    return img

def setBtn(btn):
    imgT = btn.img
    cv2.ellipse(imgT,(0,btn.h/2),(btn.w,btn.w),0,270,330,(255,0,0),-1)
    cv2.ellipse(imgT,(0,btn.h/2),(btn.w,btn.w),0,330,390,(0,255,0),-1)    
    cv2.ellipse(imgT,(0,btn.h/2),(btn.w,btn.w),0,30 ,90 ,(0,0,255),-1)    
    btn.img = imgT

def set_ij(board,sqSize,(x,y)):
    x1,y1 = (x-board.xl),(y-board.yt)
    i = int(y1/sqSize)
    j = int(x1/sqSize)
    return (i,j)

def showMoves(g,sqList):
    for (x,y) in sqList:
        g.board[x][y].sel = 2
        renderBoard(g)

def hideMoves(g,sqList):
    for (x,y) in sqList:
        g.board[x][y].sel = 0
        renderBoard(g)
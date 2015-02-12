## The Scratchpad
####################################################
## Imports
import sys
import numpy as np
import cv2
from elements import *
import time
import datetime

colour = (255,255,255)
t      = 3
####################################################

####################################################
## Function Calls

def getImage():
    global cap
    ret, frame = cap.read()
    if ret!=0:
    	return frame
    else:
    	print 'Read Error'
    	return None

def getPoint(img,lower,upper):
    hsv  = cv2.cvtColor(img,cv2.COLOR_BGR2HSV)
    mask = cv2.inRange(hsv, lower, upper)
    dilim= cv2.dilate(mask,kernel,iterations = 1)
    contours, hierarchy = cv2.findContours(dilim,cv2.RETR_TREE,cv2.CHAIN_APPROX_SIMPLE)
    res  = cv2.bitwise_and(img,img, mask= dilim)
    cv2.drawContours(img, contours, -1, (0,0,255), 3)
    if len(contours)>0:
        M = cv2.moments(contours[0])
        cx = int(M['m10']/M['m00'])
        cy = int(M['m01']/M['m00'])
    	return (cx,cy)
    return None

def theloop(event,x,y,flags,param):
	global colour, t, canvas
	if event == cv2.EVENT_LBUTTONDOWN:
		if btnR.inR(x,y):
			colour = (0,0,255)
		if btnG.inR(x,y):
			colour = (0,255,0)
		if btnB.inR(x,y):
			colour = (255,0,0)
		if btnw.inR(x,y):
			colour = (255,255,255)
		if btnb.inR(x,y):
			colour = (0,0,0)
		if btn1.inR(x,y):
			t = 1
		if btn2.inR(x,y):
			t = 2
		if btn3.inR(x,y):
			t = 3
		if btnC.inR(x,y):
			canvas[:,:,:] = 0
		if btnS.inR(x,y):
			ts = time.time()
			st = datetime.datetime.fromtimestamp(ts).strftime('%Yx%mx%d%Hx%Mx%S')
			canvas1 = cv2.flip(canvas, 1)
			canvas2 = cv2.flip(canvas1, 0)
			cv2.imwrite('img'+str(st)+'.png',canvas2)

####################################################

####################################################
# Initialization 
canvas = np.zeros((480,640,3), np.uint8)
w,h = getRes()
w,h = w-100,h-100
cap = cv2.VideoCapture(1)

font    = cv2.FONT_HERSHEY_SIMPLEX

lower = np.array([0,100,200]) 
upper = np.array([20,120,255]) 
kernel = np.ones((5,5),np.uint8)
oldPos = (0,0)

back = elements('back',0,w,0,h)   		# Background
back.setBorder()	

inp1 = elements('inp1',50,983,50,750) 	# Frame
inp1.setBorder()

btnC = elements('btnC',1100,1400, 50,150) 		# Clear
btnS = elements('btnS',1100,1400,650,750) 		# Save
cv2.putText(btnC.img,'CLEAR',(110,60), font, 1,(255,255,255),2)
cv2.putText(btnS.img,'SAVE' ,(120,60), font, 1,(255,255,255),2)
btnC.setBorder()
btnS.setBorder()

btnR = elements('btnR',1100,1200,217,317) 		# R
btnG = elements('btnG',1200,1300,217,317) 		# G
btnB = elements('btnB',1300,1400,217,317) 		# B
btnw = elements('btnw',1100,1250,317,417) 		# White
btnb = elements('btnb',1250,1400,317,417) 		# Black
btnR.img[:,:,:] = (  0,  0,255)
btnG.img[:,:,:] = (  0,255,  0)
btnB.img[:,:,:] = (255,  0,  0)
btnw.img[:,:,:] = (255,255,255)
btnb.img[:,:,:] = (  0,  0,  0)
btnR.setBorder()
btnG.setBorder()
btnB.setBorder()
btnw.setBorder()
btnb.setBorder()

btn1 = elements('btn1',1100,1150,484,584) 		# t 1
btn2 = elements('btn2',1150,1250,484,584) 		# t 2
btn3 = elements('btn3',1250,1400,484,584) 		# t 3
btn1.setBorder()
btn2.setBorder()
btn3.setBorder()

layer1 = []
layer1 = back.setMatrix()       		# Full image

inp1.place(layer1)

btnC.place(layer1)
btnS.place(layer1)

btnR.place(layer1)
btnG.place(layer1)
btnB.place(layer1)
btnw.place(layer1)
btnb.place(layer1)

btn1.place(layer1)
btn2.place(layer1)
btn3.place(layer1)
####################################################

####################################################
## Main 

cv2.namedWindow('image', cv2.WINDOW_AUTOSIZE)
cv2.setMouseCallback('image',theloop)
cv2.moveWindow('image', 0, 0)

while(True):
	
	img = getImage()
	hI,wI,cI = inp1.img.shape
	
	pos  = getPoint(img,lower,upper)
	
	if pos != None:
		if oldPos != (0,0):
			cv2.line(canvas, oldPos, pos, colour, t)
		oldPos = pos
	else:
		oldPos = (0,0)
	summer = cv2.add(img,canvas)
	canvas1 = cv2.flip(summer, 1)
	canvas2 = cv2.flip(canvas1, 0)
	inp1.img = cv2.resize(canvas2,(wI,hI), interpolation = cv2.INTER_AREA)
	inp1.place(layer1)
	cv2.imshow('image', layer1)

	if cv2.waitKey(1) == 27:
		break
####################################################


####################################################
cap.release()
cv2.destroyAllWindows()
####################################################
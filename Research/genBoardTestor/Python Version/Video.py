import cv2
import numpy as np
from PyQt4 import QtGui, QtCore, Qt
from ui import Ui_MainWindow
 
class Video():
    def __init__(self,capture):
        self.capture = capture
        self.currentFrame=np.array([])
 
    def captureNextFrame(self,param1,param2):
        """                                          
        capture frame and reverse RBG BGR and return opencv image                                                                         
        """
        ret, readFrame=self.capture.read()
	hsv = cv2.cvtColor(readFrame,cv2.COLOR_BGR2HSV)
	lower = np.array(param1)
	upper = np.array(param2)
	mask = cv2.inRange(hsv, lower, upper)
	res = cv2.bitwise_and(readFrame,readFrame, mask= mask)
	
        if(ret==True):
            self.currentFrame=cv2.cvtColor(res,cv2.COLOR_BGR2RGB)
 
    def convertFrame(self):
        """                                                    converts frame to format suitable for QtGui            """
        try:
            height,width=self.currentFrame.shape[:2]
            img=QtGui.QImage(self.currentFrame,
                              width,
                              height,
                              QtGui.QImage.Format_RGB888)
            img=QtGui.QPixmap.fromImage(img)
            self.previousFrame = self.currentFrame
            return img
        except:
            return None

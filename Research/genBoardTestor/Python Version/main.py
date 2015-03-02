import sys
import cv2
from PyQt4 import QtGui, QtCore, Qt
from ui import Ui_MainWindow
from Video import Video

h_l = 0
h_u = 255
s_l = 0
s_u = 255
v_l = 0
v_u = 255

class Gui(QtGui.QMainWindow):
    def __init__(self,parent=None):
        QtGui.QWidget.__init__(self,parent)
        self.ui = Ui_MainWindow()
        self.ui.setupUi(self)
	self.ui.HLVal.setText("0")
	self.ui.HUVal.setText("255")
	self.ui.SLVal.setText("0")
	self.ui.SUVal.setText("255")
	self.ui.VLVal.setText("0")
	self.ui.VUVal.setText("255")
	self.ui.btn_set.clicked.connect(self.btn_set_clicked)
        self.video = Video(cv2.VideoCapture(0))
        self._timer = QtCore.QTimer(self)
        self._timer.timeout.connect(self.play)
        self._timer.start(1)
        self.update()

    def btn_set_clicked(self):
	global h_l, h_u, s_l, s_u, v_l, v_u
	h_l = int(self.ui.HLVal.text())
	h_u = int(self.ui.HUVal.text())
	s_l = int(self.ui.SLVal.text())
	s_u = int(self.ui.SUVal.text())
	v_l = int(self.ui.VLVal.text())
	v_u = int(self.ui.VUVal.text())
	text_cv = "hsv = cv2.cvtColor(frame,cv2.COLOR_BGR2HSV) \n" \
		+ "lower = np.array(["+str(h_l)+","+str(s_l)+","+str(v_l)+"]) \n" \
		+ "upper = np.array(["+str(h_u)+","+str(s_u)+","+str(v_u)+"]) \n" \
		+ "mask = cv2.inRange(hsv, lower, upper) \n" \
		+ "res = cv2.bitwise_and(frame,frame, mask= mask) \n"
	self.ui.textEdit.setText(text_cv)

    def play(self):
        try:
            self.video.captureNextFrame([h_l,s_l,v_l],[h_u,s_u,v_u])   
            self.ui.videoFrame.setPixmap(
                self.video.convertFrame())
            self.ui.videoFrame.setScaledContents(True)
        except TypeError:
            print "No frame"
 
def main():
    app = QtGui.QApplication(sys.argv)
    ex = Gui()
    ex.show()
    sys.exit(app.exec_())
 
if __name__ == '__main__':
    main()

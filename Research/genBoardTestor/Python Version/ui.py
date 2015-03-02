# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'mainWindow.ui'
#
# Created: Fri Sep  5 16:18:53 2014
#      by: PyQt4 UI code generator 4.10.4
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s

try:
    _encoding = QtGui.QApplication.UnicodeUTF8
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig)

class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName(_fromUtf8("MainWindow"))
        MainWindow.resize(1366, 768)
        self.centralwidget = QtGui.QWidget(MainWindow)
        self.centralwidget.setObjectName(_fromUtf8("centralwidget"))
        self.videoFrame = QtGui.QLabel(self.centralwidget)
        self.videoFrame.setGeometry(QtCore.QRect(290, 40, 640, 480))
        self.videoFrame.setObjectName(_fromUtf8("videoFrame"))
        self.label_2 = QtGui.QLabel(self.centralwidget)
        self.label_2.setGeometry(QtCore.QRect(40, 50, 66, 17))
        self.label_2.setObjectName(_fromUtf8("label_2"))
        self.label_3 = QtGui.QLabel(self.centralwidget)
        self.label_3.setGeometry(QtCore.QRect(40, 170, 66, 17))
        self.label_3.setObjectName(_fromUtf8("label_3"))
        self.label_4 = QtGui.QLabel(self.centralwidget)
        self.label_4.setGeometry(QtCore.QRect(40, 280, 66, 17))
        self.label_4.setObjectName(_fromUtf8("label_4"))
        self.btn_set = QtGui.QPushButton(self.centralwidget)
        self.btn_set.setGeometry(QtCore.QRect(70, 410, 98, 27))
        self.btn_set.setObjectName(_fromUtf8("btn_set"))
        self.HLVal = QtGui.QLineEdit(self.centralwidget)
        self.HLVal.setGeometry(QtCore.QRect(30, 100, 61, 27))
        self.HLVal.setObjectName(_fromUtf8("HLVal"))
        self.HUVal = QtGui.QLineEdit(self.centralwidget)
        self.HUVal.setGeometry(QtCore.QRect(140, 100, 61, 27))
        self.HUVal.setObjectName(_fromUtf8("HUVal"))
        self.SUVal = QtGui.QLineEdit(self.centralwidget)
        self.SUVal.setGeometry(QtCore.QRect(140, 220, 61, 27))
        self.SUVal.setObjectName(_fromUtf8("SUVal"))
        self.SLVal = QtGui.QLineEdit(self.centralwidget)
        self.SLVal.setGeometry(QtCore.QRect(30, 220, 61, 27))
        self.SLVal.setObjectName(_fromUtf8("SLVal"))
        self.VLVal = QtGui.QLineEdit(self.centralwidget)
        self.VLVal.setGeometry(QtCore.QRect(30, 320, 61, 27))
        self.VLVal.setObjectName(_fromUtf8("VLVal"))
        self.VUVal = QtGui.QLineEdit(self.centralwidget)
        self.VUVal.setGeometry(QtCore.QRect(140, 320, 61, 27))
        self.VUVal.setObjectName(_fromUtf8("VUVal"))
        self.textEdit = QtGui.QTextEdit(self.centralwidget)
        self.textEdit.setGeometry(QtCore.QRect(30, 560, 731, 141))
        self.textEdit.setObjectName(_fromUtf8("textEdit"))
        self.label = QtGui.QLabel(self.centralwidget)
        self.label.setGeometry(QtCore.QRect(30, 530, 591, 17))
        self.label.setObjectName(_fromUtf8("label"))
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtGui.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 1366, 25))
        self.menubar.setObjectName(_fromUtf8("menubar"))
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtGui.QStatusBar(MainWindow)
        self.statusbar.setObjectName(_fromUtf8("statusbar"))
        MainWindow.setStatusBar(self.statusbar)

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        MainWindow.setWindowTitle(_translate("MainWindow", "MainWindow", None))
        self.videoFrame.setText(_translate("MainWindow", "TextLabel", None))
        self.label_2.setText(_translate("MainWindow", "H", None))
        self.label_3.setText(_translate("MainWindow", "S", None))
        self.label_4.setText(_translate("MainWindow", "V", None))
        self.btn_set.setText(_translate("MainWindow", "Set", None))
        self.label.setText(_translate("MainWindow", "OpenCV Code (source image - frame; desination image - res)", None))


### Simple Test for Objects Library
### Author: Morgen Project Team
### Date: 2024-12-30

load "guilib.ring"

new qApp {
    openWindow(:TestController)
    exec()
}

class TestController from WindowsControllerParent
    oView = new TestView

class TestView from WindowsViewParent
    win = new qWidget() {
        setWindowTitle("🌟 اختبار بسيط - Simple Test")
        setGeometry(100, 100, 400, 300)
        setStyleSheet("background-color: #f0f8ff;")
        
        oLabel = new qLabel(win) {
            setGeometry(10, 10, 380, 40)
            setText("🎉 النظام يعمل بنجاح!")
            setStyleSheet("background-color: #FFD700; color: #8B4513; font-size: 16px; font-weight: bold; border-radius: 5px; padding: 10px;")
            setAlignment(Qt_AlignHCenter)
        }
        
        oButton = new qPushButton(win) {
            setGeometry(150, 100, 100, 40)
            setText("إغلاق")
            setStyleSheet("background-color: #FF6347; color: white; font-weight: bold;")
            setClickEvent(Method(:CloseAction))
        }
    }

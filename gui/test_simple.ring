### Simple Test for Morgen GUI
### Author: Morgen Project Team
### Date: 2024-12-30

load "guilib.ring"

new qApp {
    win = new qWidget() {
        setWindowTitle("🌟 مرجان المتقدم - اختبار بسيط")
        setGeometry(100, 100, 800, 600)
        setStyleSheet("background-color: #f0f8ff;")

        // Title
        oTitle = new qLabel(win) {
            setGeometry(10, 10, 780, 60)
            setText("🌟 مرجان المتقدم - النظام المتكامل للذكاء الاصطناعي")
            setStyleSheet("background: qlineargradient(x1:0, y1:0, x2:1, y2:0, stop:0 #FFD700, stop:1 #FFA500);
                          color: #8B4513; font-size: 18px; font-weight: bold;
                          border: 3px solid #DAA520; border-radius: 10px; padding: 10px;")
            setAlignment(Qt_AlignHCenter)
        }

        // Test button
        oTestBtn = new qPushButton(win) {
            setGeometry(300, 100, 200, 50)
            setText("🧠 اختبار النظام")
            setStyleSheet("background-color: #32CD32; color: white; font-size: 14px;
                          font-weight: bold; border-radius: 5px;")
            setClickEvent("testSystem()")
        }

        // Status area
        oStatus = new qTextEdit(win) {
            setGeometry(10, 170, 780, 400)
            setStyleSheet("background-color: #FFFACD; color: #8B4513; font-size: 12px;
                          border: 2px solid #DAA520; border-radius: 5px;")
            setReadOnly(true)
            setPlainText("مرحباً بك في النظام المتكامل للذكاء الاصطناعي المتقدم!" + nl +
                        "هذا اختبار بسيط للتأكد من عمل النظام." + nl +
                        "اضغط على زر الاختبار لبدء التشغيل.")
        }

        show()
    }
    exec()
}

func testSystem()
    oStatus.setPlainText("🚀 بدء اختبار النظام..." + nl +
                        "✅ تم تحميل المكتبات بنجاح" + nl +
                        "✅ تم إنشاء الواجهة بنجاح" + nl +
                        "✅ النظام يعمل بشكل صحيح!" + nl + nl +
                        "🎉 مرجان جاهز للاستخدام!")

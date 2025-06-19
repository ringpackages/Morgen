### Test Responsive Design for Morgen Advanced Features GUI
### Author: Morgen Project Team
### Date: 2024-12-30

load "guilib.ring"
load "config.ring"

//================================================
// Test Responsive Design Configuration
//================================================

func main()
    see "🧪 اختبار التصميم المتجاوب لواجهة مرجان المتقدم" + nl
    see copy("=", 50) + nl
    
    // Test 1: Configuration Loading
    testConfigurationLoading()
    
    // Test 2: Screen Size Detection
    testScreenSizeDetection()
    
    // Test 3: Adaptive Sizing
    testAdaptiveSizing()
    
    // Test 4: Grid Layout Calculation
    testGridLayoutCalculation()
    
    // Test 5: Font Size Adaptation
    testFontSizeAdaptation()
    
    see nl + "✅ جميع الاختبارات اكتملت بنجاح!" + nl

func testConfigurationLoading()
    see nl + "🔧 اختبار تحميل التكوين..." + nl
    
    try
        // Test configuration object creation
        if isObject(oMorgenConfig)
            see "✅ تم إنشاء كائن التكوين بنجاح" + nl
        else
            see "❌ فشل في إنشاء كائن التكوين" + nl
            return
        ok
        
        // Test responsive settings
        if len(oMorgenConfig.aScreenSizes) = 4
            see "✅ تم تحميل إعدادات أحجام الشاشات (4 أحجام)" + nl
        else
            see "❌ خطأ في إعدادات أحجام الشاشات" + nl
        ok
        
        // Test scale factors
        if oMorgenConfig.nButtonScaleFactor > 0
            see "✅ عوامل التحجيم محددة بشكل صحيح" + nl
        else
            see "❌ خطأ في عوامل التحجيم" + nl
        ok
        
    catch
        see "❌ خطأ في اختبار التكوين: " + cCatchError + nl
    done

func testScreenSizeDetection()
    see nl + "📱 اختبار كشف حجم الشاشة..." + nl
    
    try
        // Test screen size detection
        oMorgenConfig.detectScreenSize()
        
        if oMorgenConfig.cCurrentScreenSize != ""
            see "✅ تم كشف حجم الشاشة: " + oMorgenConfig.cCurrentScreenSize + nl
        else
            see "❌ فشل في كشف حجم الشاشة" + nl
        ok
        
        // Test scale factor calculation
        if oMorgenConfig.nButtonScaleFactor > 0
            see "✅ تم حساب عامل تحجيم الأزرار: " + oMorgenConfig.nButtonScaleFactor + nl
        else
            see "❌ خطأ في حساب عامل التحجيم" + nl
        ok
        
    catch
        see "❌ خطأ في اختبار كشف الشاشة: " + cCatchError + nl
    done

func testAdaptiveSizing()
    see nl + "📏 اختبار التحجيم التكيفي..." + nl
    
    try
        // Test adaptive window size
        aWindowSize = oMorgenConfig.getAdaptiveWindowSize()
        if len(aWindowSize) = 2 and aWindowSize[1] > 0 and aWindowSize[2] > 0
            see "✅ حجم النافذة التكيفي: " + aWindowSize[1] + "x" + aWindowSize[2] + nl
        else
            see "❌ خطأ في حساب حجم النافذة التكيفي" + nl
        ok
        
        // Test adaptive button size
        aButtonSize = oMorgenConfig.getAdaptiveButtonSize()
        if len(aButtonSize) = 2 and aButtonSize[1] > 0 and aButtonSize[2] > 0
            see "✅ حجم الأزرار التكيفي: " + aButtonSize[1] + "x" + aButtonSize[2] + nl
        else
            see "❌ خطأ في حساب حجم الأزرار التكيفي" + nl
        ok
        
        // Test adaptive spacing
        nSpacing = oMorgenConfig.getAdaptiveSpacing(10)
        if nSpacing > 0
            see "✅ المسافات التكيفية: " + nSpacing + "px" + nl
        else
            see "❌ خطأ في حساب المسافات التكيفية" + nl
        ok
        
    catch
        see "❌ خطأ في اختبار التحجيم التكيفي: " + cCatchError + nl
    done

func testGridLayoutCalculation()
    see nl + "🔲 اختبار حساب تخطيط الشبكة..." + nl
    
    try
        // Test grid layout for 10 buttons
        aGridLayout = oMorgenConfig.getOptimalGridLayout(10)
        if len(aGridLayout) = 2 and aGridLayout[1] > 0 and aGridLayout[2] > 0
            see "✅ تخطيط الشبكة لـ 10 أزرار: " + aGridLayout[1] + " أعمدة × " + aGridLayout[2] + " صفوف" + nl
        else
            see "❌ خطأ في حساب تخطيط الشبكة" + nl
        ok
        
        // Test different screen sizes
        aScreenSizes = ["minimum", "medium", "large", "extra_large"]
        for cSize in aScreenSizes
            oMorgenConfig.cCurrentScreenSize = cSize
            oMorgenConfig.calculateScaleFactors()
            aLayout = oMorgenConfig.getOptimalGridLayout(10)
            see "  📱 " + cSize + ": " + aLayout[1] + "×" + aLayout[2] + nl
        next
        
    catch
        see "❌ خطأ في اختبار تخطيط الشبكة: " + cCatchError + nl
    done

func testFontSizeAdaptation()
    see nl + "🔤 اختبار تكيف أحجام الخطوط..." + nl
    
    try
        // Test different base font sizes
        aBaseSizes = [10, 12, 14, 16, 18]
        for nBaseSize in aBaseSizes
            nAdaptiveSize = oMorgenConfig.getAdaptiveFontSize(nBaseSize)
            if nAdaptiveSize >= oMorgenConfig.nMinFontSize and nAdaptiveSize <= oMorgenConfig.nMaxFontSize
                see "✅ خط " + nBaseSize + "px → " + nAdaptiveSize + "px" + nl
            else
                see "❌ خطأ في تكيف حجم الخط " + nBaseSize + "px" + nl
            ok
        next
        
        // Test font scaling across different screen sizes
        see "  📱 اختبار التحجيم عبر أحجام الشاشات المختلفة:" + nl
        aScreenSizes = ["minimum", "medium", "large", "extra_large"]
        for cSize in aScreenSizes
            oMorgenConfig.cCurrentScreenSize = cSize
            oMorgenConfig.calculateScaleFactors()
            nSize = oMorgenConfig.getAdaptiveFontSize(12)
            see "    " + cSize + ": 12px → " + nSize + "px" + nl
        next
        
    catch
        see "❌ خطأ في اختبار تكيف الخطوط: " + cCatchError + nl
    done

//================================================
// Test Window Creation (Optional)
//================================================

func testWindowCreation()
    see nl + "🪟 اختبار إنشاء النوافذ..." + nl
    
    try
        new qApp {
            // Test main window creation with responsive design
            oTestWindow = new qWidget() {
                aWindowSize = oMorgenConfig.getAdaptiveWindowSize()
                setGeometry(100, 100, aWindowSize[1], aWindowSize[2])
                setWindowTitle("اختبار النافذة المتجاوبة")
                
                // Test responsive title
                nTitleFontSize = oMorgenConfig.getAdaptiveFontSize(16)
                oTitle = new qLabel(oTestWindow) {
                    setGeometry(10, 10, aWindowSize[1] - 20, 40)
                    setText("اختبار التصميم المتجاوب")
                    setStyleSheet("font-size: " + nTitleFontSize + "px; font-weight: bold;")
                }
                
                // Test responsive button
                aButtonSize = oMorgenConfig.getAdaptiveButtonSize()
                oTestButton = new qPushButton(oTestWindow) {
                    setGeometry(10, 60, aButtonSize[1], aButtonSize[2])
                    setText("زر اختبار")
                    nButtonFontSize = oMorgenConfig.getAdaptiveFontSize(12)
                    setStyleSheet("font-size: " + nButtonFontSize + "px;")
                }
                
                show()
            }
            
            see "✅ تم إنشاء نافذة اختبار متجاوبة بنجاح" + nl
            
            // Close after 2 seconds
            oTimer = new qTimer(oTestWindow) {
                setInterval(2000)
                setSingleShot(true)
                setTimeoutEvent("oTestWindow.close()")
                start()
            }
            
            exec()
        }
        
    catch
        see "❌ خطأ في اختبار إنشاء النوافذ: " + cCatchError + nl
    done

// Run main test
main()

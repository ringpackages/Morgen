# مواصفات التصميم المتجاوب - Responsive Design Specifications

## نظرة عامة
هذا المستند يحدد المواصفات التقنية للتصميم المتجاوب في تطبيق مرجان المتقدم.

## أحجام الشاشات المدعومة

### الحد الأدنى (Minimum)
- **الدقة**: 1024x768
- **عرض النافذة**: 1000px
- **ارتفاع النافذة**: 700px
- **نمط التخطيط**: مضغوط مع تمرير

### المتوسط (Medium)
- **الدقة**: 1366x768 - 1920x1080
- **عرض النافذة**: 1200px
- **ارتفاع النافذة**: 800px
- **نمط التخطيط**: متوازن

### الكبير (Large)
- **الدقة**: 1920x1080+
- **عرض النافذة**: 1400px
- **ارتفاع النافذة**: 900px
- **نمط التخطيط**: مريح مع مساحات إضافية

### الكبير جداً (Extra Large)
- **الدقة**: 2560x1440+
- **عرض النافذة**: 1600px
- **ارتفاع النافذة**: 1000px
- **نمط التخطيط**: واسع مع عناصر أكبر

## إعدادات التكوين المطلوبة

### إضافات جديدة لـ config.ring

```ring
// Responsive Design Settings
aScreenSizes = [
    ["minimum", 1024, 768, 1000, 700],
    ["medium", 1366, 768, 1200, 800], 
    ["large", 1920, 1080, 1400, 900],
    ["extra_large", 2560, 1440, 1600, 1000]
]

// Current screen detection
nCurrentScreenWidth = 0
nCurrentScreenHeight = 0
cCurrentScreenSize = "medium"

// Adaptive sizing factors
nButtonScaleFactor = 1.0
nFontScaleFactor = 1.0
nSpacingScaleFactor = 1.0

// Minimum and maximum constraints
nMinButtonWidth = 200
nMaxButtonWidth = 350
nMinButtonHeight = 60
nMaxButtonHeight = 100

nMinFontSize = 9
nMaxFontSize = 16

// Grid layout settings
nMaxButtonsPerRow = 5
nMinButtonsPerRow = 2
bEnableAutoGrid = true

// Scrolling settings
bEnableScrolling = true
nScrollAreaMargin = 10
nScrollBarWidth = 20
```

### دوال الكشف عن حجم الشاشة

```ring
func detectScreenSize()
    // Get current screen dimensions
    oApp = new qApplication([])
    oScreen = oApp.primaryScreen()
    nCurrentScreenWidth = oScreen.size().width()
    nCurrentScreenHeight = oScreen.size().height()
    
    // Determine screen category
    if nCurrentScreenWidth >= 2560
        cCurrentScreenSize = "extra_large"
    but nCurrentScreenWidth >= 1920
        cCurrentScreenSize = "large"
    but nCurrentScreenWidth >= 1366
        cCurrentScreenSize = "medium"
    else
        cCurrentScreenSize = "minimum"
    ok
    
    // Set scale factors
    calculateScaleFactors()

func calculateScaleFactors()
    switch cCurrentScreenSize
    on "minimum"
        nButtonScaleFactor = 0.8
        nFontScaleFactor = 0.9
        nSpacingScaleFactor = 0.8
    on "medium"
        nButtonScaleFactor = 1.0
        nFontScaleFactor = 1.0
        nSpacingScaleFactor = 1.0
    on "large"
        nButtonScaleFactor = 1.1
        nFontScaleFactor = 1.1
        nSpacingScaleFactor = 1.1
    on "extra_large"
        nButtonScaleFactor = 1.3
        nFontScaleFactor = 1.2
        nSpacingScaleFactor = 1.2
    off

func getAdaptiveWindowSize()
    for aSize in aScreenSizes
        if aSize[1] = cCurrentScreenSize
            return [aSize[4], aSize[5]]  // width, height
        ok
    next
    return [1200, 800]  // default

func getAdaptiveButtonSize()
    nBaseWidth = 270
    nBaseHeight = 80
    
    nWidth = nBaseWidth * nButtonScaleFactor
    nHeight = nBaseHeight * nButtonScaleFactor
    
    // Apply constraints
    if nWidth < nMinButtonWidth
        nWidth = nMinButtonWidth
    but nWidth > nMaxButtonWidth
        nWidth = nMaxButtonWidth
    ok
    
    if nHeight < nMinButtonHeight
        nHeight = nMinButtonHeight
    but nHeight > nMaxButtonHeight
        nHeight = nMaxButtonHeight
    ok
    
    return [nWidth, nHeight]

func getAdaptiveFontSize(nBaseSize)
    nSize = nBaseSize * nFontScaleFactor
    
    if nSize < nMinFontSize
        nSize = nMinFontSize
    but nSize > nMaxFontSize
        nSize = nMaxFontSize
    ok
    
    return nSize

func getAdaptiveSpacing(nBaseSpacing)
    return nBaseSpacing * nSpacingScaleFactor
```

## قواعد التخطيط المتجاوب

### شبكة الأزرار
1. **الحد الأدنى**: 2x5 (عمودين، 5 صفوف) مع تمرير
2. **المتوسط**: 5x2 (5 أعمدة، صفين) - التخطيط الحالي
3. **الكبير**: 5x2 مع مساحات إضافية
4. **الكبير جداً**: 5x2 مع عناصر أكبر

### المساحات والهوامش
- **الهامش الخارجي**: 10px (قابل للتكيف)
- **المسافة بين الأزرار**: متغيرة حسب حجم الشاشة
- **الهامش الداخلي**: 5-15px حسب حجم الشاشة

### النصوص والخطوط
- **العنوان الرئيسي**: 14-20px
- **نصوص الأزرار**: 10-14px
- **النصوص العادية**: 9-12px
- **نوع الخط**: Arial (متوافق عالمياً)

## آلية التمرير

### متطلبات التمرير
1. تفعيل التمرير عند تجاوز المحتوى حدود النافذة
2. تمرير سلس ومتجاوب
3. دعم التمرير بالماوس والكيبورد
4. مؤشرات بصرية للمحتوى القابل للتمرير

### تنفيذ التمرير
```ring
// Scroll area implementation
oScrollArea = new qScrollArea(win) {
    setGeometry(10, 80, nWindowWidth-20, nContentHeight)
    setWidgetResizable(true)
    setHorizontalScrollBarPolicy(Qt_ScrollBarAsNeeded)
    setVerticalScrollBarPolicy(Qt_ScrollBarAsNeeded)
    
    oContentWidget = new qWidget() {
        // All buttons and content go here
    }
    setWidget(oContentWidget)
}
```

## اختبار التجاوب

### سيناريوهات الاختبار
1. **اختبار الحد الأدنى**: 1024x768
2. **اختبار المتوسط**: 1366x768, 1440x900
3. **اختبار الكبير**: 1920x1080, 1920x1200
4. **اختبار الكبير جداً**: 2560x1440, 3840x2160

### معايير النجاح
- جميع العناصر مرئية ومتاحة
- لا توجد عناصر تتجاوز حدود النافذة
- التمرير يعمل بسلاسة عند الحاجة
- النصوص قابلة للقراءة في جميع الأحجام
- الأزرار قابلة للنقر بسهولة

## التوافق مع الأنظمة

### Windows
- دعم DPI scaling
- توافق مع Windows 7-11
- اختبار على دقات مختلفة

### Linux
- دعم X11 و Wayland
- توافق مع توزيعات مختلفة
- اختبار على بيئات سطح مكتب متنوعة

### macOS
- دعم Retina displays
- توافق مع macOS 10.12+
- اختبار على أحجام شاشات مختلفة

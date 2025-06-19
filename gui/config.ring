### Configuration File for Morgen Advanced Features GUI
### ملف التكوين لواجهة الميزات المتقدمة لمرجان
### Author: Morgen Project Team
### Date: 2024-12-30

//================================================
// System Configuration
//================================================

// Global configuration instance
oMorgenConfig = new MorgenAdvancedConfig()

class MorgenAdvancedConfig

    // System Information
    cSystemName = "مرجان المتقدم - Morgen Advanced"
    cSystemVersion = "2.0"
    cSystemDate = "2024-12-30"
    cSystemAuthor = "Morgen Project Team"

    // Window Configuration - Responsive Design
    nMainWindowWidth = 1200  // Default medium size
    nMainWindowHeight = 800
    nMainWindowX = 100
    nMainWindowY = 50

    // Feature Window Configuration
    nFeatureWindowWidth = 700  // Reduced for better fit
    nFeatureWindowHeight = 550
    nFeatureWindowOffsetX = 50
    nFeatureWindowOffsetY = 50

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

    // Button constraints
    nMinButtonWidth = 200
    nMaxButtonWidth = 350
    nMinButtonHeight = 60
    nMaxButtonHeight = 100

    // Font constraints
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

    // Colors Configuration
    aSystemColors = [
        ["primary", "#4A90E2"],
        ["secondary", "#228B22"],
        ["accent", "#DAA520"],
        ["background", "#F0F8FF"],
        ["text", "#2C5282"],
        ["success", "#32CD32"],
        ["warning", "#FF6347"],
        ["info", "#1E90FF"],
        ["light", "#F8F9FA"],
        ["dark", "#343A40"]
    ]

    // Feature Colors
    aFeatureColors = [
        ["self_awareness", "#4A90E2"],
        ["adaptive_learning", "#228B22"],
        ["advanced_memory", "#DAA520"],
        ["cognitive_cycle", "#4169E1"],
        ["dream_cycle", "#9370DB"],
        ["arabic_processing", "#8B4513"],
        ["meaning_condensation", "#20B2AA"],
        ["wave_dynamics", "#1E90FF"],
        ["emergent_structures", "#DC143C"],
        ["creative_emergence", "#FF8C00"]
    ]

    // Performance Settings
    nAnimationSpeed = 50  // milliseconds
    nUpdateInterval = 100  // milliseconds
    bEnableAnimations = true
    bEnableLogging = true
    bEnableDebugMode = false

    // Language Settings
    cDefaultLanguage = "arabic"
    bShowBilingualText = true

    // Advanced AI Settings
    nMaxDreamCycles = 100
    nDefaultHornDepth = 5
    nGlobalResonanceThreshold = 1.5
    nWaveStrengthDefault = 0.8
    nCondensationThreshold = 0.4

    // Memory Settings
    nMaxMemoryEntries = 1000
    nMemoryConsolidationInterval = 300  // seconds
    bAutoConsolidateMemory = true

    // Learning Settings
    nLearningRate = 0.1
    nAdaptationThreshold = 0.7
    bContinuousLearning = true

    // Visualization Settings
    bShowDetailedInfo = true
    bShowConnections = true
    bShowWaves = true
    bShowStructures = true
    nZoomLevel = 1.0
    nMinZoom = 0.3
    nMaxZoom = 4.0

    // File Paths
    cDataPath = "../data/"
    cLogPath = "../logs/"
    cExportPath = "../exports/"
    cConfigPath = "../config/"

    // Feature Descriptions
    aFeatureDescriptions = [
        ["🧠 الوعي الذاتي", "Self-Awareness Engine", "اكتشاف الأنماط الداخلية والتفكير الذاتي"],
        ["📚 التعلم التكيفي", "Adaptive Learning System", "تحسين الأداء التلقائي"],
        ["💾 الذاكرة المتطورة", "Advanced Memory System", "تخزين واسترجاع ذكي"],
        ["🔄 الدورة المعرفية", "Cognitive Cycle Manager", "تنسيق العمليات المعرفية"],
        ["🌀 دورة الحلم المتقدمة", "Enhanced Dream Cycles", "حَلّ + لَمّ + حُلْم"],
        ["🕌 معالجة العربية", "Arabic Processing Engine", "معالجة اللغة العربية المتقدم"],
        ["💎 تكثيف المعنى", "Meaning Condensation", "ضغط المفاهيم إلى جواهر معرفية"],
        ["🌊 ديناميكيات الأمواج", "Wave Dynamics System", "تأثيرات متموجة عبر الفضاء"],
        ["🔺 الهياكل الناشئة", "Emergent Structures", "تكوين تلقائي للتثليثات والمجرات"],
        ["🎨 الإبداع الناشئ", "Creative Emergence", "توليد إبداعي للنصوص والأفكار"]
    ]

    // System Messages
    aSystemMessages = [
        ["welcome", "مرحباً بك في النظام المتكامل للذكاء الاصطناعي المتقدم!"],
        ["initialization", "تم تهيئة جميع الأنظمة المتقدمة العشرة بنجاح!"],
        ["master_cycle", "تشغيل الدورة المعرفية الرئيسية..."],
        ["demo_complete", "انتهى العرض التوضيحي لجميع الميزات!"],
        ["system_ready", "النظام جاهز للعمل"],
        ["error_occurred", "حدث خطأ في النظام"],
        ["feature_opened", "تم فتح نافذة الميزة"],
        ["feature_closed", "تم إغلاق نافذة الميزة"],
        ["processing", "جاري المعالجة..."],
        ["completed", "اكتملت العملية بنجاح"]
    ]

    // Debug Settings
    bShowDebugInfo = false
    bLogToFile = true
    bShowTimestamps = true
    bVerboseLogging = false

    // Export Settings
    cDefaultExportFormat = "txt"
    aExportFormats = ["txt", "json", "xml", "csv"]
    bIncludeTimestamp = true
    bIncludeMetadata = true

    // Network Settings (for future web integration)
    nDefaultPort = 8080
    cDefaultHost = "localhost"
    bEnableWebInterface = false

    // Security Settings
    bRequireAuthentication = false
    cDefaultPassword = "morgen2024"
    nSessionTimeout = 3600  // seconds

    // Backup Settings
    bAutoBackup = true
    nBackupInterval = 1800  // seconds
    nMaxBackupFiles = 10

    // Methods
    func init()
        // Initialize configuration
        see "تهيئة نظام التكوين..." + nl
        return self

    func getColor(cColorName)
        for aColor in aSystemColors
            if aColor[1] = cColorName
                return aColor[2]
            ok
        next
        return "#000000"  // default black

    func getFeatureColor(cFeatureName)
        for aColor in aFeatureColors
            if aColor[1] = cFeatureName
                return aColor[2]
            ok
        next
        return "#4A90E2"  // default blue

    func getMessage(cMessageKey)
        for aMessage in aSystemMessages
            if aMessage[1] = cMessageKey
                return aMessage[2]
            ok
        next
        return "رسالة غير معروفة"  // unknown message

    func getFeatureDescription(nIndex)
        if nIndex >= 1 and nIndex <= len(aFeatureDescriptions)
            return aFeatureDescriptions[nIndex]
        ok
        return ["ميزة غير معروفة", "Unknown Feature", "وصف غير متوفر"]

    func saveConfig()
        // Save configuration to file (future implementation)
        see "حفظ التكوين..." + nl

    func loadConfig()
        // Load configuration from file (future implementation)
        see "تحميل التكوين..." + nl

    func resetToDefaults()
        // Reset all settings to default values
        see "إعادة تعيين التكوين للقيم الافتراضية..." + nl

    func detectScreenSize()
        // Detect current screen size and set appropriate values
        // Note: This is a simplified version - in real implementation
        // we would use Qt functions to get actual screen dimensions

        // For now, we'll use default medium size
        // In future versions, this can be enhanced with actual screen detection
        cCurrentScreenSize = "medium"
        nCurrentScreenWidth = 1366
        nCurrentScreenHeight = 768

        calculateScaleFactors()
        see "تم اكتشاف حجم الشاشة: " + cCurrentScreenSize + nl

    func calculateScaleFactors()
        // Calculate scale factors based on screen size
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
        // Return adaptive window size based on screen size
        for aSize in aScreenSizes
            if aSize[1] = cCurrentScreenSize
                return [aSize[4], aSize[5]]  // width, height
            ok
        next
        return [1200, 800]  // default medium size

    func getAdaptiveButtonSize()
        // Calculate adaptive button size
        nBaseWidth = 250  // Reduced from 270
        nBaseHeight = 75  // Reduced from 80

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
        // Calculate adaptive font size
        nSize = nBaseSize * nFontScaleFactor

        if nSize < nMinFontSize
            nSize = nMinFontSize
        but nSize > nMaxFontSize
            nSize = nMaxFontSize
        ok

        return nSize

    func getAdaptiveSpacing(nBaseSpacing)
        // Calculate adaptive spacing
        return nBaseSpacing * nSpacingScaleFactor

    func getOptimalGridLayout(nTotalButtons)
        // Calculate optimal grid layout based on screen size and button count
        switch cCurrentScreenSize
        on "minimum"
            // For small screens, use fewer columns
            nCols = 2
            nRows = ceil(nTotalButtons / 2.0)
        on "medium"
            // Standard layout
            nCols = 5
            nRows = ceil(nTotalButtons / 5.0)
        on "large"
            // Can accommodate standard layout comfortably
            nCols = 5
            nRows = ceil(nTotalButtons / 5.0)
        on "extra_large"
            // Can use wider layout if needed
            nCols = 5
            nRows = ceil(nTotalButtons / 5.0)
        off

        return [nCols, nRows]



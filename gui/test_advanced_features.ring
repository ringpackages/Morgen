### Test Suite for Morgen Advanced Features GUI
### مجموعة اختبارات لواجهة الميزات المتقدمة لمرجان
### Author: Morgen Project Team
### Date: 2024-12-30

load "config.ring"

//================================================
// Test Functions
//================================================

func testSystemConfiguration()
    see "=== اختبار تكوين النظام ===" + nl
    
    // Test configuration loading
    see "اختبار تحميل التكوين..." + nl
    if isObject(oMorgenConfig)
        see "✅ تم تحميل التكوين بنجاح" + nl
        see "اسم النظام: " + oMorgenConfig.cSystemName + nl
        see "إصدار النظام: " + oMorgenConfig.cSystemVersion + nl
    else
        see "❌ فشل في تحميل التكوين" + nl
        return false
    ok
    
    // Test color configuration
    see "اختبار ألوان النظام..." + nl
    cPrimaryColor = oMorgenConfig.getColor("primary")
    if len(cPrimaryColor) > 0
        see "✅ اللون الأساسي: " + cPrimaryColor + nl
    else
        see "❌ فشل في الحصول على اللون الأساسي" + nl
        return false
    ok
    
    // Test feature colors
    see "اختبار ألوان الميزات..." + nl
    cFeatureColor = oMorgenConfig.getFeatureColor("self_awareness")
    if len(cFeatureColor) > 0
        see "✅ لون الوعي الذاتي: " + cFeatureColor + nl
    else
        see "❌ فشل في الحصول على لون الميزة" + nl
        return false
    ok
    
    see "✅ اكتمل اختبار التكوين بنجاح" + nl + nl
    return true

func testAdvancedAIClasses()
    see "=== اختبار كلاسات الذكاء الاصطناعي المتقدمة ===" + nl
    
    // Test AdvancedAISystem
    see "اختبار النظام المتقدم..." + nl
    try {
        oSystem = new AdvancedAISystem()
        if isObject(oSystem)
            see "✅ تم إنشاء النظام المتقدم" + nl
        else
            see "❌ فشل في إنشاء النظام المتقدم" + nl
            return false
        ok
    catch 
        see "❌ خطأ في إنشاء النظام المتقدم: " + cCatchError + nl
        return false
    }
    
    // Test SelfAwarenessEngine
    see "اختبار محرك الوعي الذاتي..." + nl
    try {
        oAwareness = new SelfAwarenessEngine()
        if isObject(oAwareness)
            see "✅ تم إنشاء محرك الوعي الذاتي" + nl
            aPatterns = oAwareness.discoverInternalPatterns()
            see "الأنماط المكتشفة: " + len(aPatterns) + nl
        else
            see "❌ فشل في إنشاء محرك الوعي الذاتي" + nl
            return false
        ok
    catch
        see "❌ خطأ في إنشاء محرك الوعي الذاتي: " + cCatchError + nl
        return false
    }
    
    // Test AdaptiveLearningSystem
    see "اختبار نظام التعلم التكيفي..." + nl
    try {
        oLearning = new AdaptiveLearningSystem()
        if isObject(oLearning)
            see "✅ تم إنشاء نظام التعلم التكيفي" + nl
            aMetrics = oLearning.analyzePerformanceMetrics()
            see "مقاييس الأداء: " + len(aMetrics) + nl
        else
            see "❌ فشل في إنشاء نظام التعلم التكيفي" + nl
            return false
        ok
    catch
        see "❌ خطأ في إنشاء نظام التعلم التكيفي: " + cCatchError + nl
        return false
    }
    
    // Test other systems
    aSystemClasses = [
        "AdvancedMemorySystem",
        "CognitiveCycleManager", 
        "ArabicProcessingEngine",
        "MeaningCondensationEngine",
        "WaveDynamicsSystem",
        "EmergentStructuresEngine",
        "CreativeEmergenceSystem"
    ]
    
    for cClassName in aSystemClasses
        see "اختبار " + cClassName + "..." + nl
        try {
            eval("oTest = new " + cClassName + "()")
            if isObject(oTest)
                see "✅ تم إنشاء " + cClassName + nl
            else
                see "❌ فشل في إنشاء " + cClassName + nl
                return false
            ok
        catch
            see "❌ خطأ في إنشاء " + cClassName + ": " + cCatchError + nl
            return false
        }
    next
    
    see "✅ اكتمل اختبار الكلاسات بنجاح" + nl + nl
    return true

func testFeatureDescriptions()
    see "=== اختبار أوصاف الميزات ===" + nl
    
    for i = 1 to 10
        aDescription = oMorgenConfig.getFeatureDescription(i)
        see "الميزة " + i + ": " + aDescription[1] + " - " + aDescription[2] + nl
        see "  الوصف: " + aDescription[3] + nl
    next
    
    see "✅ اكتمل اختبار الأوصاف بنجاح" + nl + nl
    return true

func testSystemMessages()
    see "=== اختبار رسائل النظام ===" + nl
    
    aMessageKeys = ["welcome", "initialization", "master_cycle", "demo_complete", "system_ready"]
    
    for cKey in aMessageKeys
        cMessage = oMorgenConfig.getMessage(cKey)
        see cKey + ": " + cMessage + nl
    next
    
    see "✅ اكتمل اختبار الرسائل بنجاح" + nl + nl
    return true

func runAllTests()
    see "=================================================" + nl
    see "🧪 بدء اختبارات النظام المتقدم" + nl
    see "🧪 Starting Advanced System Tests" + nl
    see "=================================================" + nl + nl
    
    nPassedTests = 0
    nTotalTests = 4
    
    // Run individual tests
    if testSystemConfiguration()
        nPassedTests++
    ok
    
    if testAdvancedAIClasses()
        nPassedTests++
    ok
    
    if testFeatureDescriptions()
        nPassedTests++
    ok
    
    if testSystemMessages()
        nPassedTests++
    ok
    
    // Display results
    see "=================================================" + nl
    see "📊 نتائج الاختبارات" + nl
    see "📊 Test Results" + nl
    see "=================================================" + nl
    see "الاختبارات المجتازة: " + nPassedTests + " من " + nTotalTests + nl
    see "Passed Tests: " + nPassedTests + " of " + nTotalTests + nl
    
    if nPassedTests = nTotalTests
        see "🎉 جميع الاختبارات نجحت!" + nl
        see "🎉 All tests passed!" + nl
        see "النظام جاهز للتشغيل" + nl
        see "System ready to run" + nl
    else
        see "⚠️ بعض الاختبارات فشلت" + nl
        see "⚠️ Some tests failed" + nl
        see "يرجى مراجعة الأخطاء أعلاه" + nl
        see "Please review the errors above" + nl
    ok
    
    see "=================================================" + nl

func quickDemo()
    see "=== عرض سريع للنظام ===" + nl
    
    // Create instances of all systems
    see "إنشاء جميع الأنظمة..." + nl
    oAdvancedSystem = new AdvancedAISystem()
    oSelfAwareness = new SelfAwarenessEngine()
    oAdaptiveLearning = new AdaptiveLearningSystem()
    oAdvancedMemory = new AdvancedMemorySystem()
    oCognitiveCycle = new CognitiveCycleManager()
    oArabicProcessing = new ArabicProcessingEngine()
    oMeaningCondensation = new MeaningCondensationEngine()
    oWaveDynamics = new WaveDynamicsSystem()
    oEmergentStructures = new EmergentStructuresEngine()
    oCreativeEmergence = new CreativeEmergenceSystem()
    
    see "✅ تم إنشاء جميع الأنظمة" + nl + nl
    
    // Demonstrate each system
    see "عرض توضيحي للأنظمة:" + nl
    oSelfAwareness.demonstrateAwareness()
    oAdaptiveLearning.demonstrateLearning()
    oAdvancedMemory.demonstrateMemory()
    oCognitiveCycle.demonstrateCognition()
    oArabicProcessing.demonstrateArabicProcessing()
    oMeaningCondensation.demonstrateCondensation()
    oWaveDynamics.demonstrateWaves()
    oEmergentStructures.demonstrateEmergence()
    oCreativeEmergence.demonstrateCreativity()
    
    see nl + "✅ انتهى العرض التوضيحي" + nl

//================================================
// Main Test Execution
//================================================

if isMainSourceFile()
    runAllTests()
    see nl
    quickDemo()
ok

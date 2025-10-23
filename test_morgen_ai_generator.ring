# ==============================================================================
# Test Suite for Morgen AI Generator
# مجموعة اختبارات مولد مرجان الذكي
# ==============================================================================

load "morgen/intelligent_interface.ring"

# ==============================================================================
# Test Configuration
# إعدادات الاختبار
# ==============================================================================

# متغيرات الاختبار العامة
nTotalTests = 0
nPassedTests = 0
nFailedTests = 0
aTestResults = []

# ==============================================================================
# Main Execution
# التنفيذ الرئيسي
# ==============================================================================

# تشغيل جميع الاختبارات
runAllTests()

# تشغيل اختبارات الأداء
see nl
runPerformanceTests()

see nl + "🏁 انتهت جميع الاختبارات." + nl

# ==============================================================================
# Main Test Runner
# مشغل الاختبارات الرئيسي
# ==============================================================================

func runAllTests {
    see "🧪 بدء تشغيل مجموعة اختبارات مولد مرجان الذكي" + nl
    see copy("=", 60) + nl + nl
    
    # تشغيل مجموعات الاختبارات
    testKnowledgeStorage()
    testTextGenerator()
    testCodeGenerator()
    testIntelligentInterface()
    testSystemIntegration()
    
    # عرض النتائج النهائية
    displayTestSummary()
}

# ==============================================================================
# Knowledge Storage Tests
# اختبارات نظام التخزين
# ==============================================================================

func testKnowledgeStorage {
    see "📚 اختبار نظام التخزين المرجاني المتقدم" + nl
    see copy("=", 40) + nl 
    
    try {
        # إنشاء نظام التخزين
        oSpace = new MorgenSpace(3)
        oStorage = new AdvancedKnowledgeStorage(oSpace, 100)
        
        # اختبار 1: تخزين المعرفة
        runTest("تخزين المعرفة الأساسي", func {
            oSymbol = oStorage.storeKnowledge("test_knowledge", "هذا اختبار للمعرفة", 0.8)
            return isObject(oSymbol) and oSymbol.cType = "test_knowledge"
        })
        
        # اختبار 2: استرجاع المعرفة
        runTest("استرجاع المعرفة", func {
            aResults = oStorage.retrieveKnowledge("اختبار", 5)
            return len(aResults) > 0
        })
        
        # اختبار 3: العناقيد الدلالية
        runTest("تكوين العناقيد الدلالية", func {
            # إضافة معرفة متشابهة
            oStorage.storeKnowledge("test_knowledge", "اختبار آخر للمعرفة", 0.7)
            oStorage.storeKnowledge("test_knowledge", "اختبار ثالث للمعرفة", 0.6)
            return len(oStorage.aSemanticClusters) > 0
        })
        
        # اختبار 4: الفهرس القطبي
        runTest("الفهرس القطبي", func {
            return len(oStorage.aPolarCoordinateIndex) > 0
        })
        
        # اختبار 5: شبكة الرنين
        runTest("شبكة الرنين المرجاني", func {
            return len(oStorage.aResonanceNetwork) >= 0
        })
        
    catch
        see "❌ خطأ في اختبار نظام التخزين: " + cCatchError + nl
    }
    
    see nl
}

# ==============================================================================
# Text Generator Tests
# اختبارات مولد النصوص
# ==============================================================================

func testTextGenerator {
    see "📝 اختبار مولد النصوص المرجاني" + nl
    see copy("-", 35) + nl 
    
    try {
        # إنشاء مولد النصوص
        oSpace = new MorgenSpace(3)
        oStorage = new AdvancedKnowledgeStorage(oSpace, 100)
        oTextGen = new AdvancedTextGenerator(oSpace, oStorage, "arabic")
        
        # اختبار 1: توليد نص أساسي
        runTest("توليد نص أساسي", func {
            cText = oTextGen.generateText("الذكاء الاصطناعي", 20, "narrative")
            return len(cText) > 10 and cText != ""
        })
        
        # اختبار 2: أنماط مختلفة
        runTest("النمط الوصفي", func {
            cText = oTextGen.generateText("الطبيعة", 15, "descriptive")
            return len(cText) > 5
        })
        
        runTest("النمط الحجاجي", func {
            cText = oTextGen.generateText("التعليم", 15, "argumentative")
            return len(cText) > 5
        })
        
        # اختبار 3: مستويات الإبداع
        runTest("تغيير مستوى الإبداع", func {
            oTextGen.setCreativityLevel(0.9)
            return oTextGen.nCreativityLevel = 0.9
        })
        
        # اختبار 4: مستويات التماسك
        runTest("تغيير مستوى التماسك", func {
            oTextGen.setCoherenceLevel(0.8)
            return oTextGen.nCoherenceLevel = 0.8
        })
        
        # اختبار 5: دورة الأحلام
        runTest("دورة الأحلام التوليدية", func {
            aSeedSymbols = oTextGen.analyzeSeedPrompt("اختبار دورة الأحلام")
            aGeneratedSymbols = oTextGen.runGenerativeDreamCycle(aSeedSymbols, 10)
            return len(aGeneratedSymbols) >= len(aSeedSymbols)
        })
        
    catch
        see "❌ خطأ في اختبار مولد النصوص: " + cCatchError + nl
    }
    
    see nl
}

# ==============================================================================
# Code Generator Tests
# اختبارات مولد الأكواد
# ==============================================================================

func testCodeGenerator {
    see "💻 اختبار مولد الأكواد المرجاني" + nl
    see copy("-", 35) + nl 
    
    try {
        # إنشاء مولد الأكواد
        oSpace = new MorgenSpace(3)
        oStorage = new AdvancedKnowledgeStorage(oSpace, 100)
        oCodeGen = new AdvancedCodeGenerator(oSpace, oStorage, "ring")
        
        # اختبار 1: توليد دالة
        runTest("توليد دالة Ring", func {
            cCode = oCodeGen.generateCode("دالة للجمع", "function", [])
            return len(cCode) > 20 and substr(cCode, "func") > 0
        })
        
        # اختبار 2: توليد كلاس
        runTest("توليد كلاس", func {
            cCode = oCodeGen.generateCode("كلاس للطالب", "class", [])
            return len(cCode) > 20 and substr(cCode, "class") > 0
        })
        
        # اختبار 3: لغات مختلفة
        runTest("تغيير لغة البرمجة", func {
            oCodeGen.cTargetLanguage = "python"
            cCode = oCodeGen.generateCode("دالة بايثون", "function", [])
            return len(cCode) > 10
        })
        
        # اختبار 4: مستوى التعقيد
        runTest("تغيير مستوى التعقيد", func {
            oCodeGen.setComplexityLevel(0.8)
            return oCodeGen.nComplexityLevel = 0.8
        })
        
        # اختبار 5: مستوى التحسين
        runTest("تغيير مستوى التحسين", func {
            oCodeGen.setOptimizationLevel(0.9)
            return oCodeGen.nOptimizationLevel = 0.9
        })
        
    catch
        see "❌ خطأ في اختبار مولد الأكواد: " + cCatchError + nl
    }
    
    see nl
}

# ==============================================================================
# Intelligent Interface Tests
# اختبارات الواجهة الذكية
# ==============================================================================

func testIntelligentInterface {
    see "🧠 اختبار الواجهة الذكية" + nl
    see copy("-", 25) + nl
    
    try {
        # إنشاء الواجهة الذكية
        oInterface = new IntelligentInterface()
        
        # اختبار 1: تهيئة النظام
        runTest("تهيئة الواجهة الذكية", func {
            return isObject(oInterface.oMorgenSpace) and 
                   isObject(oInterface.oKnowledgeStorage) and
                   isObject(oInterface.oTextGenerator) and
                   isObject(oInterface.oCodeGenerator)
        })
        
        # اختبار 2: اكتشاف نوع الطلب
        runTest("اكتشاف طلب النص", func {
            cType = oInterface.detectRequestType("اكتب لي قصة")
            return cType = "text"
        })
        
        runTest("اكتشاف طلب الكود", func {
            cType = oInterface.detectRequestType("أنشئ دالة للحساب")
            return cType = "code"
        })
        
        # اختبار 3: تحليل النية
        runTest("تحليل نية المستخدم", func {
            cIntent = oInterface.analyzeUserIntent("كيف أتعلم البرمجة؟")
            return cIntent = "question"
        })
        
        # اختبار 4: إدارة التفضيلات
        runTest("تحديث التفضيلات", func {
            oInterface.updatePreference("test_pref", "test_value")
            return len(oInterface.aUserPreferences) > 0
        })
        
        # اختبار 5: تاريخ المحادثة
        runTest("تسجيل المحادثة",  func{
            oInterface.addToConversationHistory("user", "اختبار")
            return len(oInterface.aConversationHistory) > 0
        })
        
    catch
        see "❌ خطأ في اختبار الواجهة الذكية: " + cCatchError + nl
    }
    
    see nl
}

# ==============================================================================
# System Integration Tests
# اختبارات تكامل النظام
# ==============================================================================

func testSystemIntegration {
    see "🔗 اختبار تكامل النظام" + nl
    see copy("-", 25) + nl
    
    try {
        # إنشاء النظام المتكامل
        oInterface = new IntelligentInterface()
        
        # اختبار 1: التكامل بين المكونات
        runTest("تكامل المكونات", func {
            # تخزين معرفة
            oSymbol = oInterface.oKnowledgeStorage.storeKnowledge("integration_test", "اختبار التكامل", 0.8)
            
            # استرجاع المعرفة
            aResults = oInterface.oKnowledgeStorage.retrieveKnowledge("اختبار", 1)
            
            return isObject(oSymbol) and len(aResults) > 0
        })
        
        # اختبار 2: تدفق البيانات
        runTest("تدفق البيانات بين المكونات", func {
            # توليد نص وحفظه
            cText = oInterface.oTextGenerator.generateText("تدفق البيانات", 10, "narrative")
            oInterface.oKnowledgeStorage.storeKnowledge("generated_text", cText, 0.7)
            
            # البحث عن النص المحفوظ
            aResults = oInterface.oKnowledgeStorage.retrieveKnowledge("تدفق", 1)
            
            return len(cText) > 0 and len(aResults) > 0
        })
        
        # اختبار 3: الأداء العام
        runTest("اختبار الأداء", func {
            nStartTime = clock()
            
            # عمليات متعددة
            cText = oInterface.oTextGenerator.generateText("أداء", 5, "narrative")
            cCode = oInterface.oCodeGenerator.generateCode("اختبار الأداء", "function", [])
            
            nEndTime = clock()
            nElapsedTime = nEndTime - nStartTime
            
            return nElapsedTime < 10.0  # يجب أن يكتمل في أقل من 10 ثوان
        })
        
        # اختبار 4: استقرار النظام
        runTest("استقرار النظام", func {
            # تشغيل عمليات متعددة
            for i = 1 to 5 {
                oInterface.oTextGenerator.generateText("استقرار " + i, 5, "narrative")
                oInterface.oKnowledgeStorage.storeKnowledge("stability_test", "اختبار " + i, 0.5)
            }
            
            return len(oInterface.oMorgenSpace.aSymbols) > 0
        })
        
        # اختبار 5: حالة النظام
        runTest("حالة النظام", func {
            oStatus = oInterface.getSystemStatus()
            return isObject(oStatus) and 
                   oStatus["active"] = true and
                   oStatus["symbols_count"] > 0
        })
        
    catch
        see "❌ خطأ في اختبار تكامل النظام: " + cCatchError + nl
    }
    
    see nl
}

# ==============================================================================
# Test Utilities
# أدوات الاختبار
# ==============================================================================

func runTest cTestName, fTestFunction {
    nTotalTests++
    
    try {
        bResult = call fTestFunction()
        
        if bResult {
            see "✅ " + cTestName + nl
            nPassedTests++
            add(aTestResults, ["name" = cTestName, "status" = "PASS", "error" = ""])
        else
            see "❌ " + cTestName + " - فشل" + nl
            nFailedTests++
            add(aTestResults, ["name" = cTestName, "status" = "FAIL", "error" = "Test returned false"])
        }
        
    catch
        see "❌ " + cTestName + " - خطأ: " + cCatchError + nl
        nFailedTests++
        add(aTestResults, ["name" = cTestName, "status" = "ERROR", "error" = cCatchError])
    }
}

func displayTestSummary {
    see copy("=", 60) + nl
    see "📊 ملخص نتائج الاختبارات" + nl
    see copy("=", 60) + nl
    see "إجمالي الاختبارات: " + nTotalTests + nl
    see "نجح: " + nPassedTests + " ✅" + nl
    see "فشل: " + nFailedTests + " ❌" + nl
    
    nSuccessRate = 0
    if nTotalTests > 0 {
        nSuccessRate = (nPassedTests / nTotalTests) * 100
    }
    see "معدل النجاح: " + nSuccessRate + "%" + nl
    
    if nFailedTests > 0 {
        see nl + "🔍 تفاصيل الاختبارات الفاشلة:" + nl
        see copy("-", 25) + nl
        
        for oResult in aTestResults {
            if oResult["status"] != "PASS" {
                see "❌ " + oResult["name"] + nl
                if oResult["error"] != "" {
                    see "   الخطأ: " + oResult["error"] + nl
                }
            }
        }
    }
    
    see copy("=", 60) + nl
    
    if nFailedTests = 0 {
        see "🎉 جميع الاختبارات نجحت! النظام جاهز للاستخدام." + nl
    else
        see "⚠️ بعض الاختبارات فشلت. يرجى مراجعة الأخطاء أعلاه." + nl
    }
}

# ==============================================================================
# Performance Tests
# اختبارات الأداء
# ==============================================================================

func runPerformanceTests {
    see "⚡ اختبارات الأداء" + nl
    see copy("-", 20) + nl
    
    # اختبار سرعة توليد النص
    nStartTime = clock()
    oInterface = new IntelligentInterface()
    cText = oInterface.oTextGenerator.generateText("اختبار الأداء", 50, "narrative")
    nTextTime = clock() - nStartTime
    
    see "⏱️ وقت توليد النص (50 كلمة): " + nTextTime + " ثانية" + nl
    
    # اختبار سرعة توليد الكود
    nStartTime = clock()
    cCode = oInterface.oCodeGenerator.generateCode("اختبار الأداء", "function", [])
    nCodeTime = clock() - nStartTime
    
    see "⏱️ وقت توليد الكود: " + nCodeTime + " ثانية" + nl
    
    # اختبار استهلاك الذاكرة
    see "💾 عدد الرموز في النظام: " + len(oInterface.oMorgenSpace.aSymbols) + nl
    see "📚 حجم المعرفة المحفوظة: " + len(oInterface.oKnowledgeStorage.aKnowledgeIndex) + nl
}



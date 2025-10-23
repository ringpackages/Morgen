# ==============================================================================
# Demo Application for Morgen AI Generator
# تطبيق عرض توضيحي لمولد مرجان الذكي
# ==============================================================================

load "morgen/intelligent_interface.ring"

# ==============================================================================
# Demo Functions
# دوال العرض التوضيحي
# ==============================================================================

func main {
    displayWelcome()
    
    try {
        # إنشاء النظام
        see "🔄 جاري تهيئة نظام مرجان الذكي..." + nl
        oInterface = new IntelligentInterface()
        
        # عرض القدرات
        demonstrateCapabilities(oInterface)
        
        # عرض تفاعلي
        interactiveDemo(oInterface)
        
    catch
        see "❌ خطأ في تشغيل العرض: " + cCatchError + nl
    }
}

func displayWelcome {
    see nl
    see "🌟 مرحباً بك في العرض التوضيحي لمولد مرجان الذكي!" + nl
    see "=" * 55 + nl
    see "🎯 سنعرض لك قدرات النظام في:" + nl
    see "   • توليد النصوص العربية المتقدمة" + nl
    see "   • توليد الأكواد البرمجية الذكية" + nl
    see "   • نظام الذاكرة التكيفي" + nl
    see "   • الواجهة التفاعلية الذكية" + nl
    see "=" * 55 + nl + nl
}

func demonstrateCapabilities oInterface {
    see "🎬 عرض قدرات النظام" + nl
    see "-" * 20 + nl + nl
    
    # عرض توليد النصوص
    demonstrateTextGeneration(oInterface)
    
    # عرض توليد الأكواد
    demonstrateCodeGeneration(oInterface)
    
    # عرض نظام المعرفة
    demonstrateKnowledgeSystem(oInterface)
    
    # عرض الذكاء التفاعلي
    demonstrateIntelligentDetection(oInterface)
}

func demonstrateTextGeneration oInterface {
    see "📝 عرض توليد النصوص العربية" + nl
    see "-" * 30 + nl
    
    # مثال 1: نص سردي
    see "🎭 مثال 1: نص سردي عن التكنولوجيا" + nl
    cText1 = oInterface.oTextGenerator.generateText("التكنولوجيا في المستقبل", 25, "narrative")
    see "النتيجة: " + cText1 + nl + nl
    
    # مثال 2: نص وصفي
    see "🖼️ مثال 2: نص وصفي عن الطبيعة" + nl
    cText2 = oInterface.oTextGenerator.generateText("جمال الطبيعة", 20, "descriptive")
    see "النتيجة: " + cText2 + nl + nl
    
    # مثال 3: نص حجاجي
    see "💭 مثال 3: نص حجاجي عن التعليم" + nl
    cText3 = oInterface.oTextGenerator.generateText("أهمية التعليم", 20, "argumentative")
    see "النتيجة: " + cText3 + nl + nl
}

func demonstrateCodeGeneration oInterface {
    see "💻 عرض توليد الأكواد البرمجية" + nl
    see "-" * 35 + nl
    
    # مثال 1: دالة Ring
    see "🔧 مثال 1: دالة Ring للحساب" + nl
    cCode1 = oInterface.oCodeGenerator.generateCode("دالة لحساب مجموع رقمين", "function", [])
    see "النتيجة:" + nl + cCode1 + nl + nl
    
    # مثال 2: كلاس
    see "🏗️ مثال 2: كلاس للطالب" + nl
    cCode2 = oInterface.oCodeGenerator.generateCode("كلاس لإدارة بيانات الطالب", "class", [])
    see "النتيجة:" + nl + cCode2 + nl + nl
    
    # مثال 3: خوارزمية
    see "⚡ مثال 3: خوارزمية بسيطة" + nl
    cCode3 = oInterface.oCodeGenerator.generateCode("خوارزمية للبحث", "algorithm", [])
    see "النتيجة:" + nl + cCode3 + nl + nl
}

func demonstrateKnowledgeSystem oInterface {
    see "🧠 عرض نظام المعرفة التكيفي" + nl
    see "-" * 30 + nl
    
    # تخزين معرفة متنوعة
    see "💾 تخزين معرفة متنوعة..." + nl
    oInterface.oKnowledgeStorage.storeKnowledge("programming", "البرمجة فن وعلم", 0.9)
    oInterface.oKnowledgeStorage.storeKnowledge("ai", "الذكاء الاصطناعي مستقبل التكنولوجيا", 0.8)
    oInterface.oKnowledgeStorage.storeKnowledge("education", "التعليم أساس التقدم", 0.7)
    
    # البحث في المعرفة
    see "🔍 البحث في المعرفة المحفوظة..." + nl
    aResults1 = oInterface.oKnowledgeStorage.retrieveKnowledge("البرمجة", 2)
    see "نتائج البحث عن 'البرمجة': " + len(aResults1) + " نتيجة" + nl
    
    aResults2 = oInterface.oKnowledgeStorage.retrieveKnowledge("التكنولوجيا", 2)
    see "نتائج البحث عن 'التكنولوجيا': " + len(aResults2) + " نتيجة" + nl
    
    # عرض الإحصائيات
    see "📊 إحصائيات نظام المعرفة:" + nl
    see "عدد الرموز المخزنة: " + len(oInterface.oKnowledgeStorage.aKnowledgeIndex) + nl
    see "عدد العناقيد الدلالية: " + len(oInterface.oKnowledgeStorage.aSemanticClusters) + nl + nl
}

func demonstrateIntelligentDetection oInterface {
    see "🤖 عرض الذكاء التفاعلي" + nl
    see "-" * 25 + nl
    
    # اختبار اكتشاف أنواع الطلبات
    aTestRequests = [
        "اكتب لي قصة عن المستقبل",
        "أنشئ دالة لحساب المساحة", 
        "ما هو الذكاء الاصطناعي؟",
        "اكتب مقال عن البرمجة وأنشئ كود مثال"
    ]
    
    for i = 1 to len(aTestRequests) {
        cRequest = aTestRequests[i]
        cType = oInterface.detectRequestType(cRequest)
        cIntent = oInterface.analyzeUserIntent(cRequest)
        
        see i + ". الطلب: " + cRequest + nl
        see "   النوع المكتشف: " + cType + nl
        see "   النية المحللة: " + cIntent + nl + nl
    }
}

func interactiveDemo oInterface {
    see "🎮 العرض التفاعلي" + nl
    see "-" * 15 + nl
    see "الآن يمكنك تجربة النظام بنفسك!" + nl
    see "اكتب طلبك (أو 'خروج' للإنهاء):" + nl + nl
    
    while true {
        see "👤 أدخل طلبك: "
        give cUserRequest
        
        if lower(trim(cUserRequest)) = "خروج" or lower(trim(cUserRequest)) = "exit" {
            see "👋 شكراً لتجربة مولد مرجان الذكي!" + nl
            exit
        }
        
        if trim(cUserRequest) = "" {
            see "يرجى إدخال طلب صحيح." + nl
            loop
        }
        
        # معالجة الطلب
        see "🤖 مرجان: جاري معالجة طلبك..." + nl
        
        cType = oInterface.detectRequestType(cUserRequest)
        
        if cType = "text" {
            cResult = oInterface.oTextGenerator.generateText(cUserRequest, 30, "narrative")
            see "📝 النص المولد: " + cResult + nl
        elseif cType = "code"
            cResult = oInterface.oCodeGenerator.generateCode(cUserRequest, "function", [])
            see "💻 الكود المولد:" + nl + cResult + nl
        elseif cType = "mixed"
            see "🎭 وضع مختلط - سأولد نصاً وكوداً:" + nl
            cText = oInterface.oTextGenerator.generateText(cUserRequest, 20, "descriptive")
            cCode = oInterface.oCodeGenerator.generateCode(cUserRequest, "function", [])
            see "📝 النص: " + cText + nl
            see "💻 الكود:" + nl + cCode + nl
        else
            cAnswer = oInterface.generateAnswer(cUserRequest)
            see "💭 الإجابة: " + cAnswer + nl
        }
        
        # حفظ في المعرفة
        oInterface.oKnowledgeStorage.storeKnowledge("user_request", cUserRequest, 0.6)
        
        see nl + "=" * 50 + nl
    }
}

func displaySystemStats oInterface {
    see "📊 إحصائيات النظام النهائية" + nl
    see "=" * 35 + nl
    
    oStatus = oInterface.getSystemStatus()
    
    see "🌌 الفضاء المرجاني:" + nl
    see "   عدد الرموز: " + oStatus["symbols_count"] + nl
    see "   العصر الحالي: " + oStatus["current_epoch"] + nl + nl
    
    see "🧠 نظام المعرفة:" + nl
    see "   حجم المعرفة: " + oStatus["knowledge_count"] + nl + nl
    
    see "💬 المحادثة:" + nl
    see "   طول المحادثة: " + oStatus["conversation_length"] + nl
    see "   الوضع الحالي: " + oStatus["mode"] + nl + nl
    
    see "✨ شكراً لاستخدام مولد مرجان الذكي!" + nl
    see "النظام جاهز للاستخدام الكامل." + nl
}



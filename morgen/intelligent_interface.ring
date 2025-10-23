# ==============================================================================
# Morgen Intelligent Interface
# واجهة مرجان الذكية للتفاعل مع النظام
# ==============================================================================

load "space.ring"
load "advanced_knowledge_storage.ring"
load "advanced_text_generator.ring"
load "advanced_code_generator.ring"

# ==============================================================================
# Class: IntelligentInterface
# واجهة التفاعل الذكية مع النظام المرجاني
# ==============================================================================
class IntelligentInterface {
    ### --- Public Attributes & Methods ---
    oMorgenSpace            # المرجع للفضاء المرجاني
    oKnowledgeStorage       # نظام التخزين المتقدم
    oTextGenerator          # مولد النصوص المرجاني
    oCodeGenerator          # مولد الأكواد المرجاني
    aConversationHistory    # تاريخ المحادثة
    aUserPreferences        # تفضيلات المستخدم
    cCurrentMode            # الوضع الحالي (text, code, mixed)
    bIsActive               # حالة النشاط
    
    /*
    Function: init
    Description: تهيئة واجهة التفاعل الذكية
    */
    func init {
        # إنشاء المكونات الأساسية
        self.oMorgenSpace = new MorgenSpace(5)
        self.oKnowledgeStorage = new AdvancedKnowledgeStorage(self.oMorgenSpace, 10000)
        self.oTextGenerator = new AdvancedTextGenerator(self.oMorgenSpace, self.oKnowledgeStorage, "arabic")
        self.oCodeGenerator = new AdvancedCodeGenerator(self.oMorgenSpace, self.oKnowledgeStorage, "ring")
        
        # تهيئة المتغيرات
        self.aConversationHistory = []
        self.aUserPreferences = []
        self.cCurrentMode = "mixed"
        self.bIsActive = true
        
        # تحميل التفضيلات الافتراضية
        self.loadDefaultPreferences()
        
        see "🧠 تم تهيئة واجهة مرجان الذكية بنجاح!" + nl
        see "   الوضع الحالي: " + self.cCurrentMode + nl
        see "   حالة النشاط: " + self.bIsActive + nl + nl
        
        # عرض رسالة الترحيب
        self.displayWelcomeMessage()
    }
    
    /*
    Function: startInteractiveSession
    Description: بدء جلسة تفاعلية مع المستخدم
    */
    func startInteractiveSession {
        see "🚀 بدء الجلسة التفاعلية مع مرجان..." + nl + nl
        
        while self.bIsActive {
            # عرض القائمة الرئيسية
            self.displayMainMenu()
            
            # قراءة اختيار المستخدم
            see "اختر من القائمة (أو 'خروج' للإنهاء): "
            give cUserInput
            
            # معالجة الإدخال
            self.processUserInput(cUserInput)
            
            see nl + "=" * 50 + nl
        }
        
        see "👋 شكراً لاستخدام مرجان! وداعاً." + nl
    }
    
    /*
    Function: displayWelcomeMessage
    Description: عرض رسالة الترحيب
    */
    func displayWelcomeMessage {
        see "🌟 مرحباً بك في مرجان - النظام الذكي لتوليد النصوص والأكواد!" + nl
        see copy("=", 60) + nl
        see "🎯 مرجان يستخدم الذكاء الاصطناعي المتقدم والرياضيات المرجانية" + nl
        see "   لتوليد نصوص عربية متقدمة وأكواد برمجية ذكية" + nl
        see nl
        see "✨ الميزات المتاحة:" + nl
        see "   • توليد النصوص العربية بأنماط مختلفة" + nl
        see "   • توليد أكواد البرمجة بلغات متعددة" + nl
        see "   • التعلم التكيفي من تفاعلاتك" + nl
        see "   • نظام ذاكرة متقدم للمعرفة" + nl
        see copy("=", 60) + nl + nl
    }
    
    /*
    Function: displayMainMenu
    Description: عرض القائمة الرئيسية
    */
    func displayMainMenu {
        see "📋 القائمة الرئيسية - مرجان الذكي" + nl
        see "-" * 35 + nl
        see "1️⃣  توليد نص عربي" + nl
        see "2️⃣  توليد كود برمجي" + nl
        see "3️⃣  وضع التفاعل المختلط" + nl
        see "4️⃣  إدارة المعرفة" + nl
        see "5️⃣  عرض الإحصائيات" + nl
        see "6️⃣  إعدادات النظام" + nl
        see "7️⃣  تاريخ المحادثة" + nl
        see "8️⃣  مساعدة" + nl
        see "0️⃣  خروج" + nl
        see copy("-", 35) + nl
    }
    
    /*
    Function: processUserInput
    Description: معالجة إدخال المستخدم
    */
    func processUserInput cInput {
        # تسجيل الإدخال في التاريخ
        self.addToConversationHistory("user", cInput)
        
        # تحليل الإدخال
        cInput = trim(lower(cInput))
        
        # معالجة الأوامر
        if cInput = "1" or substr(cInput, "نص") > 0 {
            self.handleTextGeneration()
        elseif cInput = "2" or substr(cInput, "كود") > 0
            self.handleCodeGeneration()
        elseif cInput = "3" or substr(cInput, "مختلط") > 0
            self.handleMixedMode()
        elseif cInput = "4" or substr(cInput, "معرفة") > 0
            self.handleKnowledgeManagement()
        elseif cInput = "5" or substr(cInput, "إحصائيات") > 0
            self.handleStatistics()
        elseif cInput = "6" or substr(cInput, "إعدادات") > 0
            self.handleSettings()
        elseif cInput = "7" or substr(cInput, "تاريخ") > 0
            self.handleConversationHistory()
        elseif cInput = "8" or substr(cInput, "مساعدة") > 0
            self.handleHelp()
        elseif cInput = "0" or cInput = "خروج" or cInput = "exit"
            self.bIsActive = false
        else
            # محاولة فهم الإدخال الحر
            self.handleFreeInput(cInput)
        }
    }
    
    /*
    Function: handleTextGeneration
    Description: معالجة طلب توليد النص
    */
    func handleTextGeneration {
        see "📝 وضع توليد النصوص العربية" + nl
        see copy("-", 35) + nl
        
        # طلب المحفز من المستخدم
        see "أدخل النص المحفز أو الموضوع: "
        give cPrompt
        
        if trim(cPrompt) = "" {
            see "❌ يجب إدخال نص محفز!" + nl
            return
        }
        
        # طلب طول النص
        see "أدخل الطول المطلوب (عدد الكلمات، افتراضي 50): "
        give cLength
        nLength = 50
        if isdigit(cLength) and number(cLength) > 0 {
            nLength = number(cLength)
        }
        
        # طلب نمط النص
        see "اختر نمط النص:" + nl
        see "1. سردي (narrative)" + nl
        see "2. وصفي (descriptive)" + nl
        see "3. حجاجي (argumentative)" + nl
        see "أدخل اختيارك (افتراضي: سردي): "
        give cStyleChoice
        
        cStyle = "narrative"
        if cStyleChoice = "2" {
            cStyle = "descriptive"
        elseif cStyleChoice = "3"
            cStyle = "argumentative"
        }
        
        # توليد النص
        see nl + "🎨 جاري توليد النص..." + nl
        cGeneratedText = self.oTextGenerator.generateText(cPrompt, nLength, cStyle)
        
        # عرض النتيجة
        see nl + "✨ النص المولد:" + nl
        see copy("=", 40) + nl
        see cGeneratedText + nl
        see copy("=", 40) + nl
        
        # تسجيل النتيجة في التاريخ
        self.addToConversationHistory("system", "تم توليد نص: " + cGeneratedText)
        
        # حفظ النص في المعرفة
        self.oKnowledgeStorage.storeKnowledge("generated_text", cGeneratedText, 0.8)
    }
    
    /*
    Function: handleCodeGeneration
    Description: معالجة طلب توليد الكود
    */
    func handleCodeGeneration {
        see "💻 وضع توليد الأكواد البرمجية" + nl
        see copy("-", 35) + nl
        
        # طلب المتطلب من المستخدم
        see "أدخل وصف الكود المطلوب: "
        give cRequirement
        
        if trim(cRequirement) = "" {
            see "❌ يجب إدخال وصف للكود!" + nl
            return
        }
        
        # طلب نوع الكود
        see "اختر نوع الكود:" + nl
        see "1. دالة (function)" + nl
        see "2. كلاس (class)" + nl
        see "3. خوارزمية (algorithm)" + nl
        see "أدخل اختيارك (افتراضي: دالة): "
        give cTypeChoice
        
        cCodeType = "function"
        if cTypeChoice = "2" {
            cCodeType = "class"
        elseif cTypeChoice = "3"
            cCodeType = "algorithm"
        }
        
        # طلب لغة البرمجة
        see "اختر لغة البرمجة:" + nl
        see "1. Ring" + nl
        see "2. Python" + nl
        see "3. JavaScript" + nl
        see "أدخل اختيارك (افتراضي: Ring): "
        give cLangChoice
        
        cLanguage = "ring"
        if cLangChoice = "2" {
            cLanguage = "python"
        elseif cLangChoice = "3"
            cLanguage = "javascript"
        }
        
        # تحديث لغة المولد
        self.oCodeGenerator.cTargetLanguage = cLanguage
        
        # توليد الكود
        see nl + "⚡ جاري توليد الكود..." + nl
        cGeneratedCode = self.oCodeGenerator.generateCode(cRequirement, cCodeType, [])
        
        # عرض النتيجة
        see nl + "✨ الكود المولد:" + nl
        see copy("=", 50) + nl
        see cGeneratedCode + nl
        see copy("=", 50) + nl
        
        # تسجيل النتيجة في التاريخ
        self.addToConversationHistory("system", "تم توليد كود: " + cCodeType + " بلغة " + cLanguage)
        
        # حفظ الكود في المعرفة
        self.oKnowledgeStorage.storeKnowledge("generated_code", cGeneratedCode, 0.9)
    }
    
    /*
    Function: handleMixedMode
    Description: معالجة الوضع المختلط
    */
    func handleMixedMode {
        see "🎭 الوضع المختلط - نص وكود معاً" + nl
        see copy("-", 35) + nl
        
        see "أدخل طلبك (سيحدد مرجان تلقائياً ما إذا كان نصاً أم كوداً): "
        give cRequest
        
        if trim(cRequest) = "" {
            see "❌ يجب إدخال طلب!" + nl
            return
        }
        
        # تحليل الطلب لتحديد النوع
        cDetectedType = self.detectRequestType(cRequest)
        
        see "🔍 تم اكتشاف نوع الطلب: " + cDetectedType + nl + nl
        
        if cDetectedType = "code" {
            # توليد كود
            cResult = self.oCodeGenerator.generateCode(cRequest, "function", [])
            see "💻 الكود المولد:" + nl
            see "=" * 40 + nl
            see cResult + nl
            see "=" * 40 + nl
        elseif cDetectedType = "text"
            # توليد نص
            cResult = self.oTextGenerator.generateText(cRequest, 100, "narrative")
            see "📝 النص المولد:" + nl
            see copy("=", 40) + nl
            see cResult + nl
            see copy("=", 40) + nl
        else
            # وضع مختلط - توليد كلاهما
            see "🎭 توليد مختلط - نص وكود:" + nl + nl
            
            cText = self.oTextGenerator.generateText(cRequest, 50, "descriptive")
            see "📝 النص:" + nl
            see cText + nl + nl
            
            cCode = self.oCodeGenerator.generateCode(cRequest, "function", [])
            see "💻 الكود:" + nl
            see cCode + nl
        }
        
        # تسجيل في التاريخ
        self.addToConversationHistory("system", "وضع مختلط: " + cDetectedType)
    }
    
    /*
    Function: detectRequestType
    Description: اكتشاف نوع الطلب
    */
    func detectRequestType cRequest {
        cLowerRequest = lower(cRequest)
        
        # كلمات مفتاحية للكود
        aCodeKeywords = ["function", "class", "algorithm", "code", "program", 
                        "دالة", "كلاس", "كود", "برنامج", "خوارزمية"]
        
        # كلمات مفتاحية للنص
        aTextKeywords = ["story", "article", "description", "essay", "text",
                        "قصة", "مقال", "وصف", "نص", "كتابة"]
        
        nCodeScore = 0
        nTextScore = 0
        
        # حساب نقاط الكود
        for cKeyword in aCodeKeywords {
            if substr(cLowerRequest, cKeyword) > 0 {
                nCodeScore++
            }
        }
        
        # حساب نقاط النص
        for cKeyword in aTextKeywords {
            if substr(cLowerRequest, cKeyword) > 0 {
                nTextScore++
            }
        }
        
        # تحديد النوع
        if nCodeScore > nTextScore {
            return "code"
        elseif nTextScore > nCodeScore
            return "text"
        else
            return "mixed"
        }
    }
    
    /*
    Function: handleKnowledgeManagement
    Description: معالجة إدارة المعرفة
    */
    func handleKnowledgeManagement {
        see "🧠 إدارة المعرفة المرجانية" + nl
        see copy("-", 40) + nl
        see "1. عرض إحصائيات المعرفة" + nl
        see "2. البحث في المعرفة" + nl
        see "3. إضافة معرفة جديدة" + nl
        see "4. عرض العناقيد الدلالية" + nl
        see "أدخل اختيارك: "
        give cChoice
        
        if cChoice = "1" {
            self.oKnowledgeStorage.displayStorageStatistics()
        elseif cChoice = "2"
            see "أدخل استعلام البحث: "
            give cQuery
            aResults = self.oKnowledgeStorage.retrieveKnowledge(cQuery, 5)
            see "نتائج البحث (" + len(aResults) + " نتيجة):" + nl
            for i = 1 to len(aResults) {
                see i + ". " + aResults[i]["symbol"].cId + " (نقاط: " + aResults[i]["score"] + ")" + nl
            }
        elseif cChoice = "3"
            see "أدخل المعرفة الجديدة: "
            give cKnowledge
            see "أدخل نوع المعرفة: "
            give cType
            self.oKnowledgeStorage.storeKnowledge(cType, cKnowledge, 0.8)
            see "✅ تم حفظ المعرفة بنجاح!" + nl
        elseif cChoice = "4"
            see "عدد العناقيد الدلالية: " + len(self.oKnowledgeStorage.aSemanticClusters) + nl
            for i = 1 to len(self.oKnowledgeStorage.aSemanticClusters) {
                oCluster = self.oKnowledgeStorage.aSemanticClusters[i]
                see i + ". " + oCluster["id"] + " (" + len(oCluster["symbols"]) + " رمز)" + nl
            }
        }
    }
    
    /*
    Function: handleStatistics
    Description: معالجة عرض الإحصائيات
    */
    func handleStatistics {
        see "📊 إحصائيات النظام المرجاني" + nl
        see copy("=", 40) + nl
        
        # إحصائيات الفضاء المرجاني
        see "🌌 الفضاء المرجاني:" + nl
        see "   عدد الرموز: " + len(self.oMorgenSpace.aSymbols) + nl
        see "   الرنين العام: " + self.oMorgenSpace.nGlobalResonance + nl
        see "   العصر الحالي: " + self.oMorgenSpace.nEpoch + nl + nl
        
        # إحصائيات التخزين
        self.oKnowledgeStorage.displayStorageStatistics()
        
        # إحصائيات المولدات
        self.oTextGenerator.displayGeneratorStatistics()
        self.oCodeGenerator.displayGeneratorStatistics()
        
        # إحصائيات المحادثة
        see "💬 إحصائيات المحادثة:" + nl
        see "   عدد الرسائل: " + len(self.aConversationHistory) + nl
        see "   الوضع الحالي: " + self.cCurrentMode + nl
        see copy("=", 40) + nl
    }
    
    /*
    Function: addToConversationHistory
    Description: إضافة رسالة لتاريخ المحادثة
    */
    func addToConversationHistory cSender, cMessage {
        oMessage = [
            "sender" = cSender,
            "message" = cMessage,
            "timestamp" = self.oMorgenSpace.nEpoch,
            "mode" = self.cCurrentMode
        ]
        add(self.aConversationHistory, oMessage)
    }
    
    /*
    Function: loadDefaultPreferences
    Description: تحميل التفضيلات الافتراضية
    */
    func loadDefaultPreferences {
        add(self.aUserPreferences, ["key" = "default_text_length", "value" = 100])
        add(self.aUserPreferences, ["key" = "default_language", "value" = "arabic"])
        add(self.aUserPreferences, ["key" = "default_code_language", "value" = "ring"])
        add(self.aUserPreferences, ["key" = "creativity_level", "value" = 0.7])
        add(self.aUserPreferences, ["key" = "optimization_level", "value" = 0.8])
    }

    /*
    Function: handleSettings
    Description: معالجة إعدادات النظام
    */
    func handleSettings {
        see "⚙️ إعدادات النظام المرجاني" + nl
        see "-" * 30 + nl
        see "1. تغيير مستوى الإبداع" + nl
        see "2. تغيير مستوى التحسين" + nl
        see "3. تغيير اللغة الافتراضية" + nl
        see "4. تغيير لغة البرمجة الافتراضية" + nl
        see "5. عرض الإعدادات الحالية" + nl
        see "6. إعادة تعيين الإعدادات" + nl
        see "أدخل اختيارك: "
        give cChoice

        if cChoice = "1" {
            see "أدخل مستوى الإبداع (0.0 - 1.0): "
            give cLevel
            if isnumber(cLevel) {
                nLevel = number(cLevel)
                self.oTextGenerator.setCreativityLevel(nLevel)
                self.updatePreference("creativity_level", nLevel)
            }
        elseif cChoice = "2"
            see "أدخل مستوى التحسين (0.0 - 1.0): "
            give cLevel
            if isnumber(cLevel) {
                nLevel = number(cLevel)
                self.oCodeGenerator.setOptimizationLevel(nLevel)
                self.updatePreference("optimization_level", nLevel)
            }
        elseif cChoice = "3"
            see "أدخل اللغة الافتراضية (arabic/english): "
            give cLang
            self.updatePreference("default_language", cLang)
        elseif cChoice = "4"
            see "أدخل لغة البرمجة الافتراضية (ring/python/javascript): "
            give cCodeLang
            self.oCodeGenerator.cTargetLanguage = cCodeLang
            self.updatePreference("default_code_language", cCodeLang)
        elseif cChoice = "5"
            self.displayCurrentSettings()
        elseif cChoice = "6"
            self.resetSettings()
        }
    }

    /*
    Function: handleConversationHistory
    Description: معالجة تاريخ المحادثة
    */
    func handleConversationHistory {
        see "📜 تاريخ المحادثة" + nl
        see "-" * 20 + nl

        if len(self.aConversationHistory) = 0 {
            see "لا يوجد تاريخ محادثة حتى الآن." + nl
            return
        }

        see "عدد الرسائل: " + len(self.aConversationHistory) + nl + nl

        # عرض آخر 10 رسائل
        nStart = max(1, len(self.aConversationHistory) - 9)
        for i = nStart to len(self.aConversationHistory) {
            oMessage = self.aConversationHistory[i]
            cSenderIcon = "👤"
            if oMessage["sender"] = "system" {
                cSenderIcon = "🤖"
            }

            see cSenderIcon + " [" + oMessage["timestamp"] + "] " +
                substr(oMessage["message"], 1, 50)
            if len(oMessage["message"]) > 50 {
                see "..."
            }
            see nl
        }

        see nl + "هل تريد عرض التاريخ الكامل؟ (نعم/لا): "
        give cShowAll
        if lower(cShowAll) = "نعم" or lower(cShowAll) = "yes" {
            self.displayFullConversationHistory()
        }
    }

    /*
    Function: handleHelp
    Description: معالجة طلب المساعدة
    */
    func handleHelp {
        see "❓ مساعدة مرجان الذكي" + nl
        see "=" * 25 + nl + nl

        see "🎯 حول مرجان:" + nl
        see "مرجان هو نظام ذكي متقدم يستخدم الرياضيات المرجانية" + nl
        see "والذكاء الاصطناعي لتوليد النصوص العربية والأكواد البرمجية." + nl + nl

        see "📝 توليد النصوص:" + nl
        see "• أدخل نصاً محفزاً أو موضوعاً" + nl
        see "• اختر الطول المطلوب (عدد الكلمات)" + nl
        see "• اختر النمط: سردي، وصفي، أو حجاجي" + nl
        see "• سيقوم مرجان بتوليد نص متماسك ومبدع" + nl + nl

        see "💻 توليد الأكواد:" + nl
        see "• اكتب وصفاً للكود المطلوب" + nl
        see "• اختر نوع الكود: دالة، كلاس، أو خوارزمية" + nl
        see "• اختر لغة البرمجة: Ring، Python، أو JavaScript" + nl
        see "• سيقوم مرجان بتوليد كود محسن ومعلق" + nl + nl

        see "🎭 الوضع المختلط:" + nl
        see "• أدخل طلبك بلغة طبيعية" + nl
        see "• سيحدد مرجان تلقائياً نوع المحتوى المطلوب" + nl
        see "• يمكن توليد نص وكود معاً حسب السياق" + nl + nl

        see "🧠 إدارة المعرفة:" + nl
        see "• يحفظ مرجان كل ما تولده في ذاكرته" + nl
        see "• يمكن البحث في المعرفة المحفوظة" + nl
        see "• يتعلم من تفاعلاتك ويحسن أداءه" + nl + nl

        see "⚙️ الإعدادات:" + nl
        see "• يمكن تخصيص مستوى الإبداع والتحسين" + nl
        see "• تغيير اللغات الافتراضية" + nl
        see "• حفظ تفضيلاتك الشخصية" + nl + nl

        see "💡 نصائح للاستخدام الأمثل:" + nl
        see "• كن واضحاً ومحدداً في طلباتك" + nl
        see "• جرب أنماطاً مختلفة للحصول على نتائج متنوعة" + nl
        see "• استخدم الوضع المختلط للحصول على محتوى شامل" + nl
        see "• راجع تاريخ المحادثة للاستفادة من النتائج السابقة" + nl
        see copy("-", 35) + nl
    }

    /*
    Function: handleFreeInput
    Description: معالجة الإدخال الحر
    */
    func handleFreeInput cInput {
        see "🤔 محاولة فهم الطلب: " + cInput + nl

        # تحليل الطلب باستخدام الذكاء الاصطناعي المرجاني
        cAnalysis = self.analyzeUserIntent(cInput)

        see "🔍 تحليل الطلب: " + cAnalysis + nl

        # تنفيذ الإجراء المناسب
        if cAnalysis = "text_generation" {
            see "📝 سأقوم بتوليد نص لك..." + nl
            cResult = self.oTextGenerator.generateText(cInput, 80, "narrative")
            see "النتيجة: " + cResult + nl
        elseif cAnalysis = "code_generation"
            see "💻 سأقوم بتوليد كود لك..." + nl
            cResult = self.oCodeGenerator.generateCode(cInput, "function", [])
            see "النتيجة: " + cResult + nl
        elseif cAnalysis = "question"
            see "❓ هذا سؤال، سأحاول الإجابة..." + nl
            cAnswer = self.generateAnswer(cInput)
            see "الإجابة: " + cAnswer + nl
        else
            see "🤷 لم أتمكن من فهم طلبك بوضوح." + nl
            see "يرجى استخدام القائمة الرئيسية أو كتابة طلب أكثر وضوحاً." + nl
        }

        # تسجيل في التاريخ
        self.addToConversationHistory("system", "إدخال حر: " + cAnalysis)
    }

    /*
    Function: analyzeUserIntent
    Description: تحليل نية المستخدم
    */
    func analyzeUserIntent cInput {
        cLowerInput = lower(cInput)

        # كلمات مفتاحية للنص
        aTextKeywords = ["اكتب", "أنشئ", "ولد", "نص", "مقال", "قصة", "وصف"]

        # كلمات مفتاحية للكود
        aCodeKeywords = ["برمج", "كود", "دالة", "برنامج", "خوارزمية", "function", "code"]

        # كلمات مفتاحية للأسئلة
        aQuestionKeywords = ["ما", "كيف", "متى", "أين", "لماذا", "هل", "?"]

        nTextScore = 0
        nCodeScore = 0
        nQuestionScore = 0

        # حساب النقاط
        for cKeyword in aTextKeywords {
            if substr(cLowerInput, cKeyword) > 0 {
                nTextScore++
            }
        }

        for cKeyword in aCodeKeywords {
            if substr(cLowerInput, cKeyword) > 0 {
                nCodeScore++
            }
        }

        for cKeyword in aQuestionKeywords {
            if substr(cLowerInput, cKeyword) > 0 {
                nQuestionScore++
            }
        }

        # تحديد النية
        if nCodeScore > nTextScore and nCodeScore > nQuestionScore {
            return "code_generation"
        elseif nTextScore > nCodeScore and nTextScore > nQuestionScore
            return "text_generation"
        elseif nQuestionScore > 0
            return "question"
        else
            return "unknown"
        }
    }

    /*
    Function: generateAnswer
    Description: توليد إجابة للسؤال
    */
    func generateAnswer cQuestion {
        # البحث في المعرفة المحفوظة
        aResults = self.oKnowledgeStorage.retrieveKnowledge(cQuestion, 3)

        if len(aResults) > 0 {
            # استخدام المعرفة الموجودة
            oTopResult = aResults[1]
            cAnswer = "بناءً على معرفتي: "

            if isObject(oTopResult["symbol"]) and isString(oTopResult["symbol"].oData) {
                cAnswer += oTopResult["symbol"].oData
            else
                cAnswer += "لدي معلومات ذات صلة بسؤالك."
            }
        else
            # توليد إجابة عامة
            cAnswer = "هذا سؤال مثير للاهتمام. "
            cAnswer += self.oTextGenerator.generateText(cQuestion, 30, "descriptive")
        }

        return cAnswer
    }

    /*
    Function: updatePreference
    Description: تحديث تفضيل المستخدم
    */
    func updatePreference cKey, oValue {
        bFound = false
        for i = 1 to len(self.aUserPreferences) {
            if self.aUserPreferences[i]["key"] = cKey {
                self.aUserPreferences[i]["value"] = oValue
                bFound = true
                exit
            }
        }

        if not bFound {
            add(self.aUserPreferences, ["key" = cKey, "value" = oValue])
        }

        see "✅ تم تحديث التفضيل: " + cKey + " = " + oValue + nl
    }

    /*
    Function: displayCurrentSettings
    Description: عرض الإعدادات الحالية
    */
    func displayCurrentSettings {
        see "⚙️ الإعدادات الحالية:" + nl
        see copy("-", 30) + nl

        for oPref in self.aUserPreferences {
            see "• " + oPref["key"] + ": " + oPref["value"] + nl
        }

        see nl + "إعدادات المولدات:" + nl
        see "• مستوى إبداع النص: " + self.oTextGenerator.nCreativityLevel + nl
        see "• مستوى تماسك النص: " + self.oTextGenerator.nCoherenceLevel + nl
        see "• مستوى تعقيد الكود: " + self.oCodeGenerator.nComplexityLevel + nl
        see "• مستوى تحسين الكود: " + self.oCodeGenerator.nOptimizationLevel + nl
    }

    /*
    Function: resetSettings
    Description: إعادة تعيين الإعدادات
    */
    func resetSettings {
        see "هل أنت متأكد من إعادة تعيين جميع الإعدادات؟ (نعم/لا): "
        give cConfirm

        if lower(cConfirm) = "نعم" or lower(cConfirm) = "yes" {
            self.aUserPreferences = []
            self.loadDefaultPreferences()

            # إعادة تعيين إعدادات المولدات
            self.oTextGenerator.setCreativityLevel(0.7)
            self.oTextGenerator.setCoherenceLevel(0.8)
            self.oCodeGenerator.setComplexityLevel(0.6)
            self.oCodeGenerator.setOptimizationLevel(0.8)

            see "✅ تم إعادة تعيين جميع الإعدادات إلى القيم الافتراضية." + nl
        else
            see "تم إلغاء العملية." + nl
        }
    }

    /*
    Function: displayFullConversationHistory
    Description: عرض تاريخ المحادثة الكامل
    */
    func displayFullConversationHistory {
        see nl + "📜 تاريخ المحادثة الكامل:" + nl
        see copy("-", 30) + nl

        for i = 1 to len(self.aConversationHistory) {
            oMessage = self.aConversationHistory[i]
            cSenderIcon = "👤"
            if oMessage["sender"] = "system" {
                cSenderIcon = "🤖"
            }

            see cSenderIcon + " [" + oMessage["timestamp"] + "] " +
                oMessage["message"] + nl
            see copy("-", 30) + nl
        }
    }

    /*
    Function: saveSession
    Description: حفظ الجلسة
    */
    func saveSession {
        # حفظ تاريخ المحادثة والإعدادات
        # (تنفيذ مبسط - يمكن تطويره لحفظ في ملف)
        see "💾 تم حفظ الجلسة تلقائياً." + nl
    }

    /*
    Function: getSystemStatus
    Description: الحصول على حالة النظام
    */
    func getSystemStatus {
        oStatus = [
            "active" = self.bIsActive,
            "mode" = self.cCurrentMode,
            "symbols_count" = len(self.oMorgenSpace.aSymbols),
            "knowledge_count" = len(self.oKnowledgeStorage.aKnowledgeIndex),
            "conversation_length" = len(self.aConversationHistory),
            "current_epoch" = self.oMorgenSpace.nEpoch
        ]

        return oStatus
    }
}

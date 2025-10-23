# ==============================================================================
# Advanced Morgen Text Generator
# مولد النصوص المرجاني المتقدم
# ==============================================================================

load "stdlibcore.ring"
load "symbol.ring"
load "advanced_knowledge_storage.ring"
load "linguistic_engine_optimized.ring"

# ==============================================================================
# Class: AdvancedTextGenerator
# مولد النصوص المرجاني المتقدم
# ==============================================================================
class AdvancedTextGenerator {
    ### --- Public Attributes & Methods ---
    oMorgenSpace            # المرجع للفضاء المرجاني
    oKnowledgeStorage       # نظام التخزين المتقدم
    oLinguisticEngine       # المحرك اللغوي
    aTextTemplates          # قوالب النصوص
    aGenerationRules        # قواعد التوليد
    nCreativityLevel        # مستوى الإبداع (0.0 - 1.0)
    nCoherenceLevel         # مستوى التماسك (0.0 - 1.0)
    cLanguage               # اللغة المستهدفة
    
    /*
    Function: init
    Description: تهيئة مولد النصوص المرجاني المتقدم
    Inputs:
        oSpace_ : (object) المرجع للفضاء المرجاني
        oStorage_ : (object) نظام التخزين المتقدم
        cLanguage_ : (string) اللغة المستهدفة
    */
    func init oSpace_, oStorage_, cLanguage_ {
        self.oMorgenSpace = oSpace_
        self.oKnowledgeStorage = oStorage_
        self.oLinguisticEngine = new LinguisticEngine(oSpace_)
        self.cLanguage = cLanguage_
        self.nCreativityLevel = 0.7
        self.nCoherenceLevel = 0.8
        self.aTextTemplates = []
        self.aGenerationRules = []
        
        # تحميل القوالب والقواعد الافتراضية
        self.loadDefaultTemplates()
        self.loadGenerationRules()
        
        see "✍️ تم تهيئة مولد النصوص المرجاني المتقدم" + nl
        see "   اللغة: " + self.cLanguage + nl
        see "   مستوى الإبداع: " + self.nCreativityLevel + nl
        see "   مستوى التماسك: " + self.nCoherenceLevel + nl + nl
    }
    
    /*
    Function: generateText
    Description: توليد نص باستخدام الطريقة المرجانية المتقدمة
    Inputs:
        cPrompt : (string) النص المحفز
        nLength : (number) الطول المطلوب (بالكلمات)
        cStyle : (string) نمط النص
    */
    func generateText cPrompt, nLength, cStyle {
        see "🎨 بدء توليد النص المرجاني..." + nl
        see "   المحفز: " + cPrompt + nl
        see "   الطول المطلوب: " + nLength + " كلمة" + nl
        see "   النمط: " + cStyle + nl + nl
        
        # المرحلة 1: تحليل المحفز وإنشاء رموز البذور
        aSeedSymbols = self.analyzeSeedPrompt(cPrompt)
        
        # المرحلة 2: تشغيل دورة الأحلام المرجانية للتوليد
        aGeneratedSymbols = self.runGenerativeDreamCycle(aSeedSymbols, nLength)
        
        # المرحلة 3: تحويل الرموز إلى نص متماسك
        cGeneratedText = self.symbolsToCoherentText(aGeneratedSymbols, cStyle)
        
        # المرحلة 4: تحسين النص وتنقيحه
        cFinalText = self.refineGeneratedText(cGeneratedText, cStyle)
        
        see "✅ تم توليد النص بنجاح!" + nl
        see "   عدد الكلمات: " + len(split(cFinalText, " ")) + nl + nl
        
        return cFinalText
    }
    
    /*
    Function: analyzeSeedPrompt
    Description: تحليل النص المحفز وإنشاء رموز البذور
    */
    func analyzeSeedPrompt cPrompt {
        see "🌱 تحليل النص المحفز وإنشاء رموز البذور..." + nl
        
        aSeedSymbols = []
        aWords = split(cPrompt, " ")
        
        for cWord in aWords {
            # إنشاء رمز بذرة لكل كلمة
            oSeedSymbol = self.createSeedSymbol(cWord)
            
            # البحث عن رموز مشابهة في المعرفة المخزنة
            aRelatedSymbols = self.oKnowledgeStorage.retrieveKnowledge(cWord, 3)
            
            # دمج المعرفة المسترجعة مع رمز البذرة
            self.enrichSeedSymbol(oSeedSymbol, aRelatedSymbols)
            
            add(aSeedSymbols, oSeedSymbol)
            
            see "   🌱 رمز بذرة: " + cWord + " (طاقة: " + oSeedSymbol.nEnergyLevel + ")" + nl
        }
        
        see "   ✅ تم إنشاء " + len(aSeedSymbols) + " رمز بذرة" + nl + nl
        
        return aSeedSymbols
    }
    
    /*
    Function: runGenerativeDreamCycle
    Description: تشغيل دورة الأحلام المرجانية للتوليد
    */
    func runGenerativeDreamCycle aSeedSymbols, nTargetLength {
        see "💭 تشغيل دورة الأحلام المرجانية للتوليد..." + nl
        
        aGeneratedSymbols = aSeedSymbols  # البداية برموز البذور
        nCurrentLength = len(aSeedSymbols)
        nCycle = 0
        
        while nCurrentLength < nTargetLength and nCycle < 10 {
            nCycle++
            see "   🔄 دورة الأحلام #" + nCycle + nl
            
            # مرحلة الحل (Ḥall): تفكيك الرموز الموجودة
            aDecomposedSeeds = self.hallPhaseGenerative(aGeneratedSymbols)
            
            # مرحلة اللم (Lamm): إعادة تركيب وتوليد رموز جديدة
            aNewSymbols = self.lammPhaseGenerative(aDecomposedSeeds, nTargetLength - nCurrentLength)
            
            # مرحلة الحلم (Ḥulm): دمج الرموز الجديدة في السياق
            aIntegratedSymbols = self.hulmPhaseGenerative(aGeneratedSymbols, aNewSymbols)
            
            aGeneratedSymbols = aIntegratedSymbols
            nCurrentLength = len(aGeneratedSymbols)
            
            see "     📊 عدد الرموز الحالي: " + nCurrentLength + nl
        }
        
        see "   ✅ انتهت دورة الأحلام بـ " + len(aGeneratedSymbols) + " رمز" + nl + nl
        
        return aGeneratedSymbols
    }
    
    /*
    Function: createSeedSymbol
    Description: إنشاء رمز بذرة من كلمة
    */
    func createSeedSymbol cWord {
        # توليد الجينوم من الكلمة
        aGenome = self.oKnowledgeStorage.generateKnowledgeGenome(cWord)
        
        # حساب الموقع القطبي الأولي
        nRadius = 0.3 + (len(cWord) * 0.1)  # كلمات أطول = أعمق
        nAngle = (ascii(substr(cWord, 1, 1)) * 5) % 360  # زاوية من الحرف الأول
        
        # إنشاء الرمز
        oSymbol = new MorgenSymbol("seed_" + cWord, "seed", aGenome, nRadius, nAngle, cWord)
        oSymbol.nEnergyLevel = 0.8
        oSymbol.nResonance = 0.7
        oSymbol.bIsSeed = true
        
        return oSymbol
    }
    
    /*
    Function: enrichSeedSymbol
    Description: إثراء رمز البذرة بالمعرفة المسترجعة
    */
    func enrichSeedSymbol oSeedSymbol, aRelatedSymbols {
        if len(aRelatedSymbols) = 0 {
            return
        }
        
        # حساب متوسط الطاقة والرنين من الرموز المشابهة
        nTotalEnergy = oSeedSymbol.nEnergyLevel
        nTotalResonance = oSeedSymbol.nResonance
        
        for oResult in aRelatedSymbols {
            if isObject(oResult) and isObject(oResult["symbol"]) {
                oRelatedSymbol = oResult["symbol"]
                nTotalEnergy += oRelatedSymbol.nEnergyLevel * oResult["score"]
                nTotalResonance += oRelatedSymbol.nResonance * oResult["score"]
            }
        }
        
        # تحديث خصائص رمز البذرة
        oSeedSymbol.nEnergyLevel = nTotalEnergy / (len(aRelatedSymbols) + 1)
        oSeedSymbol.nResonance = nTotalResonance / (len(aRelatedSymbols) + 1)
        
        # إضافة معلومات السياق
        oSeedSymbol.aSubSymbols = aRelatedSymbols
    }
    
    /*
    Function: hallPhaseGenerative
    Description: مرحلة الحل التوليدية - تفكيك الرموز لاستخراج البذور
    */
    func hallPhaseGenerative aSymbols {
        see "     🔍 مرحلة الحل (Ḥall): تفكيك الرموز..." + nl
        
        aDecomposedSeeds = []
        
        for oSymbol in aSymbols {
            if isObject(oSymbol) {
                # تفكيك الجينوم إلى بذور أصغر
                for i = 1 to len(oSymbol.aGenome) step 2 {
                    if i + 1 <= len(oSymbol.aGenome) {
                        aSeedGenome = [oSymbol.aGenome[i], oSymbol.aGenome[i + 1]]
                        
                        oSeed = new MorgenSymbol(
                            "decomposed_" + i,
                            "decomposed_seed",
                            aSeedGenome,
                            oSymbol.nRadius * 0.8,
                            oSymbol.nAngle + (i * 10),
                            null
                        )
                        oSeed.nEnergyLevel = oSymbol.nEnergyLevel * 0.6
                        oSeed.bIsSeed = true
                        
                        add(aDecomposedSeeds, oSeed)
                    }
                }
            }
        }
        
        see "       📊 تم تفكيك " + len(aSymbols) + " رمز إلى " + len(aDecomposedSeeds) + " بذرة" + nl
        
        return aDecomposedSeeds
    }
    
    /*
    Function: lammPhaseGenerative
    Description: مرحلة اللم التوليدية - إعادة تركيب وتوليد رموز جديدة
    */
    func lammPhaseGenerative aSeeds, nTargetCount {
        see "     🔄 مرحلة اللم (Lamm): إعادة التركيب والتوليد..." + nl
        
        aNewSymbols = []
        nGenerated = 0
        
        while nGenerated < nTargetCount and len(aSeeds) >= 2 {
            # اختيار بذرتين عشوائيتين للتزاوج
            nIdx1 = random(len(aSeeds) - 1) + 1
            nIdx2 = random(len(aSeeds) - 1) + 1
            while nIdx2 = nIdx1 and len(aSeeds) > 1 {
                nIdx2 = random(len(aSeeds) - 1) + 1
            }
            
            oSeed1 = aSeeds[nIdx1]
            oSeed2 = aSeeds[nIdx2]
            
            # توليد رمز جديد من التزاوج
            oNewSymbol = self.mateSeeds(oSeed1, oSeed2)
            
            if isObject(oNewSymbol) {
                add(aNewSymbols, oNewSymbol)
                nGenerated++
            }
        }
        
        see "       📊 تم توليد " + len(aNewSymbols) + " رمز جديد" + nl
        
        return aNewSymbols
    }
    
    /*
    Function: mateSeeds
    Description: تزاوج بذرتين لإنتاج رمز جديد
    */
    func mateSeeds oSeed1, oSeed2 {
        # دمج الجينومات
        aCombinedGenome = []
        nMinLength = min(len(oSeed1.aGenome), len(oSeed2.aGenome))
        
        for i = 1 to nMinLength {
            if random(2) = 1 {
                add(aCombinedGenome, oSeed1.aGenome[i])
            else
                add(aCombinedGenome, oSeed2.aGenome[i])
            }
        }
        
        # حساب الموقع الجديد
        nNewRadius = (oSeed1.nRadius + oSeed2.nRadius) / 2
        nNewAngle = (oSeed1.nAngle + oSeed2.nAngle) / 2
        
        # حساب الطاقة الجديدة
        nNewEnergy = (oSeed1.nEnergyLevel + oSeed2.nEnergyLevel) / 2 * self.nCreativityLevel
        
        # إنشاء الرمز الجديد
        oNewSymbol = new MorgenSymbol(
            "generated_" + len(aCombinedGenome),
            "generated",
            aCombinedGenome,
            nNewRadius,
            nNewAngle,
            null
        )
        oNewSymbol.nEnergyLevel = nNewEnergy
        oNewSymbol.nResonance = (oSeed1.nResonance + oSeed2.nResonance) / 2
        
        return oNewSymbol
    }
    
    /*
    Function: hulmPhaseGenerative
    Description: مرحلة الحلم التوليدية - دمج الرموز الجديدة في السياق
    */
    func hulmPhaseGenerative aExistingSymbols, aNewSymbols {
        see "     🌙 مرحلة الحلم (Ḥulm): دمج الرموز في السياق..." + nl
        
        aIntegratedSymbols = aExistingSymbols
        
        for oNewSymbol in aNewSymbols {
            if isObject(oNewSymbol) {
                # البحث عن أفضل موقع للإدراج
                nBestPosition = self.findBestInsertionPosition(aIntegratedSymbols, oNewSymbol)
                
                # إدراج الرمز في الموقع الأمثل
                if nBestPosition <= len(aIntegratedSymbols) {
                    aTemp = []
                    for i = 1 to nBestPosition - 1 {
                        add(aTemp, aIntegratedSymbols[i])
                    }
                    add(aTemp, oNewSymbol)
                    for i = nBestPosition to len(aIntegratedSymbols) {
                        add(aTemp, aIntegratedSymbols[i])
                    }
                    aIntegratedSymbols = aTemp
                else
                    add(aIntegratedSymbols, oNewSymbol)
                }
            }
        }
        
        see "       📊 تم دمج " + len(aNewSymbols) + " رمز جديد في السياق" + nl
        
        return aIntegratedSymbols
    }
    
    /*
    Function: findBestInsertionPosition
    Description: العثور على أفضل موقع لإدراج رمز جديد
    */
    func findBestInsertionPosition aSymbols, oNewSymbol {
        if len(aSymbols) = 0 {
            return 1
        }
        
        nBestPosition = len(aSymbols) + 1
        nBestScore = 0.0
        
        for i = 1 to len(aSymbols) + 1 {
            nScore = 0.0
            
            # حساب التوافق مع الرمز السابق
            if i > 1 {
                nScore += self.oKnowledgeStorage.calculateResonance(aSymbols[i - 1], oNewSymbol)
            }
            
            # حساب التوافق مع الرمز التالي
            if i <= len(aSymbols) {
                nScore += self.oKnowledgeStorage.calculateResonance(oNewSymbol, aSymbols[i])
            }
            
            if nScore > nBestScore {
                nBestScore = nScore
                nBestPosition = i
            }
        }
        
        return nBestPosition
    }
    
    /*
    Function: loadDefaultTemplates
    Description: تحميل القوالب الافتراضية
    */
    func loadDefaultTemplates {
        # قوالب النصوص العربية
        add(self.aTextTemplates, [
            "name" = "narrative",
            "pattern" = "مقدمة + تطوير + خاتمة",
            "connectors" = ["ثم", "بعد ذلك", "وأخيراً", "في النهاية"]
        ])
        
        add(self.aTextTemplates, [
            "name" = "descriptive", 
            "pattern" = "وصف عام + تفاصيل + انطباع",
            "connectors" = ["كما أن", "بالإضافة إلى", "علاوة على ذلك"]
        ])
        
        add(self.aTextTemplates, [
            "name" = "argumentative",
            "pattern" = "طرح + أدلة + استنتاج",
            "connectors" = ["لأن", "نظراً لـ", "وبالتالي", "لذلك"]
        ])
    }
    
    /*
    Function: loadGenerationRules
    Description: تحميل قواعد التوليد
    */
    func loadGenerationRules {
        # قواعد التوليد العربية
        add(self.aGenerationRules, [
            "type" = "grammar",
            "rule" = "الفعل + الفاعل + المفعول",
            "weight" = 0.8
        ])
        
        add(self.aGenerationRules, [
            "type" = "semantic",
            "rule" = "الكلمات المترابطة دلالياً تأتي متقاربة",
            "weight" = 0.9
        ])
        
        add(self.aGenerationRules, [
            "type" = "style",
            "rule" = "التنويع في طول الجمل",
            "weight" = 0.6
        ])
    }

    /*
    Function: symbolsToCoherentText
    Description: تحويل الرموز إلى نص متماسك
    */
    func symbolsToCoherentText aSymbols, cStyle {
        see "📝 تحويل الرموز إلى نص متماسك..." + nl

        cText = ""
        aWords = []

        # تحويل كل رمز إلى كلمة أو عبارة
        for oSymbol in aSymbols {
            if isObject(oSymbol) {
                cWord = self.symbolToWord(oSymbol)
                if cWord != "" {
                    add(aWords, cWord)
                }
            }
        }

        # تطبيق قالب النص حسب النمط
        cText = self.applyTextTemplate(aWords, cStyle)

        see "   📊 تم تحويل " + len(aSymbols) + " رمز إلى " + len(aWords) + " كلمة" + nl

        return cText
    }

    /*
    Function: symbolToWord
    Description: تحويل رمز مرجاني إلى كلمة
    */
    func symbolToWord oSymbol {
        # إذا كان الرمز يحتوي على بيانات نصية مباشرة
        if isString(oSymbol.oData) and oSymbol.oData != "" {
            return oSymbol.oData
        }

        # توليد كلمة من الجينوم المرجاني
        cWord = self.genomeToArabicWord(oSymbol.aGenome)

        # تحسين الكلمة حسب نوع الرمز
        if oSymbol.cType = "seed" {
            # رموز البذور تحتفظ بشكلها الأصلي
            return cWord
        elseif oSymbol.cType = "generated"
            # الرموز المولدة تحتاج تحسين
            return self.improveGeneratedWord(cWord, oSymbol)
        else
            return cWord
        }
    }

    /*
    Function: genomeToArabicWord
    Description: تحويل الجينوم إلى كلمة عربية
    */
    func genomeToArabicWord aGenome {
        # الحروف العربية الأساسية
        aArabicLetters = ["ا", "ب", "ت", "ث", "ج", "ح", "خ", "د", "ذ", "ر",
                         "ز", "س", "ش", "ص", "ض", "ط", "ظ", "ع", "غ", "ف",
                         "ق", "ك", "ل", "م", "ن", "ه", "و", "ي"]

        cWord = ""

        for nGene in aGenome {
            nIndex = (nGene % len(aArabicLetters)) + 1
            if nIndex <= len(aArabicLetters) {
                cWord += aArabicLetters[nIndex]
            }
        }

        # إضافة حركات بسيطة لتحسين النطق
        if len(cWord) >= 3 {
            # تطبيق نمط الجذر الثلاثي
            cWord = self.applyTriconsonantalPattern(cWord)
        }

        return cWord
    }

    /*
    Function: applyTriconsonantalPattern
    Description: تطبيق نمط الجذر الثلاثي العربي
    */
    func applyTriconsonantalPattern cWord {
        if len(cWord) < 3 {
            return cWord
        }

        # استخراج أول ثلاثة حروف كجذر
        cRoot = substr(cWord, 1, 3)

        # تطبيق أوزان عربية شائعة
        aPatterns = ["فَعَلَ", "فَاعِل", "مَفْعُول", "فَعِيل", "فُعْلَة"]
        nPatternIndex = (len(cWord) % len(aPatterns)) + 1

        # تطبيق النمط المختار (مبسط)
        if nPatternIndex = 1 {
            return cRoot  # فَعَلَ
        elseif nPatternIndex = 2
            return cRoot + "ة"  # فَاعِلة
        elseif nPatternIndex = 3
            return "م" + cRoot  # مَفْعُول
        elseif nPatternIndex = 4
            return cRoot + "ي"  # فَعِيل
        else
            return cRoot + "ة"  # فُعْلَة
        }
    }

    /*
    Function: improveGeneratedWord
    Description: تحسين الكلمة المولدة
    */
    func improveGeneratedWord cWord, oSymbol {
        # تحسين بناءً على الطاقة والرنين
        if oSymbol.nEnergyLevel > 0.8 {
            # كلمات عالية الطاقة تحصل على تشكيل
            cWord = self.addDiacritics(cWord)
        }

        if oSymbol.nResonance > 0.7 {
            # كلمات عالية الرنين تحصل على لواحق
            cWord = self.addSuffixes(cWord)
        }

        return cWord
    }

    /*
    Function: addDiacritics
    Description: إضافة التشكيل للكلمة
    */
    func addDiacritics cWord {
        # إضافة تشكيل بسيط (مبسط جداً)
        if len(cWord) >= 2 {
            # إضافة فتحة على الحرف الأول
            cWord = substr(cWord, 1, 1) + "َ" + substr(cWord, 2, len(cWord) - 1)
        }
        return cWord
    }

    /*
    Function: addSuffixes
    Description: إضافة اللواحق للكلمة
    */
    func addSuffixes cWord {
        aSuffixes = ["ة", "ان", "ين", "ون", "ها", "هم", "كم"]
        nSuffixIndex = (len(cWord) % len(aSuffixes)) + 1

        if nSuffixIndex <= len(aSuffixes) {
            cWord += aSuffixes[nSuffixIndex]
        }

        return cWord
    }

    /*
    Function: applyTextTemplate
    Description: تطبيق قالب النص
    */
    func applyTextTemplate aWords, cStyle {
        if len(aWords) = 0 {
            return ""
        }

        # البحث عن القالب المناسب
        oTemplate = null
        for oTemp in self.aTextTemplates {
            if oTemp["name"] = cStyle {
                oTemplate = oTemp
                exit
            }
        }

        if oTemplate = null {
            # قالب افتراضي
            return self.joinWordsSimple(aWords)
        }

        # تطبيق القالب
        return self.applyTemplateStructure(aWords, oTemplate)
    }

    /*
    Function: joinWordsSimple
    Description: ربط الكلمات بطريقة بسيطة
    */
    func joinWordsSimple aWords {
        cText = ""

        for i = 1 to len(aWords) {
            cText += aWords[i]
            if i < len(aWords) {
                cText += " "
            }
        }

        return cText
    }

    /*
    Function: applyTemplateStructure
    Description: تطبيق بنية القالب
    */
    func applyTemplateStructure aWords, oTemplate {
        cText = ""
        aConnectors = oTemplate["connectors"]
        nConnectorIndex = 1

        # تقسيم الكلمات إلى مجموعات
        nWordsPerGroup = max(1, floor(len(aWords) / 3))

        for i = 1 to len(aWords) {
            cText += aWords[i]

            # إضافة رابط كل مجموعة كلمات
            if i % nWordsPerGroup = 0 and i < len(aWords) {
                if nConnectorIndex <= len(aConnectors) {
                    cText += " " + aConnectors[nConnectorIndex] + " "
                    nConnectorIndex++
                else
                    cText += " "
                }
            elseif i < len(aWords)
                cText += " "
            }
        }

        return cText
    }

    /*
    Function: refineGeneratedText
    Description: تحسين النص المولد وتنقيحه
    */
    func refineGeneratedText cText, cStyle {
        see "✨ تحسين وتنقيح النص المولد..." + nl

        # إزالة المسافات الزائدة
        cText = self.cleanExtraSpaces(cText)

        # تحسين علامات الترقيم
        cText = self.improvePunctuation(cText)

        # تحسين التدفق والتماسك
        cText = self.improveCoherence(cText)

        # تطبيق التحسينات الخاصة بالنمط
        cText = self.applyStyleRefinements(cText, cStyle)

        see "   ✅ تم تحسين النص بنجاح" + nl

        return cText
    }

    /*
    Function: cleanExtraSpaces
    Description: إزالة المسافات الزائدة
    */
    func cleanExtraSpaces cText {
        # إزالة المسافات المتعددة
        while substr(cText, "  ") > 0 {
            cText = substr(cText, "  ", " ")
        }

        # إزالة المسافات في البداية والنهاية
        cText = trim(cText)

        return cText
    }

    /*
    Function: improvePunctuation
    Description: تحسين علامات الترقيم
    */
    func improvePunctuation cText {
        # إضافة نقطة في النهاية إذا لم تكن موجودة
        if len(cText) > 0 and not find([".", "!", "?"], right(cText, 1)) {
            cText += "."
        }

        return cText
    }

    /*
    Function: improveCoherence
    Description: تحسين التدفق والتماسك
    */
    func improveCoherence cText {
        # تطبيق قواعد التماسك حسب مستوى التماسك المحدد
        if self.nCoherenceLevel > 0.7 {
            # تحسين عالي: إضافة روابط منطقية
            cText = self.addLogicalConnectors(cText)
        }

        return cText
    }

    /*
    Function: addLogicalConnectors
    Description: إضافة روابط منطقية
    */
    func addLogicalConnectors cText {
        aConnectors = ["وبالتالي", "لذلك", "كما أن", "بالإضافة إلى ذلك"]

        # إضافة رابط في منتصف النص تقريباً
        aWords = split(cText, " ")
        if len(aWords) > 6 {
            nMiddle = floor(len(aWords) / 2)
            nConnectorIndex = random(len(aConnectors) - 1) + 1

            aWords[nMiddle] = aConnectors[nConnectorIndex] + " " + aWords[nMiddle]

            cText = ""
            for i = 1 to len(aWords) {
                cText += aWords[i]
                if i < len(aWords) {
                    cText += " "
                }
            }
        }

        return cText
    }

    /*
    Function: applyStyleRefinements
    Description: تطبيق التحسينات الخاصة بالنمط
    */
    func applyStyleRefinements cText, cStyle {
        if cStyle = "narrative" {
            # نمط السرد: إضافة كلمات زمنية
            cText = "في البداية " + cText
        elseif cStyle = "descriptive"
            # نمط الوصف: إضافة صفات
            cText = self.addDescriptiveWords(cText)
        elseif cStyle = "argumentative"
            # نمط الحجاج: إضافة كلمات استدلالية
            cText = "من الواضح أن " + cText
        }

        return cText
    }

    /*
    Function: addDescriptiveWords
    Description: إضافة كلمات وصفية
    */
    func addDescriptiveWords cText {
        aDescriptive = ["الجميل", "الرائع", "المذهل", "الفريد", "المتميز"]
        nIndex = random(len(aDescriptive) - 1) + 1

        return cText + " " + aDescriptive[nIndex]
    }

    /*
    Function: setCreativityLevel
    Description: تحديد مستوى الإبداع
    */
    func setCreativityLevel nLevel {
        self.nCreativityLevel = max(0.0, min(1.0, nLevel))
        see "🎨 تم تحديد مستوى الإبداع إلى: " + self.nCreativityLevel + nl
    }

    /*
    Function: setCoherenceLevel
    Description: تحديد مستوى التماسك
    */
    func setCoherenceLevel nLevel {
        self.nCoherenceLevel = max(0.0, min(1.0, nLevel))
        see "🔗 تم تحديد مستوى التماسك إلى: " + self.nCoherenceLevel + nl
    }

    /*
    Function: displayGeneratorStatistics
    Description: عرض إحصائيات المولد
    */
    func displayGeneratorStatistics {
        see nl + "📊 إحصائيات مولد النصوص المرجاني" + nl
        see "=" * 40 + nl
        see "اللغة المستهدفة: " + self.cLanguage + nl
        see "مستوى الإبداع: " + self.nCreativityLevel + nl
        see "مستوى التماسك: " + self.nCoherenceLevel + nl
        see "عدد القوالب المتاحة: " + len(self.aTextTemplates) + nl
        see "عدد قواعد التوليد: " + len(self.aGenerationRules) + nl
        see "=" * 40 + nl + nl
    }
}

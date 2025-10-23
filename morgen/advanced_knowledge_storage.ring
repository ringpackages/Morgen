# ==============================================================================
# Advanced Morgen Knowledge Storage System
# نظام التخزين المرجاني المتقدم للمعرفة
# ==============================================================================


load "memory_system.ring"

# ==============================================================================
# Class: AdvancedKnowledgeStorage
# نظام التخزين المتقدم للمعرفة المرجانية
# ==============================================================================
class AdvancedKnowledgeStorage {
    ### --- Public Attributes & Methods ---
    oMorgenSpace            # المرجع للفضاء المرجاني
    aKnowledgeIndex         # فهرس المعرفة المرجانية
    aSemanticClusters       # العناقيد الدلالية
    aPolarCoordinateIndex   # فهرس الإحداثيات القطبية
    aResonanceNetwork       # شبكة الرنين المرجاني
    nStorageCapacity        # سعة التخزين
    nCompressionRatio       # نسبة الضغط المرجاني
    
    /*
    Function: init
    Description: تهيئة نظام التخزين المرجاني المتقدم
    Inputs:
        oSpace_ : (object) المرجع للفضاء المرجاني
        nCapacity_ : (number) السعة القصوى للتخزين
    */
    func init oSpace_, nCapacity_ {
        self.oMorgenSpace = oSpace_
        self.nStorageCapacity = nCapacity_
        self.aKnowledgeIndex = []
        self.aSemanticClusters = []
        self.aPolarCoordinateIndex = []
        self.aResonanceNetwork = []
        self.nCompressionRatio = 0.7
        
        see "🧠 تم تهيئة نظام التخزين المرجاني المتقدم" + nl
        see "   السعة: " + self.nStorageCapacity + " رمز" + nl
        see "   نسبة الضغط: " + self.nCompressionRatio + nl + nl
    }
    
    /*
    Function: storeKnowledge
    Description: تخزين المعرفة في الفضاء المرجاني
    Inputs:
        cKnowledgeType : (string) نوع المعرفة
        oData : (object) البيانات المراد تخزينها
        nImportance : (number) درجة الأهمية
    */
    func storeKnowledge cKnowledgeType, oData, nImportance {
        see "📚 تخزين معرفة من نوع: " + cKnowledgeType + nl
        
        # إنشاء رمز مرجاني للمعرفة
        oKnowledgeSymbol = self.createKnowledgeSymbol(cKnowledgeType, oData, nImportance)
        
        # حساب الموقع الأمثل في الفضاء القطبي
        aPolarPosition = self.calculateOptimalPosition(oKnowledgeSymbol)
        oKnowledgeSymbol.nRadius = aPolarPosition[1]
        oKnowledgeSymbol.nAngle = aPolarPosition[2]
        
        # إضافة الرمز للفضاء المرجاني
        self.oMorgenSpace.addSymbol(oKnowledgeSymbol)
        
        # تحديث الفهارس
        self.updateKnowledgeIndex(oKnowledgeSymbol)
        self.updateSemanticClusters(oKnowledgeSymbol)
        self.updatePolarIndex(oKnowledgeSymbol)
        self.updateResonanceNetwork(oKnowledgeSymbol)
        
        see "   ✅ تم تخزين المعرفة بنجاح في الموقع القطبي: (" + 
            oKnowledgeSymbol.nRadius + ", " + oKnowledgeSymbol.nAngle + ")" + nl
        
        return oKnowledgeSymbol
    }
    
    /*
    Function: retrieveKnowledge
    Description: استرجاع المعرفة باستخدام البحث المرجاني المتقدم
    Inputs:
        cQuery : (string) استعلام البحث
        nMaxResults : (number) العدد الأقصى للنتائج
    */
    func retrieveKnowledge cQuery, nMaxResults {
        see "🔍 البحث عن المعرفة: " + cQuery + nl
        
        # إنشاء رمز استعلام مؤقت
        oQuerySymbol = self.createQuerySymbol(cQuery)
        
        # البحث باستخدام الرنين المرجاني
        aResonanceResults = self.searchByResonance(oQuerySymbol, nMaxResults)
        
        # البحث باستخدام القرب القطبي
        aPolarResults = self.searchByPolarProximity(oQuerySymbol, nMaxResults)
        
        # البحث باستخدام العناقيد الدلالية
        aSemanticResults = self.searchBySemanticClusters(oQuerySymbol, nMaxResults)
        
        # دمج النتائج وترتيبها
        aFinalResults = self.mergeAndRankResults(aResonanceResults, aPolarResults, aSemanticResults)
        
        see "   📊 تم العثور على " + len(aFinalResults) + " نتيجة" + nl
        
        return aFinalResults
    }
    
    /*
    Function: createKnowledgeSymbol
    Description: إنشاء رمز مرجاني للمعرفة
    */
    func createKnowledgeSymbol cType, oData, nImportance {
        # توليد معرف فريد
        cId = "knowledge_" + len(self.aKnowledgeIndex) + 1
        
        # توليد الجينوم المرجاني من البيانات
        aGenome = self.generateKnowledgeGenome(oData)
        
        # حساب الطاقة الأولية
        nInitialEnergy = nImportance * 0.8
        
        # إنشاء الرمز
        oSymbol = new MorgenSymbol(cId, cType, aGenome, 0.5, 0.0, oData)
        oSymbol.nEnergyLevel = nInitialEnergy
        oSymbol.nResonance = nImportance
        
        return oSymbol
    }
    
    /*
    Function: generateKnowledgeGenome
    Description: توليد الجينوم المرجاني من البيانات
    */
    func generateKnowledgeGenome oData {
        aGenome = []
        
        if isString(oData) {
            # للنصوص: تحويل كل حرف إلى قيمة جينية
            for i = 1 to len(oData) {
                nChar = ascii(substr(oData, i, 1))
                nGene = (nChar % 4) + 1  # قيم من 1 إلى 4
                add(aGenome, nGene)
            }
        elseif isList(oData)
            # للقوائم: استخدام طول وقيم العناصر
            for item in oData {
                if isString(item) {
                    nGene = (len(item) % 4) + 1
                elseif isNumber(item)
                    nGene = (item % 4) + 1
                else
                    nGene = 2  # قيمة افتراضية
                }
                add(aGenome, nGene)
            }
        else
            # للأنواع الأخرى: جينوم افتراضي
            aGenome = [1, 2, 1, 2]
        }
        
        # ضمان الحد الأدنى لطول الجينوم
        while len(aGenome) < 4 {
            add(aGenome, 1)
        }
        
        return aGenome
    }
    
    /*
    Function: calculateOptimalPosition
    Description: حساب الموقع الأمثل في الفضاء القطبي
    */
    func calculateOptimalPosition oSymbol {
        # حساب نصف القطر بناءً على الأهمية والطاقة
        nRadius = (1.0 - oSymbol.nResonance) * 0.8 + 0.1
        
        # حساب الزاوية بناءً على الجينوم
        nAngle = 0.0
        for i = 1 to len(oSymbol.aGenome) {
            nAngle += oSymbol.aGenome[i] * (360.0 / len(oSymbol.aGenome))
        }
        nAngle = nAngle % 360.0
        
        return [nRadius, nAngle]
    }
    
    /*
    Function: updateKnowledgeIndex
    Description: تحديث فهرس المعرفة
    */
    func updateKnowledgeIndex oSymbol {
        oIndexEntry = [
            "symbol_id" = oSymbol.cId,
            "type" = oSymbol.cType,
            "radius" = oSymbol.nRadius,
            "angle" = oSymbol.nAngle,
            "energy" = oSymbol.nEnergyLevel,
            "resonance" = oSymbol.nResonance,
            "genome_hash" = self.calculateGenomeHash(oSymbol.aGenome),
            "timestamp" = self.oMorgenSpace.nEpoch
        ]
        
        add(self.aKnowledgeIndex, oIndexEntry)
    }
    
    /*
    Function: updateSemanticClusters
    Description: تحديث العناقيد الدلالية
    */
    func updateSemanticClusters oSymbol {
        # البحث عن عنقود مناسب
        oTargetCluster = null
        nBestSimilarity = 0.0
        
        for oCluster in self.aSemanticClusters {
            nSimilarity = self.calculateSemanticSimilarity(oSymbol, oCluster)
            if nSimilarity > nBestSimilarity and nSimilarity > 0.6 {
                nBestSimilarity = nSimilarity
                oTargetCluster = oCluster
            }
        }
        
        if oTargetCluster != null {
            # إضافة للعنقود الموجود
            add(oTargetCluster["symbols"], oSymbol)
            oTargetCluster["centroid"] = self.updateClusterCentroid(oTargetCluster)
        else
            # إنشاء عنقود جديد
            oNewCluster = [
                "id" = "cluster_" + len(self.aSemanticClusters) + 1,
                "type" = oSymbol.cType,
                "symbols" = [oSymbol],
                "centroid" = [oSymbol.nRadius, oSymbol.nAngle],
                "creation_epoch" = self.oMorgenSpace.nEpoch
            ]
            add(self.aSemanticClusters, oNewCluster)
        }
    }
    
    /*
    Function: searchByResonance
    Description: البحث باستخدام الرنين المرجاني
    */
    func searchByResonance oQuerySymbol, nMaxResults {
        aResults = []
        
        for oSymbol in self.oMorgenSpace.aSymbols {
            if isObject(oSymbol) {
                nResonance = self.calculateResonance(oQuerySymbol, oSymbol)
                if nResonance > 0.3 {
                    oResult = [
                        "symbol" = oSymbol,
                        "score" = nResonance,
                        "method" = "resonance"
                    ]
                    add(aResults, oResult)
                }
            }
        }
        
        # ترتيب النتائج حسب النقاط
        aResults = self.sortResultsByScore(aResults)
        
        # إرجاع العدد المطلوب فقط
        if len(aResults) > nMaxResults {
            aLimitedResults = []
            for i = 1 to nMaxResults {
                add(aLimitedResults, aResults[i])
            }
            return aLimitedResults
        }
        
        return aResults
    }
    
    /*
    Function: calculateResonance
    Description: حساب الرنين بين رمزين
    */
    func calculateResonance oSymbol1, oSymbol2 {
        # حساب التشابه في الجينوم
        nGenomeSimilarity = self.calculateGenomeSimilarity(oSymbol1.aGenome, oSymbol2.aGenome)
        
        # حساب القرب المكاني
        nSpatialProximity = self.calculateSpatialProximity(oSymbol1, oSymbol2)
        
        # حساب التشابه في النوع
        nTypeSimilarity = 0.0
        if oSymbol1.cType = oSymbol2.cType {
            nTypeSimilarity = 1.0
        }
        
        # الرنين الإجمالي
        nResonance = (nGenomeSimilarity * 0.4) + (nSpatialProximity * 0.4) + (nTypeSimilarity * 0.2)
        
        return nResonance
    }
    
    /*
    Function: calculateGenomeSimilarity
    Description: حساب التشابه في الجينوم
    */
    func calculateGenomeSimilarity aGenome1, aGenome2 {
        if len(aGenome1) = 0 or len(aGenome2) = 0 {
            return 0.0
        }
        
        nMatches = 0
        nMinLength = min(len(aGenome1), len(aGenome2))
        
        for i = 1 to nMinLength {
            if aGenome1[i] = aGenome2[i] {
                nMatches++
            }
        }
        
        return nMatches / nMinLength
    }
    
    /*
    Function: calculateSpatialProximity
    Description: حساب القرب المكاني في الفضاء القطبي
    */
    func calculateSpatialProximity oSymbol1, oSymbol2 {
        # حساب المسافة الإقليدية في الإحداثيات القطبية
        nX1 = oSymbol1.nRadius * cos(oSymbol1.nAngle * 3.14159 / 180.0)
        nY1 = oSymbol1.nRadius * sin(oSymbol1.nAngle * 3.14159 / 180.0)
        nX2 = oSymbol2.nRadius * cos(oSymbol2.nAngle * 3.14159 / 180.0)
        nY2 = oSymbol2.nRadius * sin(oSymbol2.nAngle * 3.14159 / 180.0)
        
        nDistance = sqrt(pow(nX2 - nX1, 2) + pow(nY2 - nY1, 2))
        
        # تحويل المسافة إلى قرب (كلما قلت المسافة زاد القرب)
        nProximity = 1.0 / (1.0 + nDistance)
        
        return nProximity
    }
    
    # Helper functions
    func calculateGenomeHash aGenome {
        nHash = 0
        for nGene in aGenome {
            nHash += nGene * 31
        }
        return nHash % 10000
    }
    
    func calculateSemanticSimilarity oSymbol, oCluster {
        # حساب التشابه مع مركز العنقود
        nCentroidRadius = oCluster["centroid"][1]
        nCentroidAngle = oCluster["centroid"][2]
        
        # إنشاء رمز مؤقت لمركز العنقود
        oCentroidSymbol = new MorgenSymbol("temp", oSymbol.cType, [1,2,1,2], nCentroidRadius, nCentroidAngle, null)
        
        return self.calculateSpatialProximity(oSymbol, oCentroidSymbol)
    }
    
    func updateClusterCentroid oCluster {
        if len(oCluster["symbols"]) = 0 {
            return [0.5, 0.0]
        }
        
        nSumRadius = 0.0
        nSumAngle = 0.0
        
        for oSymbol in oCluster["symbols"] {
            nSumRadius += oSymbol.nRadius
            nSumAngle += oSymbol.nAngle
        }
        
        nAvgRadius = nSumRadius / len(oCluster["symbols"])
        nAvgAngle = nSumAngle / len(oCluster["symbols"])
        
        return [nAvgRadius, nAvgAngle]
    }
    
    func sortResultsByScore aResults {
        # ترتيب بسيط بالفقاعات
        for i = 1 to len(aResults) - 1 {
            for j = i + 1 to len(aResults) {
                if aResults[i]["score"] < aResults[j]["score"] {
                    temp = aResults[i]
                    aResults[i] = aResults[j]
                    aResults[j] = temp
                }
            }
        }
        return aResults
    }

    /*
    Function: createQuerySymbol
    Description: إنشاء رمز استعلام مؤقت
    */
    func createQuerySymbol cQuery {
        aGenome = self.generateKnowledgeGenome(cQuery)
        oQuerySymbol = new MorgenSymbol("query_temp", "query", aGenome, 0.5, 0.0, cQuery)
        oQuerySymbol.nEnergyLevel = 0.8
        oQuerySymbol.nResonance = 0.9
        return oQuerySymbol
    }

    /*
    Function: searchByPolarProximity
    Description: البحث باستخدام القرب القطبي
    */
    func searchByPolarProximity oQuerySymbol, nMaxResults {
        aResults = []

        for oSymbol in self.oMorgenSpace.aSymbols {
            if isObject(oSymbol) {
                nProximity = self.calculateSpatialProximity(oQuerySymbol, oSymbol)
                if nProximity > 0.4 {
                    oResult = [
                        "symbol" = oSymbol,
                        "score" = nProximity,
                        "method" = "polar_proximity"
                    ]
                    add(aResults, oResult)
                }
            }
        }

        aResults = self.sortResultsByScore(aResults)

        if len(aResults) > nMaxResults {
            aLimitedResults = []
            for i = 1 to nMaxResults {
                add(aLimitedResults, aResults[i])
            }
            return aLimitedResults
        }

        return aResults
    }

    /*
    Function: searchBySemanticClusters
    Description: البحث باستخدام العناقيد الدلالية
    */
    func searchBySemanticClusters oQuerySymbol, nMaxResults {
        aResults = []

        # البحث في العناقيد الدلالية
        for oCluster in self.aSemanticClusters {
            nClusterSimilarity = self.calculateSemanticSimilarity(oQuerySymbol, oCluster)

            if nClusterSimilarity > 0.5 {
                # إضافة رموز من هذا العنقود
                for oSymbol in oCluster["symbols"] {
                    oResult = [
                        "symbol" = oSymbol,
                        "score" = nClusterSimilarity,
                        "method" = "semantic_cluster"
                    ]
                    add(aResults, oResult)
                }
            }
        }

        aResults = self.sortResultsByScore(aResults)

        if len(aResults) > nMaxResults {
            aLimitedResults = []
            for i = 1 to nMaxResults {
                add(aLimitedResults, aResults[i])
            }
            return aLimitedResults
        }

        return aResults
    }

    /*
    Function: mergeAndRankResults
    Description: دمج النتائج وترتيبها
    */
    func mergeAndRankResults aResonanceResults, aPolarResults, aSemanticResults {
        aMergedResults = []
        aSeenSymbols = []

        # دمج النتائج مع تجنب التكرار
        aAllResults = aResonanceResults + aPolarResults + aSemanticResults

        for oResult in aAllResults {
            if isList(oResult) and oResult["symbol"] != null and isObject(oResult["symbol"]) {
                cSymbolId = oResult["symbol"].cId
                bAlreadySeen = false

                for cSeenId in aSeenSymbols {
                    if cSeenId = cSymbolId {
                        bAlreadySeen = true
                        exit
                    }
                }

                if not bAlreadySeen {
                    add(aSeenSymbols, cSymbolId)

                    # حساب النقاط المركبة
                    nCompositeScore = oResult["score"]
                    if oResult["method"] = "resonance" {
                        nCompositeScore *= 1.2  # وزن أعلى للرنين
                    elseif oResult["method"] = "polar_proximity"
                        nCompositeScore *= 1.0  # وزن عادي للقرب القطبي
                    elseif oResult["method"] = "semantic_cluster"
                        nCompositeScore *= 0.8  # وزن أقل للعناقيد الدلالية
                    }

                    oResult["composite_score"] = nCompositeScore
                    add(aMergedResults, oResult)
                }
            }
        }

        # ترتيب النتائج حسب النقاط المركبة
        for i = 1 to len(aMergedResults) - 1 {
            for j = i + 1 to len(aMergedResults) {
                if aMergedResults[i]["composite_score"] < aMergedResults[j]["composite_score"] {
                    temp = aMergedResults[i]
                    aMergedResults[i] = aMergedResults[j]
                    aMergedResults[j] = temp
                }
            }
        }

        return aMergedResults
    }

    /*
    Function: updatePolarIndex
    Description: تحديث فهرس الإحداثيات القطبية
    */
    func updatePolarIndex oSymbol {
        # تقسيم الفضاء إلى شبكة قطبية
        nRadiusGrid = floor(oSymbol.nRadius * 10)  # 10 مستويات نصف قطر
        nAngleGrid = floor(oSymbol.nAngle / 36)    # 10 قطاعات زاوية (36 درجة لكل قطاع)

        cGridKey = nRadiusGrid + "_" + nAngleGrid

        # البحث عن الشبكة الموجودة أو إنشاء جديدة
        oGridCell = null
        for oCell in self.aPolarCoordinateIndex {
            if oCell["key"] = cGridKey {
                oGridCell = oCell
                exit
            }
        }

        if oGridCell = null {
            oGridCell = [
                "key" = cGridKey,
                "radius_grid" = nRadiusGrid,
                "angle_grid" = nAngleGrid,
                "symbols" = []
            ]
            add(self.aPolarCoordinateIndex, oGridCell)
        }

        add(oGridCell["symbols"], oSymbol)
    }

    /*
    Function: updateResonanceNetwork
    Description: تحديث شبكة الرنين المرجاني
    */
    func updateResonanceNetwork oNewSymbol {
        # حساب الرنين مع الرموز الموجودة
        for oExistingSymbol in self.oMorgenSpace.aSymbols {
            if isObject(oExistingSymbol) and oExistingSymbol.cId != oNewSymbol.cId {
                nResonance = self.calculateResonance(oNewSymbol, oExistingSymbol)

                if nResonance > 0.6 {  # عتبة الرنين القوي
                    oConnection = [
                        "symbol1_id" = oNewSymbol.cId,
                        "symbol2_id" = oExistingSymbol.cId,
                        "resonance_strength" = nResonance,
                        "connection_type" = "strong_resonance",
                        "creation_epoch" = self.oMorgenSpace.nEpoch
                    ]
                    add(self.aResonanceNetwork, oConnection)
                }
            }
        }
    }

    /*
    Function: displayStorageStatistics
    Description: عرض إحصائيات نظام التخزين
    */
    func displayStorageStatistics {
        see nl + "📊 إحصائيات نظام التخزين المرجاني المتقدم" + nl
        see "=" * 50 + nl
        see "عدد الرموز المخزنة: " + len(self.aKnowledgeIndex) + nl
        see "عدد العناقيد الدلالية: " + len(self.aSemanticClusters) + nl
        see "عدد خلايا الفهرس القطبي: " + len(self.aPolarCoordinateIndex) + nl
        see "عدد اتصالات الرنين: " + len(self.aResonanceNetwork) + nl
        see "نسبة الاستخدام: " + (len(self.aKnowledgeIndex) / self.nStorageCapacity * 100) + "%" + nl
        see "=" * 50 + nl + nl
    }
}

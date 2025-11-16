# ==============================================================================
# File: memory_system.ring
# Description: Long-term memory and knowledge persistence system for Morgen AI
# Author: Morgen AI Project
# ==============================================================================

//load "space.ring"

# ==============================================================================
# Memory System Class
# ==============================================================================

class MemorySystem {
    ### --- Public Attributes & Methods ---
    oMorgenSpace        # Reference to the cognitive space
    aLongTermMemory     # Long-term memory storage
    aEpisodicMemory     # Episodic memories (experiences)
    aSemanticMemory     # Semantic memories (knowledge)
    aProceduralMemory   # Procedural memories (skills)
    nMemoryCapacity     # Maximum memory capacity
    nConsolidationThreshold  # Threshold for memory consolidation

    /*
    Function: init
    Description: Initializes the memory system
    */
    func init oSpace {
        if not isObject(oSpace) {
            raise("MemorySystem.init: Invalid space object")
        }
        
        self.oMorgenSpace = oSpace
        self.aLongTermMemory = []
        self.aEpisodicMemory = []
        self.aSemanticMemory = []
        self.aProceduralMemory = []
        self.nMemoryCapacity = 1000
        self.nConsolidationThreshold = 0.7
        
        see "Memory system initialized with capacity: " + self.nMemoryCapacity + nl
    }

    /*
    Function: consolidateMemories
    Description: Main memory consolidation process
    */
    func consolidateMemories {
        see "=== Memory Consolidation Process ===" + nl
        
        # 1. Extract significant experiences from current epoch
        self.extractEpisodicMemories()
        
        # 2. Identify semantic knowledge patterns
        self.extractSemanticMemories()
        
        # 3. Capture procedural patterns
        self.extractProceduralMemories()
        
        # 4. Consolidate memories into long-term storage
        self.performMemoryConsolidation()
        
        # 5. Prune old or weak memories
        self.pruneMemories()
        
        see "Memory consolidation completed" + nl
        see "  Episodic memories: " + len(self.aEpisodicMemory) + nl
        see "  Semantic memories: " + len(self.aSemanticMemory) + nl
        see "  Procedural memories: " + len(self.aProceduralMemory) + nl
        see "  Long-term memories: " + len(self.aLongTermMemory) + nl
    }

    /*
    Function: extractEpisodicMemories
    Description: Extracts episodic memories from recent experiences
    */
    func extractEpisodicMemories {
        see "  Extracting episodic memories..." + nl
        
        # Create episodic memory for current epoch state
        oEpisodicMemory = [
            "type" = "episodic",
            "epoch" = self.oMorgenSpace.nEpoch,
            "timestamp" = self.getCurrentTimestamp(),
            "context" = self.captureSpaceContext(),
            "significant_events" = self.identifySignificantEvents(),
            "emotional_valence" = self.calculateEmotionalValence(),
            "importance" = 0.5,  # Will be updated based on significance
            "access_count" = 0,
            "last_accessed" = self.getCurrentTimestamp()
        ]
        
        # Calculate importance based on significant events
        nEventSignificance = 0
        for oEvent in oEpisodicMemory["significant_events"] {
            nEventSignificance += oEvent["significance"]
        }
        
        if len(oEpisodicMemory["significant_events"]) > 0 {
            oEpisodicMemory["importance"] = nEventSignificance / len(oEpisodicMemory["significant_events"])
        }
        
        # Only store if sufficiently important
        if oEpisodicMemory["importance"] > 0.3 {
            add(self.aEpisodicMemory, oEpisodicMemory)
            see "    Created episodic memory for epoch " + self.oMorgenSpace.nEpoch + 
                " (importance: " + oEpisodicMemory["importance"] + ")" + nl
        }
    }

    /*
    Function: extractSemanticMemories
    Description: Extracts semantic knowledge from symbol patterns
    */
    func extractSemanticMemories {
        see "  Extracting semantic memories..." + nl
        
        # Extract knowledge about symbol types and their properties
        self.extractSymbolTypeKnowledge()
        
        # Extract knowledge about relationships
        self.extractRelationshipKnowledge()
        
        # Extract knowledge about linguistic patterns
        self.extractLinguisticKnowledge()
        
        # Extract knowledge about geometric patterns
        self.extractGeometricKnowledge()
    }

    /*
    Function: extractSymbolTypeKnowledge
    Description: Extracts knowledge about different symbol types
    */
    func extractSymbolTypeKnowledge {
        # Analyze symbol types and their characteristics
        aTypeAnalysis = []
        
        for oSymbol in self.oMorgenSpace.aSymbols {
            if isObject(oSymbol) {
                cType = oSymbol.cType
                bTypeFound = false
                
                for aTypeInfo in aTypeAnalysis {
                    if aTypeInfo[1] = cType {
                        aTypeInfo[2]++  # Count
                        aTypeInfo[3] += oSymbol.nResonance  # Total resonance
                        aTypeInfo[4] += oSymbol.nEnergyLevel  # Total energy
                        aTypeInfo[5] += oSymbol.nRadius  # Total radius
                        bTypeFound = true
                        break
                    }
                }
                
                if not bTypeFound {
                    add(aTypeAnalysis, [cType, 1, oSymbol.nResonance, oSymbol.nEnergyLevel, oSymbol.nRadius])
                }
            }
        }
        
        # Create semantic memories for each type
        for aTypeInfo in aTypeAnalysis {
            if aTypeInfo[2] >= 3 {  # At least 3 symbols of this type
                cType = aTypeInfo[1]
                nCount = aTypeInfo[2]
                nAvgResonance = aTypeInfo[3] / nCount
                nAvgEnergy = aTypeInfo[4] / nCount
                nAvgRadius = aTypeInfo[5] / nCount
                
                oSemanticMemory = [
                    "type" = "semantic",
                    "category" = "symbol_type_knowledge",
                    "subject" = cType,
                    "knowledge" = [
                        "average_resonance" = nAvgResonance,
                        "average_energy" = nAvgEnergy,
                        "average_radius" = nAvgRadius,
                        "population" = nCount,
                        "typical_behavior" = self.analyzeTypicalBehavior(cType)
                    ],
                    "confidence" = min(1.0, nCount / 10.0),
                    "epoch_learned" = self.oMorgenSpace.nEpoch,
                    "access_count" = 0
                ]
                
                add(self.aSemanticMemory, oSemanticMemory)
                
                see "    Learned about symbol type: " + cType + " (" + nCount + " instances)" + nl
            }
        }
    }

    /*
    Function: extractRelationshipKnowledge
    Description: Extracts knowledge about symbol relationships
    */
    func extractRelationshipKnowledge {
        # Analyze relationship patterns
        aRelationshipTypes = []
        
        for oSymbol in self.oMorgenSpace.aSymbols {
            if isObject(oSymbol) {
                for oRelation in oSymbol.aRelations {
                    if isObject(oRelation) {
                        cRelationType = oRelation.cType
                        bTypeFound = false
                        
                        for aRelInfo in aRelationshipTypes {
                            if aRelInfo[1] = cRelationType {
                                aRelInfo[2]++  # Count
                                aRelInfo[3] += oRelation.nStrength  # Total strength
                                bTypeFound = true
                                break
                            }
                        }
                        
                        if not bTypeFound {
                            add(aRelationshipTypes, [cRelationType, 1, oRelation.nStrength])
                        }
                    }
                }
            }
        }
        
        # Create semantic memories for relationship types
        for aRelInfo in aRelationshipTypes {
            if aRelInfo[2] >= 2 {  # At least 2 relationships of this type
                cRelationType = aRelInfo[1]
                nCount = aRelInfo[2]
                nAvgStrength = aRelInfo[3] / nCount
                
                oSemanticMemory = [
                    "type" = "semantic",
                    "category" = "relationship_knowledge",
                    "subject" = cRelationType,
                    "knowledge" = [
                        "average_strength" = nAvgStrength,
                        "frequency" = nCount,
                        "typical_context" = self.analyzeRelationshipContext(cRelationType)
                    ],
                    "confidence" = min(1.0, nCount / 5.0),
                    "epoch_learned" = self.oMorgenSpace.nEpoch,
                    "access_count" = 0
                ]
                
                add(self.aSemanticMemory, oSemanticMemory)
            }
        }
    }

    /*
    Function: extractLinguisticKnowledge
    Description: Extracts knowledge about linguistic patterns
    */
    func extractLinguisticKnowledge {
        # Count linguistic symbol types
        nArabicLetters = 0
        nArabicWords = 0
        nRoots = 0
        nMeanings = 0
        
        for oSymbol in self.oMorgenSpace.aSymbols {
            if isObject(oSymbol) {
                if oSymbol.cType = "arabic_letter" {
                    nArabicLetters++
                elseif oSymbol.cType = "arabic_word" 
                    nArabicWords++
                elseif oSymbol.cType = "triconsonantal_root" 
                    nRoots++
                elseif oSymbol.cType = "text_meaning" 
                    nMeanings++
                }
            }
        }
        
        # Create linguistic ecosystem knowledge
        if nArabicLetters + nArabicWords + nRoots + nMeanings > 0 {
            oLinguisticMemory = [
                "type" = "semantic",
                "category" = "linguistic_knowledge",
                "subject" = "arabic_language_ecosystem",
                "knowledge" = [
                    "letter_count" = nArabicLetters,
                    "word_count" = nArabicWords,
                    "root_count" = nRoots,
                    "meaning_count" = nMeanings,
                    "linguistic_diversity" = self.calculateLinguisticDiversity(),
                    "dominant_patterns" = self.identifyDominantLinguisticPatterns()
                ],
                "confidence" = 0.8,
                "epoch_learned" = self.oMorgenSpace.nEpoch,
                "access_count" = 0
            ]
            
            add(self.aSemanticMemory, oLinguisticMemory)
            
            see "    Learned linguistic ecosystem knowledge" + nl
        }
    }

    /*
    Function: extractGeometricKnowledge
    Description: Extracts knowledge about geometric patterns
    */
    func extractGeometricKnowledge {
        # Analyze spatial distribution
        nCenterSymbols = 0  # r < 0.3
        nMiddleSymbols = 0  # 0.3 <= r < 0.7
        nPeripherySymbols = 0  # r >= 0.7
        
        for oSymbol in self.oMorgenSpace.aSymbols {
            if isObject(oSymbol) {
                if oSymbol.nRadius < 0.3 {
                    nCenterSymbols++
                elseif oSymbol.nRadius < 0.7 
                    nMiddleSymbols++
                else 
                    nPeripherySymbols++
                }
            }
        }
        
        oGeometricMemory = [
            "type" = "semantic",
            "category" = "geometric_knowledge",
            "subject" = "spatial_distribution",
            "knowledge" = [
                "center_population" = nCenterSymbols,
                "middle_population" = nMiddleSymbols,
                "periphery_population" = nPeripherySymbols,
                "triangulation_count" = len(self.oMorgenSpace.aTriangulations),
                "galaxy_count" = len(self.oMorgenSpace.aGalaxies),
                "spatial_density" = self.calculateSpatialDensity()
            ],
            "confidence" = 0.9,
            "epoch_learned" = self.oMorgenSpace.nEpoch,
            "access_count" = 0
        ]
        
        add(self.aSemanticMemory, oGeometricMemory)
        
        see "    Learned geometric distribution knowledge" + nl
    }

    /*
    Function: extractProceduralMemories
    Description: Extracts procedural knowledge (how to do things)
    */
    func extractProceduralMemories {
        see "  Extracting procedural memories..." + nl
        
        # Extract dream cycle effectiveness patterns
        self.extractDreamCycleProcedures()
        
        # Extract wave generation procedures
        self.extractWaveGenerationProcedures()
        
        # Extract triangulation procedures
        self.extractTriangulationProcedures()
    }

    /*
    Function: extractDreamCycleProcedures
    Description: Extracts knowledge about effective dream cycle procedures
    */
    func extractDreamCycleProcedures {
        # Analyze recent dream cycle outcomes
        nSymbolGrowth = 0
        nResonanceChange = 0
        
        # This would ideally track changes over multiple cycles
        # For now, we'll create a basic procedural memory
        
        oProceduralMemory = [
            "type" = "procedural",
            "category" = "dream_cycle_execution",
            "procedure" = "enhanced_dream_cycle",
            "effectiveness" = self.evaluateDreamCycleEffectiveness(),
            "conditions" = [
                "optimal_symbol_count" = len(self.oMorgenSpace.aSymbols),
                "optimal_resonance_range" = [1.0, 5.0],
                "recommended_frequency" = "every_epoch"
            ],
            "success_rate" = 0.8,  # Would be calculated from historical data
            "epoch_learned" = self.oMorgenSpace.nEpoch,
            "access_count" = 0
        ]
        
        add(self.aProceduralMemory, oProceduralMemory)
        
        see "    Learned dream cycle procedures" + nl
    }

    /*
    Function: extractWaveGenerationProcedures
    Description: Extracts knowledge about effective wave generation
    */
    func extractWaveGenerationProcedures {
        if len(self.oMorgenSpace.aWaveFronts) > 0 {
            oWaveProcedure = [
                "type" = "procedural",
                "category" = "wave_generation",
                "procedure" = "insight_wave_creation",
                "effectiveness" = self.evaluateWaveEffectiveness(),
                "conditions" = [
                    "minimum_source_resonance" = 2.0,
                    "optimal_wave_energy" = 0.8,
                    "maximum_concurrent_waves" = 5
                ],
                "success_rate" = 0.7,
                "epoch_learned" = self.oMorgenSpace.nEpoch,
                "access_count" = 0
            ]
            
            add(self.aProceduralMemory, oWaveProcedure)
            
            see "    Learned wave generation procedures" + nl
        }
    }

    /*
    Function: extractTriangulationProcedures
    Description: Extracts knowledge about effective triangulation
    */
    func extractTriangulationProcedures {
        if len(self.oMorgenSpace.aTriangulations) > 0 {
            oTriangulationProcedure = [
                "type" = "procedural",
                "category" = "triangulation_creation",
                "procedure" = "emergent_triangulation",
                "effectiveness" = self.evaluateTriangulationEffectiveness(),
                "conditions" = [
                    "minimum_stability_threshold" = 0.6,
                    "optimal_symbol_distance" = 0.5,
                    "resonance_harmony_factor" = 0.8
                ],
                "success_rate" = 0.75,
                "epoch_learned" = self.oMorgenSpace.nEpoch,
                "access_count" = 0
            ]
            
            add(self.aProceduralMemory, oTriangulationProcedure)
            
            see "    Learned triangulation procedures" + nl
        }
    }

    /*
    Function: performMemoryConsolidation
    Description: Consolidates memories into long-term storage
    */
    func performMemoryConsolidation {
        see "  Performing memory consolidation..." + nl
        
        nConsolidated = 0
        
        # Consolidate high-importance episodic memories
        for oEpisodic in self.aEpisodicMemory {
            if oEpisodic["importance"] > self.nConsolidationThreshold {
                oLongTermMemory = [
                    "type" = "consolidated_episodic",
                    "original_memory" = oEpisodic,
                    "consolidation_epoch" = self.oMorgenSpace.nEpoch,
                    "strength" = oEpisodic["importance"],
                    "access_count" = 0
                ]
                
                add(self.aLongTermMemory, oLongTermMemory)
                nConsolidated++
            }
        }
        
        # Consolidate high-confidence semantic memories
        for oSemantic in self.aSemanticMemory {
            if oSemantic["confidence"] > self.nConsolidationThreshold {
                oLongTermMemory = [
                    "type" = "consolidated_semantic",
                    "original_memory" = oSemantic,
                    "consolidation_epoch" = self.oMorgenSpace.nEpoch,
                    "strength" = oSemantic["confidence"],
                    "access_count" = 0
                ]
                
                add(self.aLongTermMemory, oLongTermMemory)
                nConsolidated++
            }
        }
        
        # Consolidate effective procedural memories
        for oProcedural in self.aProceduralMemory {
            if oProcedural["success_rate"] > self.nConsolidationThreshold {
                oLongTermMemory = [
                    "type" = "consolidated_procedural",
                    "original_memory" = oProcedural,
                    "consolidation_epoch" = self.oMorgenSpace.nEpoch,
                    "strength" = oProcedural["success_rate"],
                    "access_count" = 0
                ]
                
                add(self.aLongTermMemory, oLongTermMemory)
                nConsolidated++
            }
        }
        
        see "    Consolidated " + nConsolidated + " memories into long-term storage" + nl
    }

    /*
    Function: pruneMemories
    Description: Removes old or weak memories to maintain capacity
    */
    func pruneMemories {
        see "  Pruning memories..." + nl
        
        nTotalMemories = len(self.aEpisodicMemory) + len(self.aSemanticMemory) + 
                        len(self.aProceduralMemory) + len(self.aLongTermMemory)
        
        if nTotalMemories > self.nMemoryCapacity {
            nToPrune = nTotalMemories - self.nMemoryCapacity
            nPruned = 0
            
            # Prune low-importance episodic memories first
            aPrunedEpisodic = []
            for oEpisodic in self.aEpisodicMemory {
                if oEpisodic["importance"] > 0.2 or nPruned >= nToPrune {
                    add(aPrunedEpisodic, oEpisodic)
                else 
                    nPruned++
                }
            }
            self.aEpisodicMemory = aPrunedEpisodic
            
            # Prune low-confidence semantic memories if needed
            if nPruned < nToPrune {
                aPrunedSemantic = []
                for oSemantic in self.aSemanticMemory {
                    if oSemantic["confidence"] > 0.3 or nPruned >= nToPrune {
                        add(aPrunedSemantic, oSemantic)
                    else 
                        nPruned++
                    }
                }
                self.aSemanticMemory = aPrunedSemantic
            }
            
            see "    Pruned " + nPruned + " weak memories" + nl
        }
    }

    /*
    Function: recallMemory
    Description: Recalls memories based on query
    */
    func recallMemory cQuery, cType {
        aResults = []
        
        # Search in appropriate memory type
        if cType = "episodic" or cType = "all" {
            for oMemory in self.aEpisodicMemory {
                if self.memoryMatchesQuery(oMemory, cQuery) {
                    oMemory["access_count"]++
                    oMemory["last_accessed"] = self.getCurrentTimestamp()
                    add(aResults, oMemory)
                }
            }
        }
        
        if cType = "semantic" or cType = "all" {
            for oMemory in self.aSemanticMemory {
                if self.memoryMatchesQuery(oMemory, cQuery) {
                    oMemory["access_count"]++
                    add(aResults, oMemory)
                }
            }
        }
        
        if cType = "procedural" or cType = "all" {
            for oMemory in self.aProceduralMemory {
                if self.memoryMatchesQuery(oMemory, cQuery) {
                    oMemory["access_count"]++
                    add(aResults, oMemory)
                }
            }
        }
        
        if cType = "long_term" or cType = "all" {
            for oMemory in self.aLongTermMemory {
                if self.memoryMatchesQuery(oMemory, cQuery) {
                    oMemory["access_count"]++
                    add(aResults, oMemory)
                }
            }
        }
        
        return aResults
    }

    /*
    Function: memoryMatchesQuery
    Description: Checks if a memory matches a query
    */
    func memoryMatchesQuery oMemory, cQuery {
        # Simple string matching for now
        # Could be enhanced with semantic matching
        
        cMemoryText = ""
        
        if oMemory["type"] = "episodic" {
            cMemoryText = "epoch_" + oMemory["epoch"]
        elseif oMemory["type"] = "semantic" 
            cMemoryText = oMemory["category"] + "_" + oMemory["subject"]
        elseif oMemory["type"] = "procedural" 
            cMemoryText = oMemory["category"] + "_" + oMemory["procedure"]
        }
        
        return find(cMemoryText, cQuery) > 0
    }

    /*
    Function: getMemoryStatistics
    Description: Returns memory system statistics
    */
    func getMemoryStatistics {
        see nl + "=== Memory System Statistics ===" + nl
        see "Episodic memories: " + len(self.aEpisodicMemory) + nl
        see "Semantic memories: " + len(self.aSemanticMemory) + nl
        see "Procedural memories: " + len(self.aProceduralMemory) + nl
        see "Long-term memories: " + len(self.aLongTermMemory) + nl
        
        nTotalMemories = len(self.aEpisodicMemory) + len(self.aSemanticMemory) + 
                        len(self.aProceduralMemory) + len(self.aLongTermMemory)
        
        see "Total memories: " + nTotalMemories + " / " + self.nMemoryCapacity + nl
        see "Memory utilization: " + (nTotalMemories * 100 / self.nMemoryCapacity) + "%" + nl
        
        return nTotalMemories
    }

    # Helper functions (simplified implementations)
    func getCurrentTimestamp { return self.oMorgenSpace.nEpoch }
    func captureSpaceContext { return ["symbols" = len(self.oMorgenSpace.aSymbols), "resonance" = self.oMorgenSpace.nGlobalResonance] }
    func identifySignificantEvents { return [["type" = "dream_cycle", "significance" = 0.8]] }
    func calculateEmotionalValence { return 0.5 }
    func analyzeTypicalBehavior cType { return "standard_behavior" }
    func analyzeRelationshipContext cType { return "standard_context" }
    func calculateLinguisticDiversity { return 0.7 }
    func identifyDominantLinguisticPatterns { return ["arabic_roots", "word_formation"] }
    func calculateSpatialDensity { return 0.6 }
    func evaluateDreamCycleEffectiveness { return 0.8 }
    func evaluateWaveEffectiveness { return 0.7 }
    func evaluateTriangulationEffectiveness { return 0.75 }

}

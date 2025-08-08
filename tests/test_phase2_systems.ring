# ==============================================================================
# File: test_phase2_systems.ring
# Description: Comprehensive tests for Phase 2 advanced systems
# Author: Morgen AI Project
# ==============================================================================

load "../morgen/advanced_morgen_system.ring"



    see "==================================================" + nl
    see "MORGEN AI - PHASE 2 ADVANCED SYSTEMS TESTS" + nl
    see "==================================================" + nl
    
    # Test individual components
    oInsightEngine = testInsightEngine()
    oAdaptiveLearning = testAdaptiveLearning(oInsightEngine)
    oMemorySystem = testMemorySystem(oInsightEngine.oMorgenSpace)
    
    # Test integrated system
    oAdvancedSystem = testAdvancedMorgenSystem()
    
    # Test system integration
    testSystemIntegration(oAdvancedSystem)
    
    # Run performance benchmarks
    nPerformanceScore = testPerformanceBenchmarks(oAdvancedSystem)
    
    see nl + "=== PHASE 2 SYSTEMS TEST SUMMARY ===" + nl
    see "✓ Insight Engine: " + len(oInsightEngine.aInsightPatterns) + " patterns discovered" + nl
    see "✓ Adaptive Learning: " + len(oAdaptiveLearning.aLearningGoals) + " goals managed" + nl
    see "✓ Memory System: " + oMemorySystem.getMemoryStatistics() + " memories stored" + nl
    see "✓ Advanced System: " + oAdvancedSystem.nSystemEpoch + " master cycles completed" + nl
    see "✓ Performance Score: " + nPerformanceScore + " / 1.0" + nl
    
    if nPerformanceScore > 0.7 {
        see "🎉 PHASE 2 SYSTEMS PERFORMING EXCELLENTLY!" + nl
    elseif nPerformanceScore > 0.5 
        see "✅ PHASE 2 SYSTEMS PERFORMING WELL" + nl
    else 
        see "⚠️ PHASE 2 SYSTEMS NEED OPTIMIZATION" + nl
    }
    
    see nl + "==================================================" + nl
    see "PHASE 2 ADVANCED SYSTEMS TESTS COMPLETE" + nl
    see "==================================================" + nl

/*
Function: testInsightEngine
Description: Tests the insight discovery engine
*/
func testInsightEngine {
    see "=== Testing Insight Engine ===" + nl
    
    # Create test space with diverse symbols
    oSpace = new MorgenSpace(5)
    
    # Add various symbol types
    for i = 1 to 15 {
        aGenome = []
        for j = 1 to 4 {
            add(aGenome, random(2) + 1)
        }
        
        nRadius = 0.2 + (random(60) / 100.0)
        nAngle = random(360)
        
        oSymbol = new MorgenSymbol("test_" + i, "test_type", aGenome, nRadius, nAngle, null)
        oSymbol.nResonance = 1.0 + (random(30) / 10.0)
        oSymbol.nEnergyLevel = 0.5 + (random(50) / 100.0)
        
        oSpace.addSymbol(oSymbol)
    }
    
    # Create some triangulations
    if len(oSpace.aSymbols) >= 6 {
        oSpace.createTriangulation(oSpace.aSymbols[1], oSpace.aSymbols[2], oSpace.aSymbols[3], "test_tri_1")
        oSpace.createTriangulation(oSpace.aSymbols[4], oSpace.aSymbols[5], oSpace.aSymbols[6], "test_tri_2")
    }
    
    # Test insight engine
    oInsightEngine = new InsightEngine(oSpace)
    oInsightEngine.discoverInsights()
    
    see "Insights discovered: " + len(oInsightEngine.aInsightPatterns) + nl
    see "Meta-patterns found: " + len(oInsightEngine.aMetaPatterns) + nl
    
    # Display some insights
    for i = 1 to min(3, len(oInsightEngine.aInsightPatterns)) {
        oPattern = oInsightEngine.aInsightPatterns[i]
        see "  Pattern " + i + ": " + oPattern["type"] + " - " + oPattern["description"] + nl
        see "    Confidence: " + oPattern["confidence"] + nl
    }
    
    nInsightScore = oInsightEngine.getInsightSummary()
    see "Overall insight score: " + nInsightScore + nl
    
    return oInsightEngine
}

/*
Function: testAdaptiveLearning
Description: Tests the adaptive learning system
*/
func testAdaptiveLearning oInsightEngine {
    see nl + "=== Testing Adaptive Learning System ===" + nl
    
    oSpace = oInsightEngine.oMorgenSpace
    oAdaptiveLearning = new AdaptiveLearning(oSpace, oInsightEngine)
    
    see "Initial learning goals:" + nl
    for oGoal in oAdaptiveLearning.aLearningGoals {
        see "  " + oGoal["id"] + ": " + (oGoal["progress"] * 100) + "% (target: " + oGoal["target_value"] + ")" + nl
    }
    
    # Run adaptive learning cycles
    for nCycle = 1 to 3 {
        see nl + "--- Adaptive Learning Cycle #" + nCycle + " ---" + nl
        
        oAdaptiveLearning.adaptiveLearningCycle()
        
        see "Goal progress after cycle " + nCycle + ":" + nl
        for oGoal in oAdaptiveLearning.aLearningGoals {
            see "  " + oGoal["id"] + ": " + (oGoal["progress"] * 100) + "% (" + oGoal["strategy"] + ")" + nl
        }
    }
    
    # Get learning report
    oAdaptiveLearning.getLearningReport()
    
    return oAdaptiveLearning
}

/*
Function: testMemorySystem
Description: Tests the memory system
*/
func testMemorySystem oSpace {
    see nl + "=== Testing Memory System ===" + nl
    
    oMemorySystem = new MemorySystem(oSpace)
    
    # Run several dream cycles to generate experiences
    for i = 1 to 3 {
        oSpace.enhancedDreamCycle()
        oSpace.updateGlobalResonance()
    }
    
    # Test memory consolidation
    oMemorySystem.consolidateMemories()
    
    # Test memory recall
    see nl + "Testing memory recall:" + nl
    
    aEpisodicResults = oMemorySystem.recallMemory("epoch", "episodic")
    see "  Episodic memories recalled: " + len(aEpisodicResults) + nl
    
    aSemanticResults = oMemorySystem.recallMemory("symbol", "semantic")
    see "  Semantic memories recalled: " + len(aSemanticResults) + nl
    
    aProceduralResults = oMemorySystem.recallMemory("dream", "procedural")
    see "  Procedural memories recalled: " + len(aProceduralResults) + nl
    
    # Display memory statistics
    nTotalMemories = oMemorySystem.getMemoryStatistics()
    
    return oMemorySystem
}

/*
Function: testAdvancedMorgenSystem
Description: Tests the complete advanced Morgen system
*/
func testAdvancedMorgenSystem {
    see nl + "=== Testing Advanced Morgen System ===" + nl
    
    # Initialize the complete system
    oAdvancedSystem = new AdvancedMorgenSystem(5)
    
    # Test text processing
    see nl + "Testing text processing capabilities:" + nl
    
    aTestTexts = [
        "كتاب",
        "ماء كتاب",
        "بيت ماء كتاب"
    ]
    
    for cText in aTestTexts {
        see nl + "Processing: '" + cText + "'" + nl
        cResponse = oAdvancedSystem.processText(cText)
        see "Response: '" + cResponse + "'" + nl
    }
    
    # Test master cognitive cycles
    see nl + "Testing master cognitive cycles:" + nl
    
    for nCycle = 1 to 2 {
        see nl + "=== Master Cognitive Cycle #" + nCycle + " ===" + nl
        oAdvancedSystem.masterCognitiveCycle()
    }
    
    # Generate system report
    oAdvancedSystem.getSystemReport()
    
    return oAdvancedSystem
}

/*
Function: testSystemIntegration
Description: Tests integration between all Phase 2 systems
*/
func testSystemIntegration oAdvancedSystem {
    see nl + "=== Testing System Integration ===" + nl
    
    # Test cross-system communication
    see "Testing cross-system communication..." + nl
    
    # 1. Insight engine affects adaptive learning
    oAdvancedSystem.oInsightEngine.discoverInsights()
    nInsightsBefore = len(oAdvancedSystem.oInsightEngine.aInsightPatterns)
    
    # 2. Adaptive learning affects dream cycles
    oAdvancedSystem.oAdaptiveLearning.adaptiveLearningCycle()
    
    # 3. Dream cycles affect memory consolidation
    oAdvancedSystem.oMemorySystem.consolidateMemories()
    
    # 4. Memory affects future processing
    aMemories = oAdvancedSystem.oMemorySystem.recallMemory("all", "all")
    
    see "Integration test results:" + nl
    see "  Insights generated: " + nInsightsBefore + nl
    see "  Memories consolidated: " + len(aMemories) + nl
    see "  System coherence: " + oAdvancedSystem.oMorgenSpace.nGlobalResonance + nl
    
    # Test emergent behaviors
    see nl + "Testing emergent behaviors..." + nl
    
    # Run multiple master cycles to observe emergence
    for i = 1 to 3 {
        oAdvancedSystem.masterCognitiveCycle()
        
        see "Cycle " + i + " emergent properties:" + nl
        see "  Symbol diversity: " + oAdvancedSystem.oAdaptiveLearning.countSymbolTypes() + nl
        see "  Condensed symbols: " + oAdvancedSystem.oAdaptiveLearning.countCondensedSymbols() + nl
        see "  Linguistic coherence: " + oAdvancedSystem.oAdaptiveLearning.calculateLinguisticCoherence() + nl
    }
}

/*
Function: testPerformanceBenchmarks
Description: Tests system performance and benchmarks
*/
func testPerformanceBenchmarks oAdvancedSystem {
    see nl + "=== Performance Benchmarks ===" + nl
    
    # Benchmark 1: Processing speed
    see "Benchmark 1: Text processing speed" + nl
    
    aTestTexts = ["كتاب", "ماء", "بيت", "نور", "علم"]
    nStartTime = clock()
    
    for cText in aTestTexts {
        oAdvancedSystem.processText(cText)
    }
    
    nEndTime = clock()
    nProcessingTime = nEndTime - nStartTime
    
    see "  Processed " + len(aTestTexts) + " texts in " + nProcessingTime + " time units" + nl
    see "  Average processing time: " + (nProcessingTime / len(aTestTexts)) + " per text" + nl
    
    # Benchmark 2: Memory efficiency
    see nl + "Benchmark 2: Memory efficiency" + nl
    
    nInitialMemories = oAdvancedSystem.oMemorySystem.getMemoryStatistics()
    
    # Run cycles and measure memory growth
    for i = 1 to 5 {
        oAdvancedSystem.masterCognitiveCycle()
    }
    
    nFinalMemories = oAdvancedSystem.oMemorySystem.getMemoryStatistics()
    nMemoryGrowth = nFinalMemories - nInitialMemories
    
    see "  Memory growth: " + nInitialMemories + " → " + nFinalMemories + " (" + nMemoryGrowth + " new memories)" + nl
    see "  Memory efficiency: " + (nMemoryGrowth / 5) + " memories per cycle" + nl
    
    # Benchmark 3: Learning convergence
    see nl + "Benchmark 3: Learning convergence" + nl
    
    nTotalProgress = 0
    for oGoal in oAdvancedSystem.oAdaptiveLearning.aLearningGoals {
        nTotalProgress += oGoal["progress"]
    }
    nAvgProgress = nTotalProgress / len(oAdvancedSystem.oAdaptiveLearning.aLearningGoals)
    
    see "  Average goal progress: " + (nAvgProgress * 100) + "%" + nl
    see "  Learning convergence rate: " + (nAvgProgress / oAdvancedSystem.nSystemEpoch) + " per epoch" + nl
    
    # Benchmark 4: Insight generation rate
    see nl + "Benchmark 4: Insight generation" + nl
    
    nInsightsPerEpoch = len(oAdvancedSystem.oInsightEngine.aInsightPatterns) / max(1, oAdvancedSystem.nSystemEpoch)
    
    see "  Total insights: " + len(oAdvancedSystem.oInsightEngine.aInsightPatterns) + nl
    see "  Insights per epoch: " + nInsightsPerEpoch + nl
    
    # Overall system score
    nOverallScore = (nAvgProgress * 0.4) + 
                   (min(1.0, nInsightsPerEpoch) * 0.3) + 
                   (min(1.0, oAdvancedSystem.oMorgenSpace.nGlobalResonance / 5.0) * 0.3)
    
    see nl + "Overall system performance score: " + nOverallScore + " / 1.0" + nl
    
    return nOverallScore
}


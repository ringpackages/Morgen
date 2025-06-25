# Basic Usage Examples - Morgen AI Paradigm
# Comprehensive examples demonstrating system capabilities

load "../performance_metrics/performance_engine.ring"

func main() {
    see "==================================================" + nl
    see "MORGEN AI PARADIGM - BASIC USAGE EXAMPLES" + nl
    see "==================================================" + nl + nl
    
    # Run all examples
    runExample1_BasicSymbolCreation()
    runExample2_CognitiveSpaceOperations()
    runExample3_ArabicTextProcessing()
    runExample4_DreamCycleSimulation()
    runExample5_PerformanceMonitoring()
    runExample6_SystemEvaluation()
    
    see nl + "🎉 All examples completed successfully!" + nl
    see "These examples demonstrate the core capabilities of Morgen AI Paradigm." + nl
}

func runExample1_BasicSymbolCreation() {
    see "=== Example 1: Basic Symbol Creation ===" + nl
    see "Demonstrating how to create and manipulate cognitive symbols" + nl + nl
    
    # Create basic symbols
    see "Creating cognitive symbols..." + nl
    
    oSymbol1 = createMorgenSymbol("concept_1", "abstract_concept", [1, 2, 3], 5.0, 45.0)
    oSymbol2 = createMorgenSymbol("concept_2", "concrete_object", [2, 3, 4], 3.0, 90.0)
    oSymbol3 = createMorgenSymbol("relation_1", "relationship", [1, 3, 2], 4.0, 135.0)
    
    see "✅ Created symbol: " + oSymbol1["id"] + " at position (r=" + 
        oSymbol1["radius"] + ", θ=" + oSymbol1["angle"] + "°)" + nl
    see "✅ Created symbol: " + oSymbol2["id"] + " at position (r=" + 
        oSymbol2["radius"] + ", θ=" + oSymbol2["angle"] + "°)" + nl
    see "✅ Created symbol: " + oSymbol3["id"] + " at position (r=" + 
        oSymbol3["radius"] + ", θ=" + oSymbol3["angle"] + "°)" + nl
    
    # Calculate distances between symbols
    see nl + "Calculating distances between symbols..." + nl
    
    nDistance12 = calculatePolarDistance(oSymbol1, oSymbol2)
    nDistance13 = calculatePolarDistance(oSymbol1, oSymbol3)
    nDistance23 = calculatePolarDistance(oSymbol2, oSymbol3)
    
    see "Distance between " + oSymbol1["id"] + " and " + oSymbol2["id"] + ": " + nDistance12 + nl
    see "Distance between " + oSymbol1["id"] + " and " + oSymbol3["id"] + ": " + nDistance13 + nl
    see "Distance between " + oSymbol2["id"] + " and " + oSymbol3["id"] + ": " + nDistance23 + nl
    
    # Demonstrate genome similarity
    see nl + "Calculating genome similarities..." + nl
    
    nSimilarity12 = calculateGenomeSimilarity(oSymbol1["genome"], oSymbol2["genome"])
    nSimilarity13 = calculateGenomeSimilarity(oSymbol1["genome"], oSymbol3["genome"])
    
    see "Genome similarity between " + oSymbol1["id"] + " and " + oSymbol2["id"] + ": " + nSimilarity12 + nl
    see "Genome similarity between " + oSymbol1["id"] + " and " + oSymbol3["id"] + ": " + nSimilarity13 + nl
    
    see nl + "✅ Example 1 completed" + nl + nl
}

func runExample2_CognitiveSpaceOperations() {
    see "=== Example 2: Cognitive Space Operations ===" + nl
    see "Demonstrating cognitive space management and operations" + nl + nl
    
    # Create cognitive space
    see "Creating cognitive space with horn depth 5..." + nl
    oCognitiveSpace = createCognitiveSpace(5)
    
    # Add symbols to space
    see "Adding symbols to cognitive space..." + nl
    
    aSymbols = []
    for i = 1 to 10 {
        oSymbol = createMorgenSymbol("symbol_" + i, "test_concept", 
                                   [random(5), random(5), random(5)], 
                                   random(10), random(360))
        add(aSymbols, oSymbol)
        addSymbolToSpace(oCognitiveSpace, oSymbol)
        see "  Added: " + oSymbol["id"] + nl
    }
    
    # Display space statistics
    see nl + "Cognitive space statistics:" + nl
    see "  Total symbols: " + len(oCognitiveSpace["symbols"]) + nl
    see "  Horn depth: " + oCognitiveSpace["horn_depth"] + nl
    see "  Global resonance: " + oCognitiveSpace["global_resonance"] + nl
    
    # Find nearest neighbors
    see nl + "Finding nearest neighbors for symbol_1..." + nl
    oTargetSymbol = aSymbols[1]
    aNearestSymbols = findNearestSymbols(oCognitiveSpace, oTargetSymbol, 3)
    
    for oNearSymbol in aNearestSymbols {
        nDistance = calculatePolarDistance(oTargetSymbol, oNearSymbol)
        see "  Neighbor: " + oNearSymbol["id"] + " (distance: " + nDistance + ")" + nl
    }
    
    see nl + "✅ Example 2 completed" + nl + nl
}

func runExample3_ArabicTextProcessing() {
    see "=== Example 3: Arabic Text Processing ===" + nl
    see "Demonstrating Arabic language processing capabilities" + nl + nl
    
    # Sample Arabic texts
    aArabicTexts = [
        "كتب الطالب الدرس",
        "قرأت الفتاة القصة",
        "درس المعلم الطلاب",
        "فهم الولد الموضوع"
    ]
    
    see "Processing Arabic texts..." + nl
    
    for cText in aArabicTexts {
        see nl + "Text: " + cText + nl
        
        # Extract words
        aWords = extractWords(cText)
        see "  Words: " + len(aWords) + " words found" + nl
        
        # Process each word
        for cWord in aWords {
            # Simulate trilateral root extraction
            aRoots = extractTriliateralRoots(cWord)
            
            # Create symbol for word
            oWordSymbol = createArabicWordSymbol(cWord, aRoots)
            
            see "    " + cWord + " -> roots: " + listToString(aRoots) + 
                " (symbol: " + oWordSymbol["id"] + ")" + nl
        }
    }
    
    # Demonstrate semantic relationship discovery
    see nl + "Discovering semantic relationships..." + nl
    
    aWordPairs = [
        ["كتب", "قرأ"],
        ["طالب", "معلم"],
        ["درس", "فهم"]
    ]
    
    for aPair in aWordPairs {
        cWord1 = aPair[1]
        cWord2 = aPair[2]
        nSimilarity = calculateSemanticSimilarity(cWord1, cWord2)
        see "  " + cWord1 + " <-> " + cWord2 + ": similarity = " + nSimilarity + nl
    }
    
    see nl + "✅ Example 3 completed" + nl + nl
}

func runExample4_DreamCycleSimulation() {
    see "=== Example 4: Dream Cycle Simulation ===" + nl
    see "Demonstrating the three-phase dream cycle processing" + nl + nl
    
    # Create initial cognitive state
    oCognitiveSpace = createCognitiveSpace(3)
    
    # Add initial symbols
    see "Setting up initial cognitive state..." + nl
    aInitialSymbols = [
        createMorgenSymbol("knowledge_1", "fact", [1, 2, 3], 2.0, 0),
        createMorgenSymbol("knowledge_2", "fact", [2, 3, 4], 2.5, 60),
        createMorgenSymbol("knowledge_3", "concept", [3, 4, 5], 3.0, 120),
        createMorgenSymbol("knowledge_4", "relation", [1, 3, 5], 1.5, 180)
    ]
    
    for oSymbol in aInitialSymbols {
        addSymbolToSpace(oCognitiveSpace, oSymbol)
        see "  Initial symbol: " + oSymbol["id"] + nl
    }
    
    # Run dream cycles
    see nl + "Running dream cycles..." + nl
    
    for nCycle = 1 to 3 {
        see nl + "--- Dream Cycle " + nCycle + " ---" + nl
        
        # Phase 1: Ḥall (Decomposition)
        see "Phase 1 - Ḥall (Decomposition):" + nl
        aDecomposedElements = hallPhase(oCognitiveSpace)
        see "  Decomposed " + len(oCognitiveSpace["symbols"]) + " symbols into " + 
            len(aDecomposedElements) + " elements" + nl
        
        # Phase 2: Lamm (Recombination)
        see "Phase 2 - Lamm (Recombination):" + nl
        aNewCombinations = lammPhase(aDecomposedElements)
        see "  Created " + len(aNewCombinations) + " new combinations" + nl
        
        # Phase 3: Ḥulm (Integration)
        see "Phase 3 - Ḥulm (Integration):" + nl
        hulmPhase(oCognitiveSpace, aNewCombinations)
        see "  Integrated new knowledge into cognitive space" + nl
        
        # Update global resonance
        updateGlobalResonance(oCognitiveSpace)
        see "  Global resonance: " + oCognitiveSpace["global_resonance"] + nl
    }
    
    see nl + "Final cognitive state:" + nl
    see "  Total symbols: " + len(oCognitiveSpace["symbols"]) + nl
    see "  Final global resonance: " + oCognitiveSpace["global_resonance"] + nl
    
    see nl + "✅ Example 4 completed" + nl + nl
}

func runExample5_PerformanceMonitoring() {
    see "=== Example 5: Performance Monitoring ===" + nl
    see "Demonstrating real-time performance monitoring" + nl + nl
    
    # Initialize performance engine
    oPerformanceEngine = new PerformanceEngine()
    oPerformanceEngine.init()
    
    # Monitor different operations
    see "Monitoring symbol creation performance..." + nl
    aResult1 = oPerformanceEngine.measureProcessingSpeed(null, 100)
    
    see "Monitoring memory efficiency..." + nl
    aResult2 = oPerformanceEngine.measureMemoryEfficiency(50)
    
    see "Monitoring text processing..." + nl
    cTestText = "هذا مثال على معالجة النصوص العربية"
    aResult3 = oPerformanceEngine.measureTextProcessingSpeed(cTestText)
    
    # Display performance summary
    see nl + "Performance Summary:" + nl
    see "  Processing speed: " + aResult1["processing_rate"] + " symbols/second" + nl
    see "  Memory growth: " + aResult2["memory_growth"] + " MB" + nl
    see "  Text processing: " + aResult3["char_rate"] + " characters/second" + nl
    
    see nl + "✅ Example 5 completed" + nl + nl
}

func runExample6_SystemEvaluation() {
    see "=== Example 6: System Evaluation ===" + nl
    see "Demonstrating comprehensive system evaluation" + nl + nl
    
    # Create test scenarios
    see "Setting up evaluation scenarios..." + nl
    
    # Scenario 1: Accuracy evaluation
    aTestCases = [
        {"input": "كتاب", "expected_roots": ["ك", "ت", "ب"]},
        {"input": "مدرسة", "expected_roots": ["د", "ر", "س"]},
        {"input": "طالب", "expected_roots": ["ط", "ل", "ب"]}
    ]
    
    see "Evaluating trilateral root extraction accuracy..." + nl
    nCorrect = 0
    nTotal = len(aTestCases)
    
    for aTestCase in aTestCases {
        cWord = aTestCase["input"]
        aExpectedRoots = aTestCase["expected_roots"]
        aActualRoots = extractTriliateralRoots(cWord)
        
        bCorrect = compareRootArrays(aExpectedRoots, aActualRoots)
        if bCorrect {
            nCorrect++
        }
        
        see "  " + cWord + ": expected " + listToString(aExpectedRoots) + 
            ", got " + listToString(aActualRoots) + 
            " (" + (bCorrect ? "✅" : "❌") + ")" + nl
    }
    
    nAccuracy = (nCorrect / nTotal) * 100
    see "Overall accuracy: " + nAccuracy + "% (" + nCorrect + "/" + nTotal + ")" + nl
    
    # Scenario 2: Performance evaluation
    see nl + "Evaluating system performance..." + nl
    
    nStartTime = clock()
    
    # Simulate complex operations
    for i = 1 to 50 {
        oSymbol = createMorgenSymbol("eval_" + i, "test", [i, i+1, i+2], i, i*7)
        # Process symbol
    }
    
    nEndTime = clock()
    nElapsedTime = (nEndTime - nStartTime) / 1000.0
    
    see "Processed 50 symbols in " + nElapsedTime + " seconds" + nl
    see "Performance rate: " + (50 / nElapsedTime) + " symbols/second" + nl
    
    # Overall system grade
    see nl + "System Evaluation Summary:" + nl
    see "  Accuracy: " + nAccuracy + "%" + nl
    see "  Performance: " + (50 / nElapsedTime) + " symbols/second" + nl
    see "  Overall Grade: " + calculateSystemGrade(nAccuracy, 50 / nElapsedTime) + nl
    
    see nl + "✅ Example 6 completed" + nl + nl
}

# Utility functions for examples

func createMorgenSymbol(cId, cType, aGenome, nRadius, nAngle) {
    return {
        "id": cId,
        "type": cType,
        "genome": aGenome,
        "radius": nRadius,
        "angle": nAngle,
        "energy": random(100) / 10.0,
        "created_at": time()
    }
}

func createCognitiveSpace(nHornDepth) {
    return {
        "horn_depth": nHornDepth,
        "symbols": [],
        "global_resonance": 0.0,
        "epoch": 0
    }
}

func addSymbolToSpace(oCognitiveSpace, oSymbol) {
    add(oCognitiveSpace["symbols"], oSymbol)
    updateGlobalResonance(oCognitiveSpace)
}

func calculatePolarDistance(oSymbol1, oSymbol2) {
    nR1 = oSymbol1["radius"]
    nTheta1 = oSymbol1["angle"] * 3.14159 / 180  # Convert to radians
    nR2 = oSymbol2["radius"]
    nTheta2 = oSymbol2["angle"] * 3.14159 / 180
    
    # Polar distance formula
    nDistance = sqrt(nR1*nR1 + nR2*nR2 - 2*nR1*nR2*cos(nTheta1 - nTheta2))
    return nDistance
}

func calculateGenomeSimilarity(aGenome1, aGenome2) {
    if len(aGenome1) != len(aGenome2) {
        return 0.0
    }
    
    nSimilarity = 0.0
    for i = 1 to len(aGenome1) {
        nDiff = abs(aGenome1[i] - aGenome2[i])
        nSimilarity += (10 - nDiff) / 10.0  # Normalize to 0-1
    }
    
    return nSimilarity / len(aGenome1)
}

func findNearestSymbols(oCognitiveSpace, oTargetSymbol, nCount) {
    aDistances = []
    
    for oSymbol in oCognitiveSpace["symbols"] {
        if oSymbol["id"] != oTargetSymbol["id"] {
            nDistance = calculatePolarDistance(oTargetSymbol, oSymbol)
            add(aDistances, {"symbol": oSymbol, "distance": nDistance})
        }
    }
    
    # Sort by distance (simple bubble sort)
    for i = 1 to len(aDistances) - 1 {
        for j = 1 to len(aDistances) - i {
            if aDistances[j]["distance"] > aDistances[j+1]["distance"] {
                temp = aDistances[j]
                aDistances[j] = aDistances[j+1]
                aDistances[j+1] = temp
            }
        }
    }
    
    # Return top N
    aNearestSymbols = []
    for i = 1 to min(nCount, len(aDistances)) {
        add(aNearestSymbols, aDistances[i]["symbol"])
    }
    
    return aNearestSymbols
}

func extractWords(cText) {
    # Simple word extraction (split by spaces)
    return split(cText, " ")
}

func extractTriliateralRoots(cWord) {
    # Simplified trilateral root extraction
    if len(cWord) >= 3 {
        return [substr(cWord, 1, 1), substr(cWord, 2, 1), substr(cWord, 3, 1)]
    else
        return [cWord]
    }
}

func createArabicWordSymbol(cWord, aRoots) {
    return createMorgenSymbol("word_" + cWord, "arabic_word", aRoots, 
                            len(cWord), len(cWord) * 30)
}

func calculateSemanticSimilarity(cWord1, cWord2) {
    # Simplified semantic similarity based on word length and first character
    nLengthSim = 1.0 - abs(len(cWord1) - len(cWord2)) / 10.0
    nCharSim = (substr(cWord1, 1, 1) = substr(cWord2, 1, 1)) ? 0.5 : 0.0
    return (nLengthSim + nCharSim) / 2.0
}

func hallPhase(oCognitiveSpace) {
    # Simulate decomposition phase
    aElements = []
    for oSymbol in oCognitiveSpace["symbols"] {
        for nElement in oSymbol["genome"] {
            add(aElements, {"value": nElement, "source": oSymbol["id"]})
        }
    }
    return aElements
}

func lammPhase(aElements) {
    # Simulate recombination phase
    aCombinations = []
    for i = 1 to min(5, len(aElements) / 2) {
        nIdx1 = random(len(aElements))
        nIdx2 = random(len(aElements))
        if nIdx1 != nIdx2 {
            add(aCombinations, {
                "elements": [aElements[nIdx1], aElements[nIdx2]],
                "strength": random(100) / 100.0
            })
        }
    }
    return aCombinations
}

func hulmPhase(oCognitiveSpace, aCombinations) {
    # Simulate integration phase
    for aCombination in aCombinations {
        if aCombination["strength"] > 0.5 {
            oNewSymbol = createMorgenSymbol("integrated_" + len(oCognitiveSpace["symbols"]), 
                                         "emergent", [1, 2, 3], random(5), random(360))
            add(oCognitiveSpace["symbols"], oNewSymbol)
        }
    }
}

func updateGlobalResonance(oCognitiveSpace) {
    # Simple global resonance calculation
    nTotalEnergy = 0
    for oSymbol in oCognitiveSpace["symbols"] {
        nTotalEnergy += oSymbol["energy"]
    }
    oCognitiveSpace["global_resonance"] = nTotalEnergy / len(oCognitiveSpace["symbols"])
}

func compareRootArrays(aExpected, aActual) {
    if len(aExpected) != len(aActual) {
        return false
    }
    
    for i = 1 to len(aExpected) {
        if aExpected[i] != aActual[i] {
            return false
        }
    }
    
    return true
}

func listToString(aList) {
    cResult = "["
    for i = 1 to len(aList) {
        if i > 1 {
            cResult += ", "
        }
        cResult += aList[i]
    }
    cResult += "]"
    return cResult
}

func calculateSystemGrade(nAccuracy, nPerformance) {
    nScore = (nAccuracy + min(nPerformance, 100)) / 2
    
    if nScore >= 90 {
        return "A+ (Excellent)"
    } elseif nScore >= 80 {
        return "A (Very Good)"
    } elseif nScore >= 70 {
        return "B (Good)"
    } elseif nScore >= 60 {
        return "C (Satisfactory)"
    } else {
        return "D (Needs Improvement)"
    }
}

# Run main function
main()

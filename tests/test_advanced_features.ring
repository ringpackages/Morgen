# ==============================================================================
# File: test_advanced_features.ring
# Description: Tests for advanced features in Morgen AI (Phase 1)
# Author: Morgen AI Project
# ==============================================================================

load "../morgen/space.ring"
load "../morgen/language/char_definitions.ring"

/*
Function: createAdvancedTestSpace
Description: Creates a test space for advanced feature testing
*/
func createAdvancedTestSpace {
    see "Creating advanced test space..." + nl
    
    oSpace = new oMorgenSpace(5)
    
    # Add Arabic characters
    aChars = createArabicCharacterSymbols()
    for i = 1 to min(12, len(aChars)) {
        oSpace.addSymbol(aChars[i])
    }
    
    # Create some roots
    if len(aChars) >= 9 {
        oRoot1 = createTriconsontalRoot(aChars[1], aChars[2], aChars[3])
        oRoot2 = createTriconsontalRoot(aChars[4], aChars[5], aChars[6])
        oRoot3 = createTriconsontalRoot(aChars[7], aChars[8], aChars[9])
        
        if isObject(oRoot1) { oSpace.addSymbol(oRoot1) }
        if isObject(oRoot2) { oSpace.addSymbol(oRoot2) }
        if isObject(oRoot3) { oSpace.addSymbol(oRoot3) }
    }
    
    # Add some complex symbols for testing
    oComplex1 = new MorgenSymbol("complex_alpha", "concept", [1, 2, 1, 2, 2, 1, 1, 2], 0.85, 45, null)
    oComplex1.nEnergyLevel = 0.4
    oSpace.addSymbol(oComplex1)
    
    oComplex2 = new MorgenSymbol("complex_beta", "concept", [2, 1, 2, 1, 1, 2, 2, 1], 0.87, 135, null)
    oComplex2.nEnergyLevel = 0.3
    oSpace.addSymbol(oComplex2)
    
    oComplex3 = new MorgenSymbol("complex_gamma", "concept", [1, 1, 2, 2, 1, 1, 2, 2], 0.89, 225, null)
    oComplex3.nEnergyLevel = 0.35
    oSpace.addSymbol(oComplex3)
    
    see "Created advanced test space with " + len(oSpace.aSymbols) + " symbols" + nl
    return oSpace
}

/*
Function: testEmergentTriangulation
Description: Tests emergent triangulation functionality
*/
func testEmergentTriangulation oSpace {
    see nl + "=== Testing Emergent Triangulation ===" + nl
    
    # Create a new symbol that should trigger triangulation
    oNewSymbol = new MorgenSymbol("triangulation_test", "test", [1, 2, 1, 2], 0.5, 90, null)
    oNewSymbol.nEnergyLevel = 0.8
    
    see "Creating new symbol: " + oNewSymbol.cId + nl
    see "Position: (r=" + oNewSymbol.nRadius + ", θ=" + oNewSymbol.nAngle + "°)" + nl
    
    nTriangulationsBefore = len(oSpace.aTriangulations)
    
    # Add symbol and attempt emergent triangulation
    oSpace.addSymbol(oNewSymbol)
    oSpace.attemptEmergentTriangulation(oNewSymbol)
    
    nTriangulationsAfter = len(oSpace.aTriangulations)
    
    see "Triangulations before: " + nTriangulationsBefore + nl
    see "Triangulations after: " + nTriangulationsAfter + nl
    
    if nTriangulationsAfter > nTriangulationsBefore {
        see "✓ Emergent triangulation created successfully!" + nl
        
        # Show the new triangulation
        oNewTriangulation = oSpace.aTriangulations[nTriangulationsAfter]
        see "New triangulation type: " + oNewTriangulation["type"] + nl
        see "Triangulation symbols: " + len(oNewTriangulation["symbols"]) + nl
    else 
        see "ℹ No emergent triangulation created (may be normal)" + nl
    }
}

/*
Function: testTriangulationDynamics
Description: Tests triangulation dynamics updates
*/
func testTriangulationDynamics oSpace {
    see nl + "=== Testing Triangulation Dynamics ===" + nl
    
    # Create some triangulations first
    if len(oSpace.aSymbols) >= 6 {
        oSpace.createTriangulation(oSpace.aSymbols[1], oSpace.aSymbols[2], oSpace.aSymbols[3], "test_triangle_1")
        oSpace.createTriangulation(oSpace.aSymbols[4], oSpace.aSymbols[5], oSpace.aSymbols[6], "test_triangle_2")
    }
    
    see "Initial triangulations: " + len(oSpace.aTriangulations) + nl
    
    # Show initial resonance of symbols
    see "Initial symbol resonances:" + nl
    for i = 1 to min(6, len(oSpace.aSymbols)) {
        oSymbol = oSpace.aSymbols[i]
        see "  " + oSymbol.cId + ": " + oSymbol.nResonance + nl
    }
    
    # Update triangulation dynamics
    oSpace.updateTriangulationDynamics()
    
    see nl + "After dynamics update:" + nl
    see "Active triangulations: " + len(oSpace.aTriangulations) + nl
    
    # Show updated resonance
    see "Updated symbol resonances:" + nl
    for i = 1 to min(6, len(oSpace.aSymbols)) {
        oSymbol = oSpace.aSymbols[i]
        see "  " + oSymbol.cId + ": " + oSymbol.nResonance + nl
    }
}

/*
Function: testMeaningCondensation
Description: Tests meaning condensation functionality
*/
func testMeaningCondensation oSpace {
    see nl + "=== Testing Meaning Condensation ===" + nl
    
    # Create similar symbols for condensation testing
    aSimilarSymbols = []
    
    for i = 1 to 4 {
        cSymbolId = "similar_" + i
        aGenome = [1, 2, 1, 1]  # Similar genomes
        nRadius = 0.7 + (i * 0.05)  # Close positions
        nAngle = 30 + (i * 10)
        
        oSimilar = new MorgenSymbol(cSymbolId, "similar_concept", aGenome, nRadius, nAngle, null)
        oSimilar.nEnergyLevel = 0.6
        
        oSpace.addSymbol(oSimilar)
        add(aSimilarSymbols, oSimilar)
    }
    
    see "Created " + len(aSimilarSymbols) + " similar symbols for condensation test" + nl
    
    nSymbolsBefore = len(oSpace.aSymbols)
    
    # Test condensation
    oSpace.createMeaningCondensationCandidates()
    
    see "Condensation candidates created: " + len(oSpace.aDreamBuffer_Candidates) + nl
    
    # Check for condensed symbols
    nCondensedCount = 0
    for aCandidate in oSpace.aDreamBuffer_Candidates {
        oCandidate = aCandidate[1]
        if isObject(oCandidate) and oCandidate.nCondensationValue > 0 {
            nCondensedCount++
            see "Condensed symbol: " + oCandidate.cId + 
                " (condensed " + oCandidate.nCondensationValue + " symbols)" + nl
        }
    }
    
    see "Total condensed symbols created: " + nCondensedCount + nl
}

/*
Function: testAdvancedDreamCycle
Description: Tests the advanced dream cycle with all features
*/
func testAdvancedDreamCycle oSpace {
    see nl + "=== Testing Advanced Dream Cycle ===" + nl
    
    # Show initial state
    see "Initial state:" + nl
    see "  Symbols: " + len(oSpace.aSymbols) + nl
    see "  Triangulations: " + len(oSpace.aTriangulations) + nl
    see "  Galaxies: " + len(oSpace.aGalaxies) + nl
    see "  Active waves: " + len(oSpace.aWaveFronts) + nl
    see "  Global resonance: " + oSpace.nGlobalResonance + nl
    
    # Run advanced dream cycle
    oSpace.advancedDreamCycle()
    
    # Show final state
    see nl + "After advanced dream cycle:" + nl
    see "  Symbols: " + len(oSpace.aSymbols) + nl
    see "  Triangulations: " + len(oSpace.aTriangulations) + nl
    see "  Galaxies: " + len(oSpace.aGalaxies) + nl
    see "  Active waves: " + len(oSpace.aWaveFronts) + nl
    see "  Global resonance: " + oSpace.nGlobalResonance + nl
    see "  Epoch: " + oSpace.nEpoch + nl
    
    # Analyze symbol types
    nArabicLetters = 0
    nRoots = 0
    nCondensed = 0
    nOffspring = 0
    nSeeds = 0
    
    for oSymbol in oSpace.aSymbols {
        if isObject(oSymbol) {
            if oSymbol.cType = "arabic_letter" {
                nArabicLetters++
            elseif oSymbol.cType = "triconsonantal_root" 
                nRoots++
            elseif oSymbol.nCondensationValue > 0 
                nCondensed++
            elseif oSymbol.cType = "offspring" or oSymbol.cType = "seed_offspring" 
                nOffspring++
            elseif oSymbol.bIsSeed 
                nSeeds++
            }
        }
    }
    
    see nl + "Symbol type distribution:" + nl
    see "  Arabic letters: " + nArabicLetters + nl
    see "  Roots: " + nRoots + nl
    see "  Condensed: " + nCondensed + nl
    see "  Offspring: " + nOffspring + nl
    see "  Seeds: " + nSeeds + nl
}

/*
Function: testWaveInfluence
Description: Tests wave influence on symbol behavior
*/
func testWaveInfluence oSpace {
    see nl + "=== Testing Wave Influence ===" + nl
    
    # Create waves from different symbols
    if len(oSpace.aSymbols) >= 3 {
        oSpace.initiateWave(oSpace.aSymbols[1], "insight_wave", 0.8)
        oSpace.initiateWave(oSpace.aSymbols[2], "question_wave", 0.6)
        oSpace.initiateWave(oSpace.aSymbols[3], "resonance_wave", 0.7)
    }
    
    see "Initiated " + len(oSpace.aWaveFronts) + " waves" + nl
    
    # Propagate waves
    oSpace.propagateWaves()
    
    # Check wave effects
    nAffectedSymbols = 0
    for oSymbol in oSpace.aSymbols {
        if isObject(oSymbol) and oSpace.isSymbolAffectedByWaves(oSymbol) {
            nAffectedSymbols++
        }
    }
    
    see "Symbols affected by waves: " + nAffectedSymbols + nl
    
    # Test wave influence on seed creation
    if len(oSpace.aSymbols) > 0 {
        oTestSymbol = oSpace.aSymbols[1]
        aSeeds = oTestSymbol.deconstructToSeeds()
        
        see "Testing wave influence on " + len(aSeeds) + " seeds..." + nl
        
        for oSeed in aSeeds {
            nEnergyBefore = oSeed.nEnergyLevel
            oSpace.applyWaveInfluenceToSeed(oSeed)
            nEnergyAfter = oSeed.nEnergyLevel
            
            if nEnergyAfter != nEnergyBefore {
                see "  Seed " + oSeed.cId + " energy: " + nEnergyBefore + " → " + nEnergyAfter + nl
            }
        }
    }
}

/*
Function: testMultipleAdvancedCycles
Description: Tests multiple advanced dream cycles to observe evolution
*/
func testMultipleAdvancedCycles oSpace {
    see nl + "=== Testing Multiple Advanced Cycles ===" + nl
    
    for nCycle = 1 to 3 {
        see nl + "--- Advanced Cycle #" + nCycle + " ---" + nl
        
        nSymbolsBefore = len(oSpace.aSymbols)
        nTriangulationsBefore = len(oSpace.aTriangulations)
        nGalaxiesBefore = len(oSpace.aGalaxies)
        nResonanceBefore = oSpace.nGlobalResonance
        
        # Run advanced dream cycle
        oSpace.advancedDreamCycle()
        
        # Update global resonance
        oSpace.updateGlobalResonance()
        
        # Show evolution
        see "Cycle " + nCycle + " results:" + nl
        see "  Symbols: " + nSymbolsBefore + " → " + len(oSpace.aSymbols) + nl
        see "  Triangulations: " + nTriangulationsBefore + " → " + len(oSpace.aTriangulations) + nl
        see "  Galaxies: " + nGalaxiesBefore + " → " + len(oSpace.aGalaxies) + nl
        see "  Global resonance: " + nResonanceBefore + " → " + oSpace.nGlobalResonance + nl
        
        # Count condensed symbols
        nCondensedSymbols = 0
        for oSymbol in oSpace.aSymbols {
            if isObject(oSymbol) and oSymbol.nCondensationValue > 0 {
                nCondensedSymbols++
            }
        }
        see "  Condensed symbols: " + nCondensedSymbols + nl
    }
}

/*
Function: main
Description: Main test function for advanced features
*/
func main {
    see "==================================================" + nl
    see "MORGEN AI - ADVANCED FEATURES TESTS (PHASE 1)" + nl
    see "==================================================" + nl
    
    # Create advanced test space
    oSpace = createAdvancedTestSpace()
    
    # Test emergent triangulation
    testEmergentTriangulation(oSpace)
    
    # Test triangulation dynamics
    testTriangulationDynamics(oSpace)
    
    # Test meaning condensation
    testMeaningCondensation(oSpace)
    
    # Test wave influence
    testWaveInfluence(oSpace)
    
    # Test advanced dream cycle
    testAdvancedDreamCycle(oSpace)
    
    # Test multiple cycles
    testMultipleAdvancedCycles(oSpace)
    
    see nl + "=== Final Advanced Space Analysis ===" + nl
    see "Total symbols: " + len(oSpace.aSymbols) + nl
    see "Total triangulations: " + len(oSpace.aTriangulations) + nl
    see "Total galaxies: " + len(oSpace.aGalaxies) + nl
    see "Active waves: " + len(oSpace.aWaveFronts) + nl
    see "Global resonance: " + oSpace.nGlobalResonance + nl
    see "Epochs completed: " + oSpace.nEpoch + nl
    
    see nl + "==================================================" + nl
    see "ADVANCED FEATURES TESTS COMPLETE" + nl
    see "==================================================" + nl
}

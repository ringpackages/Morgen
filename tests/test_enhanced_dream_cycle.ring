# ==============================================================================
# File: test_enhanced_dream_cycle.ring
# Description: Tests for the enhanced dream cycle functionality
# Author: Morgen AI Project
# ==============================================================================

load "../morgen/space.ring"


 see "==================================================" + nl
    see "MORGEN AI - ENHANCED DREAM CYCLE TESTS" + nl
    see "==================================================" + nl
    
    # Create test space
    oSpace = createTestSpace()
    
    # Test individual phases
    testHallPhase(oSpace)
    testLammPhase(oSpace)
    testHulmPhase(oSpace)
    
    # Reset space for complete cycle test
    oSpace = createTestSpace()
    testCompleteDreamCycle(oSpace)
    
    # Reset space for multiple cycles test
    oSpace = createTestSpace()
    testMultipleDreamCycles(oSpace)
    
    see nl + "==================================================" + nl
    see "ENHANCED DREAM CYCLE TESTS COMPLETE" + nl
    see "==================================================" + nl

/*
Function: createTestSpace
Description: Creates a test space with initial symbols
*/
func createTestSpace {
    see "Creating test space with initial symbols..." + nl
    
    oSpace = new MorgenSpace(5)
    
    # Create diverse symbols for testing
    # Seed symbols (basic building blocks)
    oSeed1 = new MorgenSymbol("seed_alpha", "seed", [1, 1], 0.9, 0, null)
    oSeed1.bIsSeed = true
    oSeed1.nEnergyLevel = 0.8
    oSpace.addSymbol(oSeed1)
    
    oSeed2 = new MorgenSymbol("seed_beta", "seed", [2, 2], 0.85, 45, null)
    oSeed2.bIsSeed = true
    oSeed2.nEnergyLevel = 0.9
    oSpace.addSymbol(oSeed2)
    
    oSeed3 = new MorgenSymbol("seed_gamma", "seed", [1, 2], 0.88, 90, null)
    oSeed3.bIsSeed = true
    oSeed3.nEnergyLevel = 0.7
    oSpace.addSymbol(oSeed3)
    
    # Complex symbols (candidates for decomposition)
    oComplex1 = new MorgenSymbol("complex_delta", "concept", [1, 2, 1, 2, 2, 1], 0.95, 135, null)
    oComplex1.nEnergyLevel = 0.3  # Low energy - candidate for decomposition
    oSpace.addSymbol(oComplex1)
    
    oComplex2 = new MorgenSymbol("complex_epsilon", "experience", [2, 1, 2, 1, 1, 2], 0.92, 180, null)
    oComplex2.nEnergyLevel = 0.2  # Very low energy
    oSpace.addSymbol(oComplex2)
    
    # Medium complexity symbols
    oMedium1 = new MorgenSymbol("medium_zeta", "pattern", [1, 1, 2, 2], 0.7, 225, null)
    oMedium1.nEnergyLevel = 0.6
    oSpace.addSymbol(oMedium1)
    
    oMedium2 = new MorgenSymbol("medium_eta", "feeling", [2, 2, 1, 1], 0.75, 270, null)
    oMedium2.nEnergyLevel = 0.5
    oSpace.addSymbol(oMedium2)
    
    see "Created space with " + len(oSpace.aSymbols) + " initial symbols" + nl
    return oSpace
}

/*
Function: testHallPhase
Description: Tests the Ḥall (decomposition) phase
*/
func testHallPhase oSpace {
    see nl + "=== Testing Ḥall Phase (Decomposition) ===" + nl
    
    see "Initial state:" + nl
    see "  Total symbols: " + len(oSpace.aSymbols) + nl
    
    # Show symbols before decomposition
    see "Symbols before decomposition:" + nl
    for oSymbol in oSpace.aSymbols {
        see "  " + oSymbol.cId + " - Energy: " + oSymbol.nEnergyLevel + 
            ", Radius: " + oSymbol.nRadius + ", Seed: " + oSymbol.bIsSeed + nl
    }
    
    # Test symbol selection for decomposition
    aSelected = oSpace.selectSymbolsForDecomposition()
    see nl + "Selected " + len(aSelected) + " symbols for decomposition:" + nl
    for oSymbol in aSelected {
        see "  " + oSymbol.cId + " (energy: " + oSymbol.nEnergyLevel + ")" + nl
    }
    
    # Run Ḥall phase
    oSpace.hallPhase()
    
    see nl + "After Ḥall phase:" + nl
    see "  Seeds in buffer: " + len(oSpace.aDreamBuffer_Seeds) + nl
    
    # Show generated seeds
    if len(oSpace.aDreamBuffer_Seeds) > 0 {
        see "Generated seeds:" + nl
        for oSeed in oSpace.aDreamBuffer_Seeds {
            if isObject(oSeed) {
                see "  " + oSeed.cId + " - Genome: " + listToString(oSeed.aGenome) + 
                    ", Energy: " + oSeed.nEnergyLevel + nl
            }
        }
    }
}

/*
Function: testLammPhase
Description: Tests the Lamm (recombination) phase
*/
func testLammPhase oSpace {
    see nl + "=== Testing Lamm Phase (Recombination) ===" + nl
    
    see "Seeds available for recombination: " + len(oSpace.aDreamBuffer_Seeds) + nl
    
    if len(oSpace.aDreamBuffer_Seeds) < 2 {
        see "Not enough seeds for testing Lamm phase" + nl
        return
    }
    
    # Test binding potential assessment
    if len(oSpace.aDreamBuffer_Seeds) >= 2 {
        oSeed1 = oSpace.aDreamBuffer_Seeds[1]
        oSeed2 = oSpace.aDreamBuffer_Seeds[2]
        nPotential = assessBindingPotential(oSeed1, oSeed2, oSpace)
        see "Binding potential between " + oSeed1.cId + " and " + oSeed2.cId + ": " + nPotential + nl
    }
    
    # Run Lamm phase
    oSpace.lammPhase()
    
    see nl + "After Lamm phase:" + nl
    see "  Candidates generated: " + len(oSpace.aDreamBuffer_Candidates) + nl
    
    # Show generated candidates
    if len(oSpace.aDreamBuffer_Candidates) > 0 {
        see "Generated candidates:" + nl
        for aCandidate in oSpace.aDreamBuffer_Candidates {
            oChild = aCandidate[1]
            nScore = aCandidate[2]
            if isObject(oChild) {
                see "  " + oChild.cId + " - Score: " + nScore + 
                    ", Genome: " + listToString(oChild.aGenome) + nl
            }
        }
    }
}

/*
Function: testHulmPhase
Description: Tests the Ḥulm (integration) phase
*/
func testHulmPhase oSpace {
    see nl + "=== Testing Ḥulm Phase (Integration) ===" + nl
    
    nSymbolsBefore = len(oSpace.aSymbols)
    see "Symbols before integration: " + nSymbolsBefore + nl
    see "Candidates available: " + len(oSpace.aDreamBuffer_Candidates) + nl
    
    # Run Ḥulm phase
    oSpace.hulmPhase()
    
    nSymbolsAfter = len(oSpace.aSymbols)
    see nl + "After Ḥulm phase:" + nl
    see "  Symbols after integration: " + nSymbolsAfter + nl
    see "  New symbols integrated: " + (nSymbolsAfter - nSymbolsBefore) + nl
    
    # Show newly integrated symbols
    if nSymbolsAfter > nSymbolsBefore {
        see "Newly integrated symbols:" + nl
        for i = nSymbolsBefore + 1 to nSymbolsAfter {
            oNewSymbol = oSpace.aSymbols[i]
            see "  " + oNewSymbol.cId + " - Position: (r=" + oNewSymbol.nRadius + 
                ", θ=" + oNewSymbol.nAngle + "°), Energy: " + oNewSymbol.nEnergyLevel + nl
        }
    }
}

/*
Function: testCompleteDreamCycle
Description: Tests a complete enhanced dream cycle
*/
func testCompleteDreamCycle oSpace {
    see nl + "=== Testing Complete Enhanced Dream Cycle ===" + nl
    
    nInitialSymbols = len(oSpace.aSymbols)
    nInitialEpoch = oSpace.nEpoch
    
    see "Pre-cycle state:" + nl
    see "  Symbols: " + nInitialSymbols + nl
    see "  Epoch: " + nInitialEpoch + nl
    see "  Global resonance: " + oSpace.nGlobalResonance + nl
    
    # Run complete enhanced dream cycle
    oSpace.enhancedDreamCycle()
    
    see nl + "Post-cycle state:" + nl
    see "  Symbols: " + len(oSpace.aSymbols) + nl
    see "  Epoch: " + oSpace.nEpoch + nl
    see "  Global resonance: " + oSpace.nGlobalResonance + nl
    see "  Net symbol change: " + (len(oSpace.aSymbols) - nInitialSymbols) + nl
}

/*
Function: testMultipleDreamCycles
Description: Tests multiple dream cycles to observe evolution
*/
func testMultipleDreamCycles oSpace {
    see nl + "=== Testing Multiple Dream Cycles ===" + nl
    
    # Track evolution over multiple cycles
    for nCycle = 1 to 5 {
        see nl + "--- Dream Cycle #" + nCycle + " ---" + nl
        
        nSymbolsBefore = len(oSpace.aSymbols)
        nResonanceBefore = oSpace.nGlobalResonance
        
        # Run enhanced dream cycle
        oSpace.enhancedDreamCycle()
        
        # Update global resonance
        oSpace.updateGlobalResonance()
        
        # Show evolution
        see "Cycle " + nCycle + " results:" + nl
        see "  Symbols: " + nSymbolsBefore + " → " + len(oSpace.aSymbols) + nl
        see "  Global resonance: " + nResonanceBefore + " → " + oSpace.nGlobalResonance + nl
        
        # Show energy distribution
        nLowEnergy = 0
        nMediumEnergy = 0
        nHighEnergy = 0
        
        for oSymbol in oSpace.aSymbols {
            if isObject(oSymbol) {
                if oSymbol.nEnergyLevel < 0.3 {
                    nLowEnergy++
                elseif oSymbol.nEnergyLevel < 0.7 
                    nMediumEnergy++
                else 
                    nHighEnergy++
                }
            }
        }
        
        see "  Energy distribution: Low=" + nLowEnergy + 
            ", Medium=" + nMediumEnergy + ", High=" + nHighEnergy + nl
    }
}
